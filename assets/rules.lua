-- SPDX-License-Identifier: MIT
-- Red Furnace. Durable ammunition, timers and tutorial bits live in engine variables.
-- 0..3 pressure; 5 checkpoint; 6 secret; 10..29 loadouts/input; 30..49 practice/protection;
-- 50..52 monster grudges; 53..58 attacks; 60 HUD; 61 flame; 62 difficulty; 63 pack marker.
local rules = {}
local GRUNT,KEY,VALVE,BOSS,MEDKIT,EXIT,SPITTER,HEAVY,MISSILE,AMMO,CACHE,PROTECTION,SECRET = 1,2,3,4,5,6,7,8,9,10,11,12,13
local BARREL,IMPACT,TRACER=14,15,16
local monsters={1,2,3,16,17,25,26,27,28,29,30,31,32,33,34,35,36}
local function near(a,b,r) return (a.x-b.x)^2+(a.z-b.z)^2<r*r end
local function enemy(e) return e.type==GRUNT or e.type==SPITTER or e.type==HEAVY or e.type==BOSS end
local function effect(w,kind,x,z,yaw,style)
    for i=45,64 do
        local e=w.entities[i]
        if e.hp==0 then e.type,e.x,e.z,e.yaw,e.hp,e.flags=kind,x,z,yaw,kind==TRACER and 8 or 36,style;return end
    end
end
local function push(e,yaw,force)
    local x,z=e.x+math.sin(yaw)*force,e.z-math.cos(yaw)*force
    if visible(e.x,e.z,x,z) and visible(x-.28,z-.28,x+.28,z+.28) then e.x,e.z=x,z end
end
local function hit(w,e,amount,yaw)
    if e.flags&1~=0 then effect(w,IMPACT,e.x,e.z,yaw,0);return end
    e.hp=math.max(0,e.hp-amount)
    effect(w,IMPACT,e.x,e.z,yaw,1)
    if e.type~=BOSS then push(e,yaw,amount>20 and .38 or .14) end
end
local function blast(w,x,z,exclude)
    effect(w,IMPACT,x,z,0,2)
    for i,e in ipairs(w.entities) do
        local d=math.sqrt((e.x-x)^2+(e.z-z)^2)
        if i~=exclude and e.hp>0 and (enemy(e) or e.type==BARREL) and d<2.6 and visible(x,z,e.x,e.z) then
            local yaw=math.atan(e.x-x,-(e.z-z))
            if e.type==BARREL then e.hp=0;blast(w,e.x,e.z,i)
            else hit(w,e,math.floor(62*(1-d/3)),yaw) end
        end
    end
    for _,p in ipairs(w.players) do
        if p.connected==1 and p.zone==1 and p.hp>0 and near(p,{x=x,z=z},1.4) and visible(x,z,p.x,p.z) then
            p.hp=math.max(0,p.hp-16);push(p,math.atan(p.x-x,-(p.z-z)),.3)
        end
    end
end
local function damage(w,p,i,n)
    local factor=engine.get(62)==1 and .5 or engine.get(62)==2 and 1.5 or 1
    if engine.get(41+i)<=w.tick then p.hp=math.max(0,p.hp-math.floor(n*factor)) end
end
local function missile(w,x,z,yaw,source)
    for i=18,24 do
        local e=w.entities[i]
        if e.hp==0 then e.type,e.x,e.z,e.yaw,e.hp,e.flags=MISSILE,x,z,yaw,180,source;return end
    end
