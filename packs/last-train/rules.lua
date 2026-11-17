-- SPDX-License-Identifier: MIT
-- Editable shared source, exported into each independent calendar pack by author_episodes.py.
local definitions={[1]={day=1,points={{12,0.05,52},{22,0.05,16},{52,0.05,14},{76,0.05,48},{76,0.05,14},{12,0.05,52},{48,0.05,42},{48,0.05,28},{28,0.05,52},{68,0.05,30},{80,0.05,24},{56,0.05,52}},scale=2},[2]={day=2,points={{18,2.5,78},{36,2.5,24},{72,6.5,21},{114,2.5,72},{114,4.5,21},{18,2.5,78},{72,6.5,63},{72,2.5,42},{42,2.5,78},{102,7.5,45},{120,2.5,36},{84,2.5,78}},scale=3},[3]={day=3,points={{18,0.05,78},{30,0.05,24},{78,0.05,21},{114,0.05,72},{114,0.05,21},{18,0.05,78},{72,0.05,63},{72,0.05,42},{42,0.05,78},{102,0.05,45},{120,0.05,36},{84,0.05,78}},scale=3},[4]={day=4,points={{12,0.05,52},{22,1.15,16},{48,1.15,14},{76,0.05,48},{76,0.05,14},{12,0.05,52},{48,1.15,42},{48,0.05,28},{28,0.05,52},{68,0.05,30},{80,0.05,24},{56,0.05,52}},scale=2},[5]={day=5,points={{12,0.05,52},{24,0.05,16},{52,0.05,14},{76,0.05,48},{76,0.05,14},{12,0.05,52},{48,0.05,42},{48,0.05,28},{28,0.05,52},{68,0.05,30},{80,0.05,24},{56,0.05,52}},scale=2},[6]={day=6,points={{24,0.05,104},{40,0.05,32},{96,0.05,28},{152,0.05,96},{152,0.05,28},{24,0.05,104},{96,0.05,84},{96,0.05,56},{56,0.05,104},{136,0.05,60},{160,0.05,48},{112,0.05,104}},scale=4},[7]={day=7,points={{12,0.05,52},{22,0.05,16},{52,0.05,14},{76,0.05,48},{76,0.05,14},{12,0.05,52},{48,0.05,42},{48,0.05,28},{28,0.05,52},{68,0.05,30},{80,0.05,24},{56,0.05,52}},scale=2},[8]={day=8,points={{9.0,0.05,39.0},{18.0,0.05,12.0},{36.0,0.05,10.5},{57.0,0.05,36.0},{57.0,0.05,10.5},{9.0,0.05,39.0},{36.0,0.05,31.5},{36.0,0.05,21.0},{21.0,0.05,39.0},{51.0,0.05,22.5},{60.0,0.05,18.0},{42.0,0.05,39.0}},scale=1.5},[9]={day=9,points={{24,1.85,104},{40,0.05,32},{104,0.05,28},{152,0.05,96},{152,0.05,28},{24,1.85,104},{96,1.8,84},{96,0.05,56},{56,0.05,104},{136,0.05,60},{160,0.05,48},{112,0.05,104}},scale=4},[10]={day=10,points={{18,0.05,78},{33,0.05,24},{72,0.05,21},{114,0.05,72},{114,0.05,21},{18,0.05,78},{72,0.05,63},{72,0.05,42},{42,0.05,78},{102,0.05,45},{120,0.05,36},{84,0.05,78}},scale=3},[11]={day=11,points={{12,5.0,52},{24,5.0,16},{52,13.0,14},{76,5.0,48},{76,9.0,14},{12,5.0,52},{48,13.0,42},{48,5.0,28},{28,5.0,52},{68,15.0,30},{80,5.0,24},{56,5.0,52}},scale=2},[12]={day=12,points={{9.0,0.05,39.0},{15.0,0.05,12.0},{36.0,0.05,10.5},{57.0,0.05,36.0},{57.0,0.05,10.5},{9.0,0.05,39.0},{51.0,0.05,12.0},{36.0,0.05,21.0},{21.0,0.05,39.0},{51.0,0.05,22.5},{60.0,0.05,18.0},{42.0,0.05,39.0}},scale=1.5}}
local day=engine.day
local cfg=definitions[day]
local scale=cfg.scale or 1
local rules={}
local production_init
local get,set=engine.get,engine.set
local function point(n)local p=cfg.points[n+1];return {x=p[1],y=p[2],z=p[3]}end
local function near(a,b,r)return a and b and (a.x-b.x)^2+(a.y-b.y)^2+(a.z-b.z)^2<r*r end
local function actor(slot)return engine.actor(get(slot))end
local function alive(slot)local a=actor(slot);return a and a.hp>0 end
local function item(h,n,value)local old=engine.inventory(h,n);engine.item(h,n,value-old)end
local function mark(bit)return get(20)&bit==bit end
local function flag(bit)if not mark(bit) then set(20,get(20)|bit);engine.checkpoint(get(20))end end
local function spawn(slot,node,kind,hp,team,mode,owner,carry)
 local p=point(node)
 if day==1 and kind==9 then p.x=p.x+1.3 end
 if day==4 and kind==32 then p.x=p.x+2 end
 if slot==6 or kind==6 or node==0 and (kind==12 or kind==13)then p.x,p.z=p.x-2.3,p.z+1 end
 if node==0 and slot==7 then p.x,p.z=p.x+2,p.z+.5 end
 if day==10 and slot and slot>=12 and slot<=14 then p.x,p.z=p.x+(slot-13)*1.2,p.z+1.8 end
 local h=engine.spawn{x=p.x,y=p.y,z=p.z,kind=kind,hp=hp,max_hp=hp,team=team or 0,mode=mode or 3,owner=owner or 0,radius=day==6 and (kind==3 and 2 or kind==20 and 1.4 or kind==2 and 1 or .3) or kind==3 and .7 or .3,height=day==6 and (kind==3 and 12 or kind==20 and 9 or kind==2 and 6 or kind==9 and 3 or 1.2) or kind==3 and 3 or kind==20 and (day==11 and 1 or 1.7) or kind==1 and 2 or kind==10 and 1.8 or 1.2,speed=day==6 and 2.6 or 3.5,carried=carry or 0}
 if slot then set(slot,h)end
 return h
