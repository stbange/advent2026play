-- SPDX-License-Identifier: MIT
-- A playable authoring fixture. Every persistent value belongs to the C snapshot.
local rules = {}
local function near(a,b,r) return (a.x-b.x)^2+(a.z-b.z)^2 < r*r end
local function edge(p,name,index)
    local down=p[name]~=0
    local pressed=down and engine.get(index)==0
    engine.set(index,down and 1 or 0)
    return pressed
end
function rules.init(w)
    if engine.get(0)==0 then
        engine.set(0,1)
        engine.team(0,0,10,10)
        engine.set(1,engine.spawn{x=19,y=.01,z=5,hp=160,max_hp=160,team=1,owner=1,mode=3,kind=1})
        engine.set(2,engine.spawn{x=4,y=.01,z=9,carried=100,mode=3,kind=2})
        engine.set(3,engine.spawn{x=9,y=.01,z=12,mode=3,kind=3})
        engine.set(60,0)
    end
    return w
end
function rules.step(w)
    local boss=engine.actor(engine.get(1))
    for i,p in ipairs(w.players) do
        if p.connected==1 then
            local handle=engine.get(9+i)
            local body=engine.actor(handle)
            if p.zone==0 then
                if p.use~=0 and p.portal==engine.day and w.unlocked>=engine.day then
                    if not body or body.hp==0 then
                        if body then engine.remove(handle) end
                        handle=engine.spawn{x=3+i*.6,y=.01,z=12,owner=i-1,team=0}
                        engine.set(9+i,handle)
                        engine.item(handle,0,3)
                    end
                    engine.possess(i-1,handle)
                    p.zone,p.eligible=1,1
                end
            elseif body then
                if body.hp==0 then
                    engine.heal(handle,100,100)
                    engine.teleport(handle,0)
                end
                if edge(p,'next',25+i) then
                    local mode=(engine.get(17+i)+1)%4
                    engine.set(17+i,mode)
                    engine.mode(handle,mode==3 and 0 or mode,mode==1 and 7 or 3.5)
                    engine.tactical(mode==3 and 1 or 0,0,mode==3 and 1 or 0)
                end
                local mode=engine.get(17+i)
                if p.fire~=0 and w.tick>=engine.get(13+i) then
                    engine.projectile(handle,math.sin(p.yaw)*math.cos(p.pitch),math.sin(p.pitch),-math.cos(p.yaw)*math.cos(p.pitch),18,12,4,10,180)
                    engine.set(13+i,w.tick+12)
                end
                if edge(p,'command',21+i) then
                    if near(body,{x=4,z=9},2) then engine.order(i-1,handle,4,4,0,9,engine.get(2))
                    elseif near(body,{x=9,z=12},2) and engine.get(8)==0 then
                        local tower=engine.construct(engine.get(3),10,60,2,1)
                        if tower~=0 then engine.set(8,tower);engine.set(60,2) end
                    end
                end
                if p.use~=0 then
                    if mode==3 then
                        local node=(engine.get(45+i)+1)%7
                        if engine.teleport(handle,node) then engine.set(45+i,node) end
                    elseif near(body,{x=3,z=12},2) and body.carried>0 then
                        engine.deliver(handle)
                        engine.order(i-1,handle,0,0,0,0,0)
                        if engine.team(0).credits>=10 then engine.set(60,1) end
                    end
                end
                if edge(p,'alt',29+i) then
                    if mode==3 then engine.end_turn()
                    elseif body.hp<100 and engine.inventory(handle,0)>0 then engine.item(handle,0,-1);engine.heal(handle,30,20)
                    else engine.deform(engine.collision_start+12,3,3,1,1,.2) end
                end
                if p.jump~=0 and near(body,{x=8,z=6},2.5) then engine.climb(handle,8,.8,6) end
            end
        end
    end
    if engine.get(8)==0 then engine.heal(engine.get(1),160,0)
    else
        local tower=engine.actor(engine.get(8))
        if tower then engine.order(0,engine.get(8),2,19,0,5,engine.get(1)) end
        if boss and boss.hp<=80 and engine.get(7)==0 then
            engine.set(7,1)
            engine.platform(engine.collision_start,0,.4,0)
            engine.checkpoint(2)
        end
        if boss and boss.hp==0 then engine.complete(engine.day);engine.set(60,3);engine.checkpoint(3) end
    end
    if w.tick%60==0 then engine.end_turn() end
    return w
end
function rules.migrate(w) return w end
return rules