end
local function aim(a,b) return math.atan(b.x-a.x,-(b.z-a.z)) end
local function shot(w,p,yaw,range,spread,damage_amount)
    local hit_index,distance=nil,range
    for i,e in ipairs(w.entities) do
        if (enemy(e) or e.type==BARREL) and e.hp>0 then
            local dx,dz=e.x-p.x,e.z-p.z
            local along=dx*math.sin(yaw)-dz*math.cos(yaw)
            local across=math.abs(dx*math.cos(yaw)+dz*math.sin(yaw))
            if along>0 and along<distance and across<(e.type==BOSS and .85 or .4)+along*spread and visible(p.x,p.z,e.x,e.z) then hit_index,distance=i,along end
        end
    end
    local x,z=p.x+math.sin(yaw)*distance,p.z-math.cos(yaw)*distance
    if not hit_index then
        distance=0;x,z=p.x,p.z
        while distance<range do
            local next_distance=math.min(range,distance+.12)
            local xx,zz=p.x+math.sin(yaw)*next_distance,p.z-math.cos(yaw)*next_distance
            if not visible(p.x,p.z,xx,zz) then break end
            distance=next_distance;x,z=xx,zz
        end
    end
    effect(w,TRACER,x,z,yaw,0)
    if hit_index then
        local target=w.entities[hit_index]
        if target.type==BARREL then
            target.hp=math.max(0,target.hp-damage_amount)
            effect(w,IMPACT,x,z,yaw,0)
            if target.hp==0 then blast(w,x,z,hit_index) end
        else hit(w,target,damage_amount,yaw)
        end
    else effect(w,IMPACT,x,z,yaw,0) end
end
function rules.init(w)
    w.keys,w.valves,w.phase,w.won=0,0,0,0
    engine.complete(13,0) -- Run state resets; personal ornaments stay in the transactional store.
    for i=0,61 do if i<30 or i>33 then engine.set(i,0) end end
    for i=18,64 do w.entities[i]={type=0,hp=0,x=0,z=0,yaw=0,flags=0} end
    local placements={
        {GRUNT,5.5,7.5,36},{SPITTER,12.5,7.5,48},{HEAVY,19.5,9.5,60},
        {KEY,4.5,25.5,1},{KEY,36.5,4.5,1},{VALVE,12.5,12.5,1},{VALVE,20.5,12.5,1},
        {BOSS,20.5,4.5,144},{MEDKIT,6.5,12.5,1},{MEDKIT,18.5,11.5,1},{EXIT,20.5,2.5,1},
        {CACHE,4.5,13.5,1},{AMMO,12.5,3.5,1},{PROTECTION,6.5,11.5,1},{SECRET,1.5,2.5,1},
        {GRUNT,5.5,4.5,36},{SPITTER,18.5,3.5,48}}
    for i,e in ipairs(placements) do w.entities[i]={type=e[1],x=e[2],z=e[3],hp=e[4],yaw=0,flags=0} end
    local reinforcements={
        {GRUNT,4.5,20.5,36},{SPITTER,8.5,25.5,48},{GRUNT,17.5,26.5,36},
        {HEAVY,16.5,18.5,60},{GRUNT,27.5,12.5,36},{SPITTER,34.5,9.5,48},
        {GRUNT,42.5,4.5,36},{HEAVY,37.5,12.5,60},{SPITTER,39.5,24.5,48},
        {GRUNT,28.5,25.5,36},{GRUNT,41.5,17.5,36},{SPITTER,20.5,26.5,48}}
    for i,e in ipairs(reinforcements) do w.entities[24+i]={type=e[1],x=e[2],z=e[3],hp=e[4],yaw=0,flags=0} end
    for i,e in ipairs({{5.5,23.5},{7.5,23.5},{18.5,19.5},{26.5,12.5},{35.5,8.5},{41.5,5.5},{39.5,23.5},{29.5,26.5}}) do
        w.entities[36+i]={type=BARREL,x=e[1],z=e[2],hp=24,yaw=0,flags=0}
    end
    w.entities[8].flags=1
    engine.set(63,13)
    for i=1,4 do engine.set(33+i,1) end
    return w