end
local function shield(on)
 local h=get(1);local a=engine.actor(h)
 if on and a then engine.heal(h,a.max_hp,0)end
 if a then item(h,11,on and 1 or 0)end
end
local function goal(node,buttons,line,target,tool)
 set(56,node);set(57,buttons or 2);set(58,target or 0);set(60,line or 0);set(25,tool or -1)
end
local function complete(w)
 if w.won==0 then w.won,w.phase=1,3;engine.complete(day);engine.checkpoint(100+day)end
 goal(5,2,7)
end
local function purchase(price)
 if not engine.reserve(0,price)then return false end
 if engine.purchase(0,price,0,0)then return true end
 engine.release(0,price);return false
end
local function launch(h,a,b,damage,speed)
 if not a or not b then return 0 end
 local dx,dy,dz=b.x-a.x,b.y+(b.height or 1)*.5-(a.y+(a.height or 1)*.75),b.z-a.z
 return engine.projectile(h,dx,dy,dz,speed or 22,damage or 12,0,0,180)
end
local function enter(w,p,i)
 local b=32+(i-1)*6;local h=get(b);local a=engine.actor(h)
 if day==10 and not a and i>1 then
  for _,slot in ipairs({18,12,13,14})do
   local candidate=get(slot)
   if candidate~=0 and engine.control(candidate,i-1)then h=candidate;set(b,h);a=engine.actor(h);break end
  end
 end
 if not a or a.hp==0 then
  if a then engine.remove(h)end
  h=spawn(nil,0,20,100,0,(day==2 or day==11) and 1 or 0,i-1);set(b,h)
  engine.mode(h,(day==2 or day==11) and 1 or 0,day==6 and 3.2 or day==2 and 8 or day==11 and 6 or 4.5)
  item(h,0,2);item(h,1,10);item(h,2,6);item(h,13,get(b+3))
  item(h,15,day==9 and 1 or day==11 and 2 or day==6 and 3 or 0)
 end
 if day==10 and i==1 and get(18)==0 then set(18,h)end
 engine.possess(i-1,h)
 p.body,p.zone,p.eligible=h,1,w.won==0 and 1 or 0
end
local function exit(p,i)
 engine.possess(i-1,0);engine.remove(get(32+(i-1)*6));set(32+(i-1)*6,0)
 p.body,p.zone,p.x,p.y,p.z,p.hp=0,0,12,0,5,100
end
function rules.init(w)
 if not engine.reset(2026+day) then return w end
 w.keys,w.valves,w.phase,w.won=0,0,0,0
 set(0,1);set(63,100+day);set(25,-1)
 engine.team(0,0,12,8)
 spawn(1,4,3,day==7 and 54 or 180,1)
 if day~=2 and day~=3 and day~=5 and day~=12 then for j=1,3 do spawn(j+1,j,4,1000,0)end end
 spawn(5,6,7,1000,0)
 spawn(6,0,(day==2 or day==3 or day==5) and 6 or 7,200,0)
 for j=1,4 do
  local n=({1,2,3,7})[j];local h=spawn(7+j,n,(day==6 or day==11 or day==8 and j%2==0) and 2 or 1,day==7 and 24 or 36,1)
  if day==2 or day==11 then engine.mode(h,1,2.5)end
 end
 if day==1 then
  spawn(12,1,9,24,0);spawn(13,2,9,24,0)
 elseif day==2 then
  spawn(7,0,5,60,0,1,0);spawn(12,1,4,1000,0,3,0,8);spawn(13,2,4,1000,0,3,0,8);spawn(14,3,4,1000,0,3,0,8)
 elseif day==3 or day==5 then
  spawn(7,0,5,80,0,0,0);spawn(12,1,day==5 and 14 or 4,1000,0,3,0,80);spawn(13,2,day==5 and 15 or 4,1000,0,3,0,80)
  if day==5 then spawn(14,3,16,1000,0,3,0,12);spawn(18,9,9,36,1);spawn(31,10,9,36,1)end
 elseif day==6 then
  spawn(7,0,5,120,0,0,0)
  spawn(12,1,9,30,1);spawn(13,2,9,30,1);spawn(14,10,9,36,1);spawn(31,9,9,36,1)
  engine.team(0,0,12,8)
 elseif day==8 or day==10 then
  spawn(7,0,10,80,0,0,0)
  if day==10 then
   engine.remove(get(7));spawn(7,1,10,80,0,0,0)
   for j=1,3 do item(spawn(11+j,0,10,80,0,0,0),10,1)end
  end
 elseif day==9 then
  spawn(12,1,9,36,1);spawn(13,2,9,36,1)
 elseif day==11 then
  spawn(12,6,11,48,1);item(get(12),11,1)
 elseif day==12 then
  for j=1,3 do spawn(11+j,j,4,1000,0)end
 end
 local cache=spawn(nil,11,29,1000,0);item(cache,8,461);item(cache,11,1)
 shield(true);goal(day==6 and 0 or 1,2,0)
 if production_init then production_init(w)end
 return w
