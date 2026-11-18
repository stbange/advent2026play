-- SPDX-License-Identifier: MIT
local cfg={["points"]={{24,3,146},{44,3,146},{66,3,146},{90,10,132},{126,10,126},{152,12,111},{177,8,92},{193,8,92},{218,8,92},{251,8,92},{258,11,112},{260,17,142},{265,20,163},{282,26,174},{278,13,177},{239,20,145},{182,17,135},{144,17,150},{66,12,155},{19,3,146},{52,3,146},{218,8,73},{222,8,60},{243,22,76},{117,7,145},{200,9,106},{254,12,127},{288,18,147},{105,11,116},{254,25,103},{79,4,146},{206,8,101},{222,8,78},{222,9,54},{150,18,153},{38,3,146},{222,8,70},{245,15,53},{250,12,131}},["links"]={{0,1},{0,19},{1,35},{0,35},{35,20},{1,20},{20,2},{2,3},{2,18},{3,4},{3,28},{28,4},{4,5},{4,24},{24,17},{5,6},{6,7},{7,8},{8,31},{31,25},{8,9},{9,10},{10,11},{10,26},{26,11},{11,12},{12,13},{12,14},{13,14},{12,27},{27,11},{11,15},{15,16},{16,17},{16,34},{34,17},{17,18},{24,3},{8,32},{32,21},{21,36},{22,36},{22,33},{23,29},{29,10},{33,37},{37,23},{18,30},{30,2},{5,16},{26,38}},["cargo"]={{["node"]=30,["mana"]=8},{["node"]=28,["mana"]=8,["seal"]=1},{["node"]=8,["mana"]=8,["seal"]=2},{["node"]=26,["mana"]=8,["seal"]=4},{["node"]=27,["mana"]=4},{["node"]=34,["mana"]=4}},["objectives"]={"LIGHT THE KEEP HEART WITH USE. R / F CHANGE HEIGHT.","FLY THROUGH THE GALLERY. CLAIM THE MANA WITH ALT.","THE BALLOON IS WORKING. HUNT THE DUNE KITEWING.","CLAIM THE DUNE SEAL. KEEP ITS BALLOON SAFE.","USE E AT LOFT OR COMMAND AT TOWER TO BUILD.","FLY INTO GLASSWELL. FIND THE GUST SHRINE.","CAST GUST AT THE TETHER OR USE THE SIDE WINCH.","CLAIM THE CAVE SEAL. COMMAND CHANGES THE RETURN LANE.","THE REGENT RAIDS THE KEEP. WARD THE BALLOON.","REACH THE RAVINE SEAL. LIFT STONE OR FLANK ABOVE.","THREE SEALS ARE HOME. FLY TO THE REGENT.","CROSSWIND. FLY AROUND THE TURNING WARD.","SIPHON. BREAK THE TETHER WITH GUST OR BOLTS.","LOW CHASE. EVADE THE DIVE AND FIRE AS IT RECOVERS.","THE KEEP IS SAFE. RETURN AND USE THE HALL PORTAL."},["patches"]={0,8,16,24,32},["upgrades"]={40,52}}
local rules={}
local get,set,actor,inv=engine.get,engine.set,engine.actor,engine.inventory
local BOSS,ALLY,RIVAL,STAGE,SEALS,BUILT,PHASE=1,2,3,4,5,6,7
local SEED,LAYOUT,TOOLS,TIMER=16,15,17,26
local function point(node)local p=cfg.points[node+1];return {x=p[1],y=p[2],z=p[3]}end
local function distance(a,b)return math.sqrt((a.x-b.x)^2+(a.y-b.y)^2+(a.z-b.z)^2)end
local function near(a,b,r)return a and b and distance(a,b)<r end
local function item(h,k,v)return engine.item(h,k,v-inv(h,k))end
local function place(node,kind,hp,mode,team,owner,speed,radius,height)
 local p=point(node)
 return engine.spawn{x=p.x,y=p.y,z=p.z,kind=kind,hp=hp,max_hp=hp,mode=mode,team=team or 0,
  owner=owner or 0,speed=speed or 0,radius=radius or .6,height=height or 1.6}