end
local function practice(w,p,i,pressed)
    local bits=engine.get(29+i)
    local target_yaw=math.atan((10-p.x)*1.25,-(11-p.z)*3.75)
    if near(p,{x=10,z=11},4) and p.fire~=0 and math.cos(target_yaw-p.yaw)>.98 then bits=bits|1 end
    if near(p,{x=12,z=10},1.5) and pressed&2~=0 then bits=bits|2 end
    if near(p,{x=14,z=11},1.5) and pressed&4~=0 then bits=bits|4;engine.set(37+i,w.tick+90) end
    if near(p,{x=14,z=11},1.5) and p.use~=0 then bits=bits|8 end
    if i==1 and near(p,{x=12,z=10},1.5) and pressed&8~=0 then
        local hall=true
        for _,q in ipairs(w.players) do if q.connected==1 and q.zone~=0 then hall=false end end
        if hall then engine.set(62,(engine.get(62)+1)%3) end
    end
    p.y=engine.get(37+i)>w.tick and .55 or 0
    engine.set(29+i,bits)
end
local function loadout(w,p,i,pressed)
    local mask=engine.get(25+i)
    for j=12,15 do
        local e=w.entities[j];local bit=1<<(j-12)
        if mask&bit==0 and near(p,e,.9) then
            mask=mask|bit
            if j==12 then engine.set(33+i,engine.get(33+i)|2);engine.set(9+i,engine.get(62)==2 and 12 or 18)
            elseif j==13 then engine.set(33+i,engine.get(33+i)|4);engine.set(13+i,engine.get(62)==2 and 6 or 8)
            elseif j==14 then engine.set(41+i,w.tick+1200)
            else engine.set(6,1);engine.set(9+i,engine.get(9+i)+12);engine.set(13+i,engine.get(13+i)+4);p.hp=100 end
        end
    end
    engine.set(25+i,mask)
    local weapon=engine.get(17+i)
    if pressed&1~=0 then
        repeat weapon=(weapon+1)%3 until engine.get(33+i)&(1<<weapon)~=0
    end
    if weapon==1 and engine.get(9+i)==0 or weapon==2 and engine.get(13+i)==0 then weapon=0 end
    engine.set(17+i,weapon)
    if p.fire~=0 and p.cooldown==0 then
        if weapon==0 then shot(w,p,p.yaw,30,0,12);p.cooldown=12
        elseif weapon==1 then
            for n=-1,1 do shot(w,p,p.yaw+n*.06,12,.025,10) end
            engine.set(9+i,engine.get(9+i)-1);p.cooldown=30
        else missile(w,p.x,p.z,p.yaw,0);engine.set(13+i,engine.get(13+i)-1);p.cooldown=42 end
    end
end
local function projectiles(w)
    for i=18,24 do
        local e=w.entities[i]
        if e.hp>0 then
            local x,z=e.x+math.sin(e.yaw)*.11,e.z-math.cos(e.yaw)*.11
            if x<1 or x>47 or z<1 or z>31 or not visible(e.x,e.z,x,z) then
                if e.flags==0 then blast(w,e.x,e.z,i) else effect(w,IMPACT,e.x,e.z,e.yaw,0) end
                e.hp=0
            else
                e.x,e.z,e.hp=x,z,e.hp-1
                for _,j in ipairs(monsters) do
                    local target=w.entities[j]
                    local faction=target.type==GRUNT and 1 or target.type==SPITTER and 2 or 3
                    if target.hp>0 and faction~=e.flags and near(e,target,.45) then
                        hit(w,target,e.flags==0 and 40 or 16,e.yaw)
                        if e.flags==0 then blast(w,e.x,e.z,j) end
                        if e.flags>0 then engine.set(49+faction,e.flags) end
                        e.hp=0;break
                    end
                end
                if e.hp>0 then
                    for j=37,44 do
                        local barrel=w.entities[j]
                        if barrel.hp>0 and near(e,barrel,.42) then barrel.hp=0;e.hp=0;blast(w,barrel.x,barrel.z,j);break end
                    end
                end
                if e.hp==0 then effect(w,IMPACT,e.x,e.z,e.yaw,2) end
                local boss=w.entities[8]
                if e.hp>0 and e.flags==0 and near(e,boss,.9) then
                    hit(w,boss,40,e.yaw);blast(w,e.x,e.z,8)
                    e.hp=0
                end
                if e.hp>0 and e.flags>0 then
                    for j,p in ipairs(w.players) do
                        if p.connected==1 and p.zone==1 and p.hp>0 and near(p,e,.35) then damage(w,p,j,12);push(p,e.yaw,.22);effect(w,IMPACT,e.x,e.z,e.yaw,0);e.hp=0;break end
                    end
                end
            end
        end
    end