end
local function actions(w,p,i)
 local b=32+(i-1)*6;local h=get(b);local a=engine.actor(h)
 if not a then enter(w,p,i);return end
 if a.hp==0 then
  if p.respawn==0 then p.respawn=w.tick+150 end
  if day~=7 and w.tick>=p.respawn then engine.heal(h,100,100);engine.teleport(h,0);p.respawn=0;p.hp=100 end
  return
 end
 local buttons=(p.use~=0 and 2 or 0)|(p.jump~=0 and 4 or 0)|(p.alt~=0 and 8 or 0)|(p.command~=0 and 16 or 0)|(p.next~=0 and 32 or 0)
 local pressed=buttons&~get(b+2);set(b+2,buttons)
 if pressed&2~=0 then for _,cache in ipairs(engine.list())do
  local pickup=engine.actor(cache)
  if pickup and engine.inventory(cache,8)==461 and near(a,pickup,2.5)then
   engine.heal(h,40,30);engine.item(h,0,1);engine.item(h,1,8)
   if day==3 then local budget=engine.team(0);engine.team(0,budget.credits+4,budget.power,budget.supply+4)end
   engine.remove(cache);flag(512)
  end
 end end
 if pressed&32~=0 then item(h,13,(engine.inventory(h,13)+1)%3)end
 -- shortcut: 72-tick player shots reserve actor slots for four-player recovery; revisit with projectile pooling.
 local kit=engine.inventory(h,13)
 if day==1 then item(h,15,kit==2 and 4 or 0)end
 if day==7 and near(a,point(0),3) and p.use~=0 and not mark(256) then
  local price=kit==2 and 6 or kit==1 and 4 or 3
  if purchase(price) then flag(256);item(h,1,kit==2 and 20 or 24)end
 end
 if day==12 and not mark(256) and near(a,point(0),2.5) and p.use~=0 then
  set(22,kit);flag(256)
 end
 if p.fire~=0 and w.tick>=get(b+1) then
  local can_fire=true;local damage,cost,heat,cooldown=12,0,0,14
  if day==6 then
   damage=kit==2 and 30 or kit==1 and 24 or 12;heat=kit==2 and 65 or kit==1 and 38 or 28;cooldown=kit==2 and 40 or 18
   if mark(8) and get(22)==1 then heat=math.floor(heat*.7)end
   if a.heat+heat>100 then set(b+5,w.tick+90);can_fire=false end
   if w.tick<get(b+5) then can_fire=false end
   if kit==1 and engine.inventory(h,1)==0 then can_fire=false end
  elseif day==7 then
   if not mark(256) or engine.inventory(h,1)==0 or w.phase==2 then can_fire=false end
   damage=kit==1 and 24 or 18;cooldown=kit==1 and 30 or 16
  elseif day==12 then
   damage=(kit==0 and 22 or kit==1 and 17 or 28)+engine.inventory(h,3);cost=kit==2 and 14 or 0;cooldown=kit==0 and 25 or 18
   if kit==0 and not near(a,actor(1),2.7) then
    local close=false;for j=8,11 do if near(a,actor(j),2.7) and alive(j)then close=true end end
    if not close then can_fire=false end
   end
  end
  if can_fire then
   local spread=day==7 and (p.forward~=0 or p.strafe~=0) and .16 or 0
   local yaw=p.yaw+(w.tick%2==0 and spread or -spread)
   local shot=engine.projectile(h,math.sin(yaw)*math.cos(p.pitch),math.sin(p.pitch),-math.cos(yaw)*math.cos(p.pitch),day==9 and 15 or 26,damage,cost,heat,72)
   if shot~=0 then
    set(b+1,w.tick+cooldown);p.cooldown=cooldown
    if day==7 or day==6 and kit==1 then engine.item(h,1,-1)end
   end
  end
 end
 if pressed&8~=0 and day~=1 and day~=2 and day~=6 and day~=7 and day~=9 and day~=10 and day~=11 then
  if engine.inventory(h,0)>0 and a.hp<90 then engine.item(h,0,-1);engine.heal(h,45,30)end
 end
 if w.won==1 and p.use~=0 and near(a,point(5),2) then exit(p,i)end
end
local function enemy_step(w)
 local target
 for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 and p.hp>0 then target=engine.actor(get(32+(i-1)*6));if target then break end end end
 if not target then return end
 for j=8,11 do
  local a=actor(j)
  if a and a.hp>0 then
   if near(a,target,9) and visible(a.x,a.z,target.x,target.z) then
    if w.tick%(90+j*3)==0 then launch(get(j),a,target,4,14)end
   end
  end
 end
 local boss=actor(1)
 if boss and boss.hp>0 and near(boss,target,day==1 and 28*scale or 28) and w.tick%(day==6 and mark(32) and 150 or 90)==0 then
  local aim=target
  if day==1 then
   if near(target,point(1),3) and alive(12)then aim=actor(12)
   elseif near(target,point(2),3) and alive(13)then aim=actor(13)end
  elseif (day==2 or day==6) and get(21)>0 and alive(7)then aim=actor(7)end
  if visible(boss.x,boss.z,aim.x,aim.z)then launch(get(1),boss,aim,day==7 and 9 or 7,day==1 and 20 or 13)end
 end