end
local function target(h,node)
 local a=actor(h)
 if not a or not a.hp or a.hp==0 then return end
 local p=point(node)
 if a.target_x~=p.x or a.target_y~=p.y or a.target_z~=p.z or a.order==0 and not near(a,p,.18) then
  engine.order(a.owner,h,1,p.x,p.y,p.z,0)
 end
end
local function goal(node,action,objective,h,spell)
 set(56,node);set(57,action);set(58,h or 0);set(60,objective);set(25,spell or -1)
end
local function checkpoint()
 engine.checkpoint(2000+get(STAGE)*16+get(SEALS))
end
local function advance(stage)
 set(STAGE,stage);checkpoint()
end
local function release(i)
 if get(17+i)==0 then set(17+i,1) end
end
local function pool_node(i)
 if i==5 and get(LAYOUT)%2==0 then return 11 end
 if i==6 and get(LAYOUT)%2==1 then return 17 end
 return cfg.cargo[i].node
end
local function pool(i)
 return actor(get(7+i))
end
local function loose(i)
 local node=pool_node(i)
 local h=place(node,70,1,3,2,0,0,.05)
 if h~=0 then
  item(h,11,1);item(h,1,cfg.cargo[i].seal or 0);set(7+i,h)
 end
end
local function mark_pool(i,owner)
 local h=get(7+i)
 local a=actor(h)
 if not a or inv(h,2)==owner then return false end
 local spec=cfg.cargo[i]
 if owner==2 and (i<5 or spec.seal) then return false end
 local next=place(pool_node(i),70+owner,1,3,2,0,0,.05)
 if next==0 then return false end
 item(next,11,1);item(next,1,spec.seal or 0);item(next,2,owner)
 engine.remove(h);set(7+i,next)
 return true
end
local function managed_enemy(slot,node,kind,hp,speed)
 local h=place(node,kind,hp,speed>0 and 1 or 3,1,0,speed,kind==48 and 1.5 or .65,kind==48 and 3.7 or 1.5)
 if h~=0 then
  item(h,6,(get(SEED)+node)%4)
 end
 set(slot,h)
 return h
end
local function leave(p,i,retire)
 engine.possess(i-1,0)
 if retire then engine.remove(p.body) end
 set(32+(i-1)*4,0)
 p.body,p.zone,p.x,p.y,p.z,p.hp=0,0,12,0,5,100
 p.eligible,p.respawn,p.cooldown=0,0,0