end
local function monsters_step(w)
    for n,index in ipairs(monsters) do
        local e=w.entities[index]
        if e.hp>0 then
            local faction=e.type==GRUNT and 1 or e.type==SPITTER and 2 or 3
            local target,player,dist=nil,nil,11
            local grudge=engine.get(49+faction)
            if grudge>0 then
                for _,j in ipairs(monsters) do
                    local q=w.entities[j];local f=q.type==GRUNT and 1 or q.type==SPITTER and 2 or 3
                    if f==grudge and q.hp>0 then target=q;break end
                end
            end
            if not target then
                for i,p in ipairs(w.players) do
                    local d=(p.x-e.x)^2+(p.z-e.z)^2
                    if p.connected==1 and p.zone==1 and p.hp>0 and d<dist*dist and visible(e.x,e.z,p.x,p.z) then target,player,dist=p,i,math.sqrt(d) end
                end
            end
            if target and visible(e.x,e.z,target.x,target.z) then
                e.yaw=aim(e,target)
                if e.type==GRUNT and not near(e,target,.8) then
                    local speed=engine.get(62)==2 and .026 or .018
                    local x,z=e.x+math.sin(e.yaw)*speed,e.z-math.cos(e.yaw)*speed
                    if visible(e.x,e.z,x,z) then e.x,e.z=x,z end
                elseif n<=5 and w.tick>=engine.get(52+n) or n>5 and (w.tick+index*17)%105==0 then
                    if n<=5 then engine.set(52+n,w.tick+(e.type==HEAVY and 150 or 105)) end
                    if e.type==GRUNT then
                        if player then damage(w,target,player,6) else target.hp=math.max(0,target.hp-8) end
                    else missile(w,e.x,e.z,e.yaw,faction) end
                end
            end
        end
    end
end
local function pressure(w)
    local boss=w.entities[8]
    if w.phase==1 and boss.hp<=72 then
        w.phase,w.valves,boss.flags=2,0,1;engine.set(0,0);engine.set(1,0);engine.set(2,w.tick+60);engine.checkpoint(2)
    end
    if engine.get(1)>0 and w.tick>=engine.get(1) then
        engine.set(1,0);engine.set(0,0);engine.set(2,w.tick+60);w.valves,boss.flags=0,1
    end
    if engine.get(0)>0 and w.tick>=engine.get(0) and engine.get(1)==0 then w.valves=0;engine.set(0,0) end
    if w.valves==3 and engine.get(1)==0 and w.tick>=engine.get(2) then
        local window=engine.get(62)==1 and 900 or engine.get(62)==2 and 480 or 720
        engine.set(1,w.tick+window);engine.set(3,engine.get(3)+1);boss.flags=0
        if w.phase==0 then w.phase=1 end
    end
    w.entities[6].flags=w.valves&1~=0 and 2 or 0
    w.entities[7].flags=w.valves&2~=0 and 2 or 0
    if w.phase==2 and boss.hp==0 and engine.get(1)>w.tick and w.keys==3 then
        w.won,w.phase=1,3;engine.complete(13);engine.checkpoint(3)
    end