end
local function lower_gate(first)
 for _=1,3 do if not engine.platform(first or engine.collision_start,0,-1,0)then return false end end
 return true
end
local missions={}
missions[1]=function(w)
 local gate=get(20)&3
 for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then
  local h=get(32+(i-1)*6);local a=engine.actor(h)
  if near(a,point(6),2) and p.alt~=0 and gate==0 then flag(1)end
  if p.command~=0 and mark(1) and not mark(2) then
   if lower_gate()then flag(2);engine.remove(get(5))end
  end
  if p.use~=0 then
   if near(a,point(1),2)then flag(16)end
   if near(a,point(2),2)then flag(32)end
   if near(a,point(0),2) and not mark(64)then engine.heal(h,40,0);flag(64)end
  end
 end end
 local exposed=mark(2) and not alive(12) and not alive(13) and mark(16) and mark(32)
 shield(not exposed)
 if not mark(1)then goal(6,8,0)
 elseif not mark(2)then goal(6,16,1)
 elseif alive(12) or not mark(16)then goal(1,2,2)
 elseif alive(13) or not mark(32)then goal(2,2,3)
 else goal(4,1,4,get(1))end
 if exposed and not alive(1)then complete(w)end
end
local function collector(w,mode)
 local h=get(7);local a=engine.actor(h)
 if not a or a.hp==0 then
  if a and a.carried>0 then
   local remaining=actor(19) and actor(19).carried or 0
   local resource=engine.inventory(h,7)
   if actor(19)then engine.remove(get(19))end
   set(19,engine.spawn{x=a.x,y=a.y,z=a.z,kind=4,hp=1000,max_hp=1000,team=0,mode=3,carried=a.carried+remaining})
   item(get(19),7,resource)
  end
  if a then engine.remove(h)end
  h=spawn(7,0,5,80,0,mode,0);if day==2 and mark(8)then engine.mode(h,1,5)end;a=engine.actor(h);set(28,get(28)+1)
 end
 local home=point(0)
 if actor(19) and actor(19).carried>0 then set(26,19)end
 local selected=get(26)
 local source=selected>0 and engine.actor(get(selected)) or nil
 local resource=selected==19 and engine.inventory(get(19),7) or selected
 if a.carried==0 and selected>0 then item(h,7,resource)end
 local returning=a.carried>=8 or a.carried>0 and (not source or source.carried==0 or resource~=engine.inventory(h,7))
 if returning then
  if near(a,home,2)then
   local delivered=a.carried
   if engine.deliver(h)then
    if day==5 then local source=engine.inventory(h,7);local index=source==12 and 29 or source==13 and 27 or 30;set(index,get(index)+delivered)end
    set(23,get(23)+delivered);engine.order(0,h,0,home.x,home.y,home.z,0)end
  else engine.order(0,h,1,home.x,home.y,home.z,0)end
 elseif get(26)>0 then
  local source=engine.actor(get(get(26)))
  if source and source.carried>0 then
   if near(a,source,1.6)then engine.order(0,h,4,source.x,source.y,source.z,get(get(26)))
   else engine.order(0,h,1,source.x,source.y,source.z,0)end
  else set(26,0)end
 end
end
missions[2]=function(w)
 collector(w,1)
 for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then
  local h=get(32+(i-1)*6);local a=engine.actor(h)
  if p.use~=0 then
   for n=1,3 do
    if near(a,point(n),2.5) and not alive(7+n)then flag(1<<(n-1));set(26,11+n)end
   end
   if near(a,point(0),3) and get(23)>=8 and not mark(8) and purchase(8)then flag(8);item(get(6),9,1);engine.mode(get(7),1,5)end
  end
  if p.alt~=0 and near(a,point(6),3) and not mark(16) then
   if engine.deform(engine.collision_start+12,3,3,1,1,1.2)then flag(16)end
  end
 end end
 if actor(1) and actor(1).hp<90 then set(21,1)end
 local exposed=get(23)>=24 and mark(8)
 shield(not exposed)
 if get(23)<8 then goal(1,2,0)
 elseif not mark(8)then goal(0,2,1)
 elseif get(23)<16 then goal(2,2,2)
 elseif get(23)<24 then goal(3,2,3)
 else goal(4,1,4,get(1))end
 if exposed and not alive(1)then complete(w)end
end
local function build(slot,node,price,kind,power,supply)
 if get(slot)~=0 then return true end
 local blueprint=spawn(nil,node,kind,90,0)
 local h=engine.construct(blueprint,price,60,power or 0,supply or 0)
 engine.remove(blueprint)
 if h~=0 then set(slot,h);return true end
 return false