end
function rules.init(w)
 for _,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then return w end end
 local seed=(engine.random(3)&0x3fffffff)+1
 local layout=seed%6+1
 if layout==get(LAYOUT) then layout=layout%6+1 end
 if not engine.reset(seed) then return w end
 for i,p in ipairs(w.players)do if p.zone==1 then leave(p,i,false) end end
 set(SEED,seed);set(LAYOUT,layout);set(63,102);set(TOOLS,1)
 engine.block(36,layout%2==0)
 engine.deform(engine.collision_start+cfg.patches[(layout-1)//2+1],3,3,1,1,3)
 w.won,w.phase,w.keys,w.valves=0,0,0,0
 goal(0,2,0)
 return w
end
local function enter(w,p,i)
 local base=32+(i-1)*4
 local h=get(base)
 if not actor(h) then
  local stage=get(STAGE)
  local launch=stage>=8 and 15 or stage==7 and 10 or stage==5 and 6 or 0
  h=place(launch,20,100,1,0,i-1,11,.48,1.7)
  if h==0 then return end
  set(base,h);item(h,15,9);item(h,9,get(TOOLS));item(h,10,12)
 end
 engine.possess(i-1,h);p.body,p.zone,p.eligible=h,1,w.won==0 and 1 or 0
end
local function sight(h,a,b)
 local dx,dy,dz=b.x-a.x,b.y+(b.height or .5)*.5-a.y-a.height*.75,b.z-a.z
 local d=math.sqrt(dx*dx+dy*dy+dz*dz)
 if d<.01 then return true end
 local ray=engine.trace(h,dx,dy,dz,d)
 return distance({x=a.x,y=a.y+a.height*.75,z=a.z},ray)>=d-.8 or
  near(ray,{x=b.x,y=b.y+(b.height or .5)*.5,z=b.z},1.9)
end
local function pulse(h,a,dx,dy,dz,range)
 local b,id,best=nil,0,-1
 for _,other in ipairs(engine.list())do
  local q=actor(other)
  if q and other~=h and q.team==1 and q.hp>0 and q.projectile==0 then
   local d=distance(a,q)
   local dot=((q.x-a.x)*dx+(q.z-a.z)*dz+(q.y-a.y)*dy)/math.max(1,d)
   if d<=range and (d<3 or dot>.68) and dot>best and sight(h,a,q) then b,id,best=q,other,dot end
  end
 end
 return b,id
end
local function spell(w,p,base)
 local h=p.body
 local a=actor(h)
 local selected=inv(h,13)
 local dx,dy,dz=math.sin(p.yaw)*math.cos(p.pitch),math.sin(p.pitch),-math.cos(p.yaw)*math.cos(p.pitch)
 if p.alt~=0 and w.tick>=get(base+1) then
  for i=1,#cfg.cargo do
   local q=pool(i)
   if q and near(a,q,20) then
    local d=distance(a,q)
    local dot=(q.x-a.x)*dx+(q.y-a.y)*dy+(q.z-a.z)*dz
    if (d<5 or dot>d*.75) and sight(h,a,q) and mark_pool(i,1) then
     engine.effect(h,get(7+i),201);set(base+1,w.tick+12);return
    end
   end
  end
 end
 if p.fire==0 or w.tick<get(base+1) then return end
 if selected==0 then
  local shot=engine.projectile(h,dx,dy,dz,60,28,8,0,68)
  if shot==0 then return end
  item(shot,5,32);item(shot,8,202);item(shot,9,15)
 elseif selected==1 then
  local spot=near(a,point(26),11) and 4 or near(a,point(15),13) and 5 or 0
  if spot==0 or get(52)&(1<<spot)~=0 or a.energy<18 then return end
  if not engine.deform(engine.collision_start+cfg.patches[spot],3,3,1,1,4) then return end
  set(52,get(52)|(1<<spot));engine.energy(h,18)
 elseif selected==2 then
  if not engine.energy(h,24) then return end
  item(h,11,1);set(base+3,w.tick+145)
  local ship=actor(get(ALLY))
  if near(ship,a,14) then item(get(ALLY),11,1);set(50,w.tick+145) end
 else
  local b,id=pulse(h,a,dx,dy,dz,25)
  if not b or not engine.energy(h,16) then return end
  if b.kind==74 then engine.damage(id,h,100)
  else
   engine.impulse(id,dx*9,dy*9+.6,dz*9);engine.damage(id,h,22)
  end
  engine.effect(h,id,204)
 end
 p.cooldown=selected==0 and 21 or 54
 engine.effect(h,0,210+selected%3);set(base+1,w.tick+p.cooldown)
end
local function build(bit)
 local price=6
 local index=bit==1 and 1 or 2
 if get(BUILT)&bit~=0 or engine.team(0).credits<price then return end
 if not engine.reserve(0,price) then return end
 if not engine.purchase(0,price,0,0) then engine.release(0,price);return end
 set(BUILT,get(BUILT)|bit);set(47+index,7)
 checkpoint()
end
local function use(w,p,i)
 local h=p.body
 local a=actor(h)
 if get(STAGE)==0 and near(a,point(0),5) then
  if managed_enemy(27,30,40,38,0)~=0 then release(1);advance(1) end
 elseif w.won==1 and near(a,point(0),5) then leave(p,i,true)
 elseif near(a,point(19),3.7) then build(1)
 elseif near(a,point(20),3.7) then build(2)
 elseif get(STAGE)==4 and near(a,point(7),5) then
  if managed_enemy(29,8,74,95,0)~=0 then
   set(TOOLS,get(TOOLS)|8);managed_enemy(0,31,42,68,0);advance(5)
  end
 elseif get(STAGE)==5 and near(a,point(25),3.5) then
  engine.damage(get(29),0,100);release(3)
 end
end
local function player(w,p,i)
 local base=32+(i-1)*4
 local h=p.body
 local a=actor(h)
 if not a then enter(w,p,i);return end
 if a.hp==0 then
  if p.respawn==0 then p.respawn=w.tick+150 end
  if w.tick>=p.respawn then
   engine.remove(h);set(base,0);set(base+3,0);p.respawn=0;enter(w,p,i)
  end
  return
 end
 item(h,9,get(TOOLS));item(h,10,near(a,point(0),11) and (get(BUILT)>0 and 2 or 4) or 12)
 if near(a,point(0),5) and w.tick%60==0 then engine.heal(h,4,0) end
 if get(base+3)>0 and w.tick>=get(base+3) then item(h,11,0);set(base+3,0) end
 local buttons=(p.use~=0 and 1 or 0)|(p.command~=0 and 2 or 0)|(p.next~=0 and 4 or 0)
 local pressed=buttons&~get(base+2);set(base+2,buttons)
 if pressed&1~=0 then use(w,p,i) end
 if p.zone==0 then return end
 if pressed&2~=0 then
  if near(a,point(20),6) then build(2)
  elseif near(a,point(7),9) or near(a,point(8),9) then set(51,1-get(51))
  end
 end
 if p.next~=0 then
  local slot=p.weapon-1
  if slot>=0 and slot<4 then
   if get(TOOLS)&(1<<slot)~=0 then item(h,13,slot) end
  elseif pressed&4~=0 then
   slot=inv(h,13)
   repeat slot=(slot+1)%4 until get(TOOLS)&(1<<slot)~=0
   item(h,13,slot)
  end
 end
 spell(w,p,base)
end
local function balloon(w,slot,team,home)
 local h=get(slot)
 local a=actor(h)
 local order=team+1
 if not a or a.hp==0 then
  if h~=0 then
   for i=1,#cfg.cargo do if get(17+i)==2+team then set(17+i,1) end end
   if team==0 then set(55,0);set(50,0) end
   engine.remove(h);set(slot,0);set(53+team,w.tick+180)
  end
  if w.tick<get(53+team) then return end
  h=place(home,5+team,team==0 and 96 or 68,1,team,0,team==0 and 12 or 9,.92,3.6)
  if h==0 then return end
  set(slot,h);a=actor(h)
 end
 if get(50)>0 and w.tick>=get(50) and team==0 then item(h,11,0);set(50,0) end
 local credits,seal,first,best=0,0,0,1e9
 for i,spec in ipairs(cfg.cargo)do
  local state=get(17+i)
  if state==2+team then credits=credits+spec.mana;seal=seal|(spec.seal or 0)
  elseif state==1 then
   local q=pool(i)
   if q and inv(get(7+i),2)==order then
    local d=distance(a,q)
    if d<best then first,best=i,d end
   end
  end
 end
 local capacity=team==0 and (get(BUILT)&1~=0 and 12 or 8) or 8
 item(h,0,credits)
 if credits>0 and (first==0 or credits+cfg.cargo[first].mana>capacity or seal~=0) then
  if near(a,point(home),2.1) then
   local balance=engine.team(team)
   engine.team(team,balance.credits+credits,balance.power,balance.supply)
   for i=1,#cfg.cargo do if get(17+i)==2+team then set(17+i,4+team) end end
   if team==0 then set(55,0);set(SEALS,get(SEALS)|seal);engine.effect(h,0,207);checkpoint() end
  elseif team==0 and seal==2 and get(51)==1 and get(55)==0 then
   if near(a,point(9),2) then set(55,1) else target(h,9) end
  else target(h,home) end
 elseif first>0 then
  if best<2.1 then
   engine.remove(get(7+first));set(7+first,0);set(17+first,2+team)
  else target(h,pool_node(first)) end
 else target(h,home) end
end
local function attack(h,a,victim,damage,spread)
 if not victim or not near(a,victim,47) or not sight(h,a,victim) then return end
 local x,y,z=victim.x-a.x,victim.y+victim.height*.45-a.y-a.height*.75,victim.z-a.z
 engine.projectile(h,x+z*spread,y,z-x*spread,23,damage,0,0,124)
end
local function enemies(w,players)
 local list=engine.list()
 for _,h in ipairs(list)do
  local a=actor(h)
  if a and a.team==1 and a.kind>=40 and a.kind<=48 and a.projectile==0 then
   if a.hp>0 then
    local victim,dist=nil,52
    for _,p in ipairs(players)do
     local b=actor(p.body)
     if b and b.hp>0 and near(a,b,dist) then victim,dist=b,distance(a,b) end
    end
    if a.kind==48 and get(PHASE)==2 and actor(get(ALLY)) then victim=actor(get(ALLY)) end
    if (get(STAGE)==6 or get(STAGE)==7) and a.kind==40 and near(a,actor(get(ALLY)),42) then victim=actor(get(ALLY)) end
    local period=(a.kind==48 and 112 or 154)-engine.difficulty()*5
    if a.kind==42 and victim and near(a,victim,24) and (w.tick+h%91)%period==0 and sight(h,a,victim) then
     for _,p in ipairs(players)do
      local rider=actor(p.body)
      if rider and rider.owner==victim.owner and victim.kind==20 and inv(p.body,11)==0 then
       engine.impulse(p.body,0,-2.4,0);engine.effect(h,p.body,204)
      end
     end
    end
    if (w.tick+h%91)%period==0 then
     attack(h,a,victim,a.kind==48 and 17 or 9,0)
     if a.kind==48 and get(PHASE)==1 then
      attack(h,a,victim,14,.16);attack(h,a,victim,14,-.16)
     end
    end
   elseif inv(h,12)==0 then
    item(h,12,1);item(h,3,(w.tick%900)+38)
   elseif (w.tick%900-inv(h,3)+900)%900<800 then engine.remove(h) end
  end
 end
end
local function boss(w,players)
 local h=get(BOSS)
 local a=actor(h)
 if not a or a.hp==0 then
  local hp=390+math.max(0,#players-1)*65
  if h~=0 then
   w.won,w.phase=1,3;engine.complete(2);advance(9);return
  end
  h=managed_enemy(BOSS,12,48,hp,9)
  if h==0 then return end
  set(PHASE,1);set(TIMER,w.tick);a=actor(h)
 end
 local phase=a.hp*100<=a.max_hp*35 and 3 or a.hp*100<=a.max_hp*70 and 2 or 1
 if phase~=get(PHASE) then
  set(PHASE,phase);w.phase=phase;set(TIMER,w.tick)
  if phase==2 then managed_enemy(29,27,74,105,0) end
  checkpoint()
 end
 local t=w.tick-get(TIMER)
 if phase==2 then
  local relay=actor(get(29))
  item(h,11,relay and relay.hp>0 and 1 or 0)
  if relay and relay.hp>0 then
   if t%95==0 then engine.effect(h,get(ALLY),204) end
   goal(27,1,12,get(29),0);return
  end
 else
  item(h,11,phase==1 and t%220<73 and 1 or 0)
 end
 local lanes=phase==3 and {14,27,13,12} or {12,13,11}
 target(h,lanes[1+(t//(phase==3 and 185 or 275))%#lanes])
 goal(12,1,10+phase,h,0)
end
local function coming_home(players)
 for _,p in ipairs(players)do
  local a=actor(p.body)
  if a and (a.x<67 or near(a,point(2),2)) and a.y<5 then return false end
 end
 return true
end
local function mission(w,players)
 local stage=get(STAGE)
 local kite,moth,guard=actor(get(28)),actor(get(29)),actor(get(30))
 if stage==1 and get(18)==4 then
  if managed_enemy(28,28,40,90,6)~=0 then
   managed_enemy(0,get(LAYOUT)%2==0 and 3 or 4,40,67,8)
   set(TOOLS,get(TOOLS)|4);advance(2)
  end
 elseif stage==2 and (not kite or kite.hp==0) and get(28)~=0 then
  release(2);advance(3)
 elseif stage==3 and get(SEALS)&1~=0 and get(BUILT)>0 then
  set(TOOLS,get(TOOLS)|2);advance(4)
 elseif stage==5 and get(SEALS)&2~=0 then
  if get(31)==0 then managed_enemy(31,18,40,108,6) end
  if get(30)==0 then managed_enemy(30,38,41,133,0) end
  if get(31)~=0 and get(30)~=0 then release(5);release(6);advance(6) end
 elseif stage==6 and (not actor(get(31)) or actor(get(31)).hp==0) and get(31)~=0 then advance(7)
 elseif stage==7 and get(SEALS)==7 then advance(8) end
 stage=get(STAGE)
 if stage==0 then goal(0,2,0)
 elseif stage==1 then
  local q=pool(1)
  if q and inv(get(8),2)==0 then goal(30,8,1)
  else goal(2,0,2) end
 elseif stage==2 then
  if w.tick%420==0 then target(get(28),w.tick//420%2==0 and 28 or 4) end
  if kite then goal(28,1,2,get(28),0) end
 elseif stage==3 then
  if get(SEALS)&1==0 then
   goal(28, pool(2) and 8 or 0,3)
  elseif coming_home(players) then goal(2,0,4)
  elseif get(LAYOUT)%2==0 then goal(20,16,4) else goal(19,2,4) end
 elseif stage==4 then goal(7,2,5)
 elseif stage==5 then
  if get(20)==0 and moth and moth.hp>0 then goal(8,1,6,get(29),0)
  else release(3);goal(8,pool(3) and 8 or 0,7) end
 elseif stage==6 then
  target(get(31),2);goal(2,1,8,get(31),0)
 elseif stage==7 then
  if guard and guard.hp>0 then goal(26,1,9,get(30),0)
  else release(4);goal(26,pool(4) and 8 or 0,9) end
 elseif stage==8 then
  local engage=get(BOSS)~=0
  for _,p in ipairs(players)do if near(actor(p.body),point(12),25) then engage=true end end
  if engage then boss(w,players) else goal(12,0,10) end
 elseif coming_home(players) then goal(2,0,14)
 else goal(0,2,14) end
end
function rules.step(w)
 local players={}
 for i,p in ipairs(w.players)do
  if p.connected==1 then
   if p.zone==0 then
    if p.use~=0 and p.portal==2 and w.unlocked>=2 then
     local active=false
     for _,q in ipairs(w.players)do if q.connected==1 and q.zone==1 then active=true end end
     if w.won==1 and not active then rules.init(w) end
     if w.won==0 or active then enter(w,p,i) end
    end
   else player(w,p,i) end
   if p.zone==1 then players[#players+1]=p end
  end
 end
 if #players==0 then return w end
 for i=1,2 do
  if get(47+i)>0 and w.tick%3==0 and engine.platform(engine.collision_start+cfg.upgrades[i],0,1,0) then
   set(47+i,get(47+i)-1)
  end
 end
 for i=1,#cfg.cargo do
  if get(17+i)==1 and not pool(i) then loose(i) end
 end
 if get(STAGE)>0 then balloon(w,ALLY,0,1) end
 if get(STAGE)>=6 and get(STAGE)<9 then
  if w.tick%180==0 then
   for i=5,6 do if pool(i) and inv(get(7+i),2)==0 then mark_pool(i,2) end end
  end
  balloon(w,RIVAL,1,27)
  if get(59)==0 and engine.team(1).credits>=4 and get(STAGE)<8 then
   local balance=engine.team(1)
   if managed_enemy(59,16,40,84,9)~=0 then
    engine.team(1,balance.credits-4,balance.power,balance.supply)
    target(get(59),18)
   end
  end
 end
 if get(BUILT)&2~=0 and w.tick%45==0 then
  for _,h in ipairs(engine.list())do
   local a=actor(h)
   if a and a.team==1 and a.projectile~=0 and near(a,point(20),19) then engine.remove(h);break end
  end
 end
 enemies(w,players);mission(w,players)
 return w
end
function rules.migrate(w)return w end
return rules