end
local function boss_step(w)
    if w.won==1 or w.entities[8].hp==0 then engine.set(61,0);return end
    local boss=w.entities[8];local cycle=w.tick%300
    engine.set(59,cycle>=30 and cycle<60 and 1 or 0)
    engine.set(61,cycle>=180 and cycle<240 and 1 or cycle>=240 and cycle<270 and 2 or 0)
    for i,p in ipairs(w.players) do
        if p.connected==1 and p.zone==1 and p.hp>0 then
            if near(p,boss,12) and visible(p.x,p.z,boss.x,boss.z) and cycle>=60 and cycle<=84 and cycle%12==0 then
                -- Three separated shots, aimed at one seat per cycle; always retain a dodge lane.
                if i==(math.floor(w.tick/300)%4)+1 or w.players[(math.floor(w.tick/300)%4)+1].connected==0 then
                    missile(w,boss.x,boss.z,aim(boss,p)+(cycle-72)*.012,3);break
                end
            end
        end
    end
    if w.tick%30==0 then
        for i,p in ipairs(w.players) do
            if p.connected==1 and p.zone==1 then
                local flame=cycle>=240 and cycle<270 and p.z>6.2 and p.z<6.9 and p.x>17
                local floor=w.phase==2 and p.x>18 and p.z>9.2 and p.z<9.8
                local shortcut=p.x>10 and p.x<14 and p.z>10.8 and p.z<11.3
                if flame or floor or shortcut then damage(w,p,i,8) end
            end
        end
    end
end
function rules.step(w)
    for i=45,64 do
        local e=w.entities[i]
        if e.hp>0 then e.hp=e.hp-1 end
    end
    for i,p in ipairs(w.players) do
        if p.connected==1 then
            local buttons=(p.next~=0 and 1 or 0)|(p.command~=0 and 2 or 0)|(p.jump~=0 and 4 or 0)|(p.alt~=0 and 8 or 0)
            local pressed=buttons&~engine.get(21+i);engine.set(21+i,buttons)
            if p.hp<=0 then
                if p.respawn==0 then p.respawn=w.tick+180 end
                if w.tick>=p.respawn then p.hp,p.respawn,p.x,p.z=100,0,p.zone==1 and 3.5 or 12,p.zone==1 and 12.5 or 12 end
            elseif p.zone==0 then
                practice(w,p,i,pressed)
                if p.use~=0 and p.portal==13 and w.unlocked>=13 then
                    local hall=true
                    for _,q in ipairs(w.players) do if q.connected==1 and q.zone~=0 then hall=false end end
                    if w.won==1 and hall then rules.init(w) end
                    p.zone,p.x,p.z,p.y,p.eligible=1,3.5,12.5,0,w.won==0 and 1 or 0
                end
            else
                loadout(w,p,i,pressed)
                for j=4,5 do if w.entities[j].hp>0 and near(p,w.entities[j],.8) then w.entities[j].hp=0;w.keys=w.keys|(1<<(j-4));engine.checkpoint(w.keys) end end
                if w.keys==3 and p.use~=0 and engine.get(1)==0 and w.tick>=engine.get(2) then
                    for j=6,7 do
                        local bit=1<<(j-6)
                        if near(p,w.entities[j],1.5) and w.valves&bit==0 then w.valves=w.valves|bit;if engine.get(0)==0 then engine.set(0,w.tick+600) end end
                    end
                end
                for j=9,10 do if w.entities[j].hp>0 and p.hp<100 and near(p,w.entities[j],.8) then p.hp=math.min(100,p.hp+50);w.entities[j].hp=0 end end
                if w.won==1 and p.use~=0 and near(p,w.entities[11],1.5) then p.zone,p.x,p.z,p.hp=0,12,5,100 end
            end
        end
    end
    if w.won==0 then projectiles(w);monsters_step(w);pressure(w);boss_step(w) end
    engine.set(60,w.won==1 and 5 or w.keys~=3 and 0 or engine.get(1)>w.tick and 3 or w.phase==2 and 4 or 2)
    return w
end
return rules