end
missions[3]=function(w)
 collector(w,0)
 for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then
  local h=get(32+(i-1)*6);local a=engine.actor(h)
  if p.use~=0 and near(a,point(1),2)then set(26,12);flag(1)end
  if p.use~=0 and near(a,point(2),2)then set(26,13);flag(2)end
  if p.use~=0 and near(a,point(0),3) and get(23)>=8 then
   if build(15,8,4,12) then flag(4)end
   if mark(4) and build(16,0,3,13)then flag(8)end
   if mark(8) and build(17,6,3,8,2,1)then flag(16)end
   if mark(16)then build(18,8,2,10,0,1);build(31,11,2,10,0,1)end
  end
  if p.command~=0 and near(a,point(6),2.5) and mark(16) and get(18)~=0 and get(31)~=0 then flag(32)end
  if p.alt~=0 and near(a,actor(7),3)then engine.heal(get(7),20,0)end
 end end
 if mark(32)then
  for _,slot in ipairs({18,31})do if alive(slot)then
   local h=get(slot);local a=actor(slot);engine.mode(h,0,3.5)
   if near(a,actor(1),13)then
    engine.order(0,h,0,a.x,a.y,a.z,0)
    if w.tick%60==0 then launch(h,a,actor(1),12,20)end
   else local q=point(9);engine.order(0,h,1,q.x,q.y,q.z,0)end
  end end
 end
 if mark(16) and alive(17)then
  local target=actor(1);if target then engine.order(0,get(17),2,target.x,target.y,target.z,get(1))end
 end
 local exposed=mark(32) and get(23)>=10
 shield(not exposed)
 if not mark(1)then goal(1,2,0)
 elseif get(23)<10 then goal(0,2,1)
 elseif not mark(16) or get(18)==0 or get(31)==0 then goal(0,2,2)
 elseif not mark(32)then goal(6,16,3)
 else goal(4,1,4,get(1))end
 if exposed and not alive(1)then complete(w)end
end
missions[4]=function(w)
 for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then
  local h=get(32+(i-1)*6);local a=engine.actor(h)
  local water=a and a.x>30*scale and a.z>19*scale
  engine.mode(h,water and 2 or 0,water and 5 or 4.5)
  if p.jump~=0 then for _,n in ipairs({1,2,6})do if near(a,point(n),2.5)then local q=point(n);engine.climb(h,q.x,q.y,q.z)end end end
  if p.use~=0 then
   for n=1,3 do if near(a,point(n),1.7) and (n==3 or a.y>.8)then flag(1<<(n-1))end end
   if mark(7) and near(a,point(6),1.8) and a.y>.8 then flag(8)end
  end
  if a and a.y< -1 then engine.teleport(h,0);engine.heal(h,100,0)end
 end end
 local exposed=mark(7) and mark(8)
 shield(not exposed)
 if not mark(1)then goal(1,2,0)
 elseif not mark(2)then goal(2,2,1)
 elseif not mark(4)then goal(3,2,2)
 elseif not mark(8)then goal(6,2,3)
 else goal(4,1,4,get(1))end
 if exposed and not alive(1)then complete(w)end
end
missions[5]=function(w)
 collector(w,0)
 for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then
  local a=engine.actor(get(32+(i-1)*6))
  if p.use~=0 and near(a,point(1),2)then set(26,12);flag(1)end
  if p.use~=0 and near(a,point(2),2)then set(26,13);flag(2)end
  if p.use~=0 and near(a,point(0),3)then
   if get(29)>=8 and build(15,8,3,12)then flag(4);engine.team(0,engine.team(0).credits,12,12)end
   if mark(4) and get(27)>=8 and build(16,6,3,8,0,1)then flag(8)end
  end
  if p.use~=0 and near(a,point(3),2)then flag(16);set(26,14)end
  if p.command~=0 and near(a,point(0),3) and get(30)>=8 and mark(8) and mark(16)then
   if not alive(17) then if get(17)~=0 then engine.remove(get(17));set(17,0)end;build(17,3,4,17,1,2)end
   if alive(17)then flag(32)end
  end
 end end
 local engines=alive(18) or alive(31)
 if mark(32) and alive(17) and w.tick%60==0 then
  local slot=alive(18) and 18 or alive(31) and 31 or 1
  launch(get(17),actor(17),actor(slot),12,18)
 end
 local exposed=mark(32) and alive(17) and not engines
 shield(not exposed)
 if not mark(1)then goal(1,2,0)
 elseif get(29)<8 then goal(0,2,1)
 elseif not mark(4)then goal(0,2,2)
 elseif not mark(2)then goal(2,2,2)
 elseif get(27)<8 then goal(0,2,1)
 elseif not mark(8)then goal(0,2,2)
 elseif not mark(16)then goal(3,2,3)
 elseif get(30)<8 or not alive(17)then goal(0,16,4)
 elseif alive(18)then goal(9,1,5,get(18))
 elseif alive(31)then goal(10,1,5,get(31))
 else goal(4,1,5,get(1))end
 if exposed and not alive(1)then
  if get(21)==0 then engine.remove(get(1));spawn(1,4,13,90,1);set(21,1);w.phase=1;flag(64)
  else complete(w)end
 end
end
missions[6]=function(w)
 for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then
  local h=get(32+(i-1)*6);local a=engine.actor(h)
  if p.use~=0 and near(a,point(0),3) and not mark(8)then flag(8);set(22,engine.inventory(h,13));if get(22)==1 then engine.heal(h,0,100)else item(h,0,3)end end
  if p.command~=0 and alive(7)then local q=point(6);engine.order(0,get(7),1,q.x,q.y,q.z,0);flag(16)end
  if p.alt~=0 and near(a,point(0),3)then engine.heal(h,0,100)end
  if mark(8) and get(22)==2 and a then
   local previous=engine.inventory(h,12);if previous>a.hp and a.hp>0 then engine.heal(h,math.floor((previous-a.hp)*.4),0)end
   item(h,12,engine.actor(h).hp)
  end
 end end
 if not alive(12)then flag(1)end;if not alive(13)then flag(2)end
 if mark(3)then item(get(14),11,0)else item(get(14),11,1);engine.heal(get(14),36,0)end
 if not alive(14)then flag(4)end
 if not alive(31)then flag(32)end
 local exposed=mark(39) and near(actor(7),point(6),3)
 shield(not exposed)
 if not mark(8)then goal(0,2,0)
 elseif not mark(1)then goal(1,1,1,get(12),0)
 elseif not mark(2)then goal(2,1,2,get(13),0)
 elseif not mark(4)then goal(10,1,3,get(14),0)
 elseif not mark(32)then goal(9,1,4,get(31),0)
 elseif not near(actor(7),point(6),3)then goal(0,16,3)
 else goal(4,1,4,get(1),0)end
 if exposed and not alive(1)then complete(w)end
end
missions[7]=function(w)
 local any_living=false;local entered=false
 for _,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then entered=true;if p.hp>0 then any_living=true end end end
 if entered and not any_living and get(28)==0 then set(28,w.tick+150)end
 if get(28)>0 and w.tick>=get(28)then
  set(20,0);set(23,0);set(28,0);set(24,w.tick+7200);engine.team(0,10,12,8)
  engine.heal(get(1),54,0);for j=8,11 do engine.heal(get(j),36,0)end
  for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then engine.heal(get(32+(i-1)*6),100,100);engine.teleport(get(32+(i-1)*6),0);p.respawn=0 end end
 end
 if get(21)==0 then set(21,1);engine.team(0,10,12,8);set(24,w.tick+7200)end
 local enemies=false;for j=8,11 do enemies=enemies or alive(j)end
 local boss=actor(1)
 local exposed=mark(256);shield(not exposed)
 if enemies or alive(1)then
  if not mark(256)then goal(0,2,0)
  else
   local slot=1;local node=4
   for j=8,11 do if alive(j)then slot=j;node=({1,2,3,7})[j-7];break end end
   goal(node,1,1,get(slot))
  end
 else
  if not mark(1)then goal(2,2,2)
  else goal(3,2,3)end
  for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then
   local a=engine.actor(get(32+(i-1)*6))
   if near(a,point(2),2) and p.use~=0 then flag(1)end
   if mark(1) and near(a,point(3),1.6) and p.use~=0 and p.forward==0 and p.strafe==0 then set(23,get(23)+1)
   elseif get(23)>0 then set(23,0)end
  end end
  if get(23)>=120 then
   if get(21)>=3 then complete(w)
   else
    set(21,get(21)+1);set(20,0);set(23,0);set(24,w.tick+7200);engine.team(0,10+get(21)*3,12,8)
    engine.heal(get(1),180,0);for j=8,11 do engine.heal(get(j),36,0)end
    for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then engine.heal(get(32+(i-1)*6),100,100);engine.teleport(get(32+(i-1)*6),0)end end
   end
  end
 end
 if w.won==0 and w.tick>=get(24)then
  set(23,0);set(24,w.tick+7200);set(20,0);engine.team(0,10,12,8)
  engine.heal(get(1),54,0);for j=8,11 do engine.heal(get(j),36,0)end
  for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then engine.heal(get(32+(i-1)*6),100,100);engine.teleport(get(32+(i-1)*6),0)end end
 end
end
missions[8]=function(w)
 local escort=actor(7)
 if not escort or escort.hp==0 then
  if escort then engine.heal(get(7),80,0);engine.teleport(get(7),0)end
  set(28,get(28)+1)
 end
 for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then
  local a=engine.actor(get(32+(i-1)*6))
  if p.use~=0 then
   if near(a,point(0),2.5)then local q=point(6);engine.order(0,get(7),1,q.x,q.y,q.z,0);flag(1)end
   for n=1,3 do if near(a,point(n),2) and (n~=2 or near(actor(7),point(6),3))then flag(1<<n)end end
   if near(a,point(6),2.5) and mark(14)then
    if get(21)==0 then set(21,1);set(20,get(20)&~8);engine.platform(engine.collision_start,0,.8,0);engine.checkpoint(2)
    else engine.damage(get(1),0,255);complete(w)end
   end
  end
 end end
 shield(w.won==0)
 if not mark(1)then goal(0,2,0)
 elseif not near(actor(7),point(6),3)then goal(6,2,1)
 elseif not mark(2)then goal(1,2,2)
 elseif not mark(4)then goal(2,2,3)
 elseif not mark(8)then goal(3,2,4)
 else goal(6,2,5)end
end
missions[9]=function(w)
 if mark(4)then
  local seat=get(22);local p=w.players[seat];local a=seat>0 and engine.actor(get(32+(seat-1)*6))
  if not p or p.connected==0 or p.zone~=1 or not a or a.hp==0 then set(20,get(20)&~4);set(22,0)end
 end
 if not alive(12)then flag(1)end;if not alive(13)then flag(2)end
 for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then
  local a=engine.actor(get(32+(i-1)*6))
  if p.use~=0 and near(a,point(3),2)then flag(4);set(22,i)end
  if mark(4) and get(22)==i and p.use~=0 and near(a,point(0),2.3) and not alive(1)then complete(w)end
 end end
 local exposed=mark(3) and mark(4);shield(not exposed)
 if not mark(1)then goal(1,1,0,get(12))
 elseif not mark(2)then goal(2,1,1,get(13))
 elseif not mark(4)then goal(3,2,2)
 elseif alive(1)then goal(4,1,3,get(1))
 else goal(0,2,4)end
end
missions[10]=function(w)
 for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then
  local b=32+(i-1)*6;local h=get(b);local a=engine.actor(h)
  if p.use~=0 and near(a,point(1),2)then flag(1);local q=point(6);engine.order(0,get(7),1,q.x,q.y,q.z,0)end
  if p.alt~=0 and near(a,point(2),2.5) and not mark(2)then if lower_gate()then flag(2);engine.remove(get(5))end end
  if p.alt~=0 and not near(a,point(2),2.5) and get(b+4)<w.tick then
   set(b+4,w.tick+30);local order=engine.inventory(h,10)%3+1;item(h,10,order)
   for _,slot in ipairs({18,12,13,14})do local unit=actor(slot);if unit and unit.owner==i-1 then item(get(slot),10,order)end end
  end
  if p.command~=0 and get(b+4)<w.tick then
   set(b+4,w.tick+30);local choice=(get(b+5)+1)%4;set(b+5,choice)
   local chosen=choice==0 and get(18) or get(11+choice)
   local unit=engine.actor(chosen)
   if unit and unit.owner==i-1 then engine.possess(i-1,chosen);set(b,chosen);flag(16)end
  end
  if p.use~=0 and near(a,point(3),2) and (mark(1) or mark(2))then flag(4)end
  if p.use~=0 and near(a,point(0),2.5) and mark(4) and get(21)==1 and not alive(1) and near(actor(7),point(6),3)then complete(w)end
 end end
 local leader
 for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then leader=engine.actor(get(32+(i-1)*6));if leader then break end end end
 for _,slot in ipairs({18,12,13,14})do
  local h=get(slot);local a=engine.actor(h);local occupied=false
  for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 and get(32+(i-1)*6)==h then occupied=true end end
  if a and a.hp>0 then
   if occupied then engine.order(a.owner,h,0,a.x,a.y,a.z,0)
   elseif leader then
    local order=engine.inventory(h,10)
    if order==1 then engine.order(a.owner,h,1,leader.x,leader.y,leader.z,0)
    elseif order==2 then engine.order(a.owner,h,0,a.x,a.y,a.z,0)
    elseif order==3 and alive(1)then local boss=actor(1);engine.order(a.owner,h,2,boss.x,boss.y,boss.z,get(1))end
   end
  end
 end
 local exposed=mark(4) and (mark(1) or mark(2));shield(not exposed)
 if exposed and not alive(1) and get(21)==0 then engine.remove(get(1));spawn(1,4,13,90,1);set(21,1);w.phase=1 end
 if not mark(1)then goal(1,2,0)
 elseif not near(actor(7),point(6),3)then goal(6,2,1)
 elseif not mark(4)then goal(3,2,2)
 elseif alive(1)then goal(4,1,3,get(1))
 else goal(0,2,4)end
end
missions[11]=function(w)
 for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then
  local a=engine.actor(get(32+(i-1)*6))
  if p.use~=0 then
   if near(a,point(1),1.8)then flag(1)end
   if near(a,point(2),1.8)then flag(2)end
   if near(a,point(3),1.8)then flag(4)end
   if near(a,point(6),1.8)then flag(8)end
  end
  if p.fire~=0 and mark(15) and a then
   local boss=actor(1)
   if a.x<boss.x-3 then flag(16)end
   if a.y>boss.y+2 then flag(32)end
  end
  if not alive(1) and not alive(12) and p.use~=0 and near(a,point(0),2) and get(24)>w.tick then complete(w)end
 end end
 local exposed=mark(48);shield(not exposed)
 if not mark(1)then goal(1,2,0)
 elseif not mark(2)then goal(2,2,1)
 elseif not mark(4)then goal(3,2,2)
 elseif not mark(8)then goal(6,2,3)
 elseif not mark(16)then goal(2,1,4,get(1))
 elseif not mark(32)then goal(9,1,4,get(1))
 elseif alive(1)then goal(4,1,5,get(1))
 elseif alive(12)then item(get(12),11,0);goal(6,1,6,get(12))
 else
  if get(24)==0 then set(24,w.tick+4500);engine.checkpoint(3)end
  goal(0,2,7)
  if w.tick>=get(24)then engine.heal(get(12),48,0);set(24,0);set(28,get(28)+1)end
 end
end
missions[12]=function(w)
 for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then
  local b=32+(i-1)*6;local h=get(b);local a=engine.actor(h)
  if p.use~=0 then
   for n=1,3 do if near(a,point(n),2)then
    local bit=1<<(n-1);flag(bit)
    if engine.inventory(h,4)&bit==0 then item(h,4,engine.inventory(h,4)|bit);item(h,3,engine.random(i-1)%4+1);engine.item(h,0,1)end
   end end
   if (near(a,point(6),2.5) or near(a,point(2),2.5) or near(a,point(3),2.5)) and mark(7) and get(24)<=w.tick then set(24,w.tick+480);flag(8)end
   if near(a,point(0),2.5) and not mark(16)then flag(16);engine.heal(h,100,100);item(h,0,2)end
  end
  if p.command~=0 and not mark(32)then if engine.teleport(h,0)then flag(32)end end
 end end
 local exposed=mark(7) and get(24)>w.tick;shield(not exposed)
 if not mark(256)then goal(0,2,0)
 elseif not mark(1)then goal(1,2,1)
 elseif not mark(2)then goal(2,2,2)
 elseif not mark(4)then goal(3,2,3)
 elseif not exposed then goal(6,2,4)
 else goal(4,1,5,get(1),get(22))end
 if exposed and not alive(1)then complete(w)end
end
-- SPDX-License-Identifier: MIT
if day==7 then
 local old_actions=actions
 local function obscured(a,b)
  local dx,dz=b.x-a.x,b.z-a.z;local length=dx*dx+dz*dz
  for _,h in ipairs(engine.list())do local cloud=engine.actor(h)
   if cloud and cloud.projectile==0 and engine.inventory(h,8)==50 then
    local t=length>0 and math.max(0,math.min(1,((cloud.x-a.x)*dx+(cloud.z-a.z)*dz)/length)) or 0
    if (cloud.x-a.x-t*dx)^2+(cloud.z-a.z-t*dz)^2<16 then return true end
   end
  end
  return false
 end
 actions=function(w,p,i)
  local h=get(32+(i-1)*6);local a=engine.actor(h)
  local pressed=(p.alt~=0 and 8 or 0)|(p.command~=0 and 16 or 0)
  pressed=pressed&~get(34+(i-1)*6)
  old_actions(w,p,i)
  a=engine.actor(h);if not a or a.hp==0 then return end
  if mark(256) and engine.inventory(h,4)~=get(21)then
   item(h,2,1);item(h,3,1);item(h,4,get(21))
  end
  if engine.inventory(h,10)>0 then engine.item(h,10,-1)end
  if mark(256) and pressed~=0 then
   local smoke=pressed&8~=0;local slot=smoke and 2 or 3
   if engine.inventory(h,slot)>0 then
    item(h,5,9)
    local shot=engine.projectile(h,math.sin(p.yaw)*math.cos(p.pitch),math.sin(p.pitch)+.35,-math.cos(p.yaw)*math.cos(p.pitch),11,1,0,0,120)
    item(h,5,0)
    if shot~=0 then engine.item(h,slot,-1);item(shot,8,smoke and 50 or 51);item(shot,9,smoke and 480 or 2)end
   end
  end
 end
 enemy_step=function(w)
  local target
  for i,p in ipairs(w.players)do if p.connected==1 and p.zone==1 and p.hp>0 then target=engine.actor(get(32+(i-1)*6));if target then break end end end
  if not target then return end
  for _,h in ipairs(engine.list())do local a=engine.actor(h)
   if a and a.projectile==0 and engine.inventory(h,8)==51 and engine.inventory(h,12)==0 then
    item(h,12,1)
    for _,other in ipairs(engine.list())do local b=engine.actor(other)
     if b and b.hp>0 and b.projectile==0 and near(a,b,12) and visible(a.x,a.z,b.x,b.z)then
      local facing=-math.sin(b.yaw or 0)*(a.x-b.x)-math.cos(b.yaw or 0)*(a.z-b.z)
      item(other,10,math.max(engine.inventory(other,10),facing>0 and 150 or 45))
     end
    end
   end
  end
  for _,slot in ipairs({8,9,10,11,1})do local h=get(slot);local a=engine.actor(h)
   if a and a.hp>0 then
    local blind=engine.inventory(h,10)
    if blind>0 then engine.item(h,10,-1)
    else
     local hidden=obscured(a,target)
     if w.tick%180==slot%5*30 then
      local n=hidden and (slot%2==0 and 7 or 11) or (slot%2==0 and 1 or 2)
      local q=point(n);engine.mode(h,0,slot==1 and 2 or 2.8);engine.order(a.owner,h,1,q.x,q.y,q.z,0)
     end
     if not hidden and near(a,target,slot==1 and 28 or 14) and visible(a.x,a.z,target.x,target.z) and w.tick%(slot==1 and 90 or 110)==0 then launch(h,a,target,slot==1 and 9 or 4,20)end
    end
   end
  end
 end
end

function rules.step(w)
 local in_mission=false
 for _,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then in_mission=true end end
 for i,p in ipairs(w.players)do if p.connected==1 then
  if p.zone==0 then
   local b=32+(i-1)*6;local down=p.next~=0
   if down and get(b+2)==0 then set(b+3,(get(b+3)+1)%3)end
   set(b+2,down and 32 or 0)
   if p.use~=0 and p.portal==day and w.unlocked>=day then
    if w.won==1 and not in_mission then rules.init(w)end
    enter(w,p,i)
   end
  else actions(w,p,i)end
 end end
 if w.won==0 then missions[day](w);enemy_step(w)end
 if w.won==1 then goal(5,2,7)end
 set(59,get(20))
 return w
end
function rules.migrate(w)return w end
return rules
