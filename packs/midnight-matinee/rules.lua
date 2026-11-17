-- SPDX-License-Identifier: MIT
-- Immutable definitions are exported here; all mutable state belongs to the serialized engine.
local cfg={["schema"]=1,["title"]="Midnight Matinee — No Refunds",["world_metres"]={120,80},["target_first_play_minutes"]=20,["points"]={{15.0,0.05,68.75},{27.5,0.05,63.75},{18.75,0.05,47.5},{17.5,0.05,37.5},{33.75,0.05,47.5},{60.0,0.05,62.5},{60.0,0.05,50.0},{46.25,0.05,50.0},{46.25,0.05,38.75},{42.5,0.05,31.25},{67.5,0.05,35.0},{68.75,8.05,43.125},{68.75,0.05,18.75},{88.75,0.05,18.75},{102.5,0.05,26.25},{87.5,8.05,40.0},{100.0,0.05,42.5},{100.0,8.05,42.5},{87.5,8.05,52.5},{86.25,8.05,60.0},{88.75,8.05,65.0},{96.25,8.05,65.0},{105.0,8.05,55.0},{107.5,8.05,42.5},{107.5,8.05,31.25},{70.0,0.05,63.75},{15.0,0.05,68.75},{26.25,0.05,37.5},{18.75,0.05,63.75},{18.75,0.05,53.75},{28.75,0.05,47.5},{60.0,0.05,56.25},{46.25,0.05,43.75},{56.25,0.05,38.75},{67.5,0.05,24.375},{78.75,0.05,18.75},{87.5,0.05,21.25},{87.5,4.05,28.75},{87.5,8.05,36.25},{87.5,8.05,46.25},{101.25,8.05,65.0},{107.5,8.05,48.75},{107.5,8.05,36.25},{33.75,0.05,25.0},{38.75,0.05,38.75},{78.75,8.05,43.125},{82.5,8.05,67.5},{12.5,0.05,36.25},{82.5,0.05,50.0},{60.0,0.05,17.5},{23.75,0.05,47.5},{50.0,0.05,32.5},{13.75,0.05,62.5},{111.25,8.05,58.75},{26.25,0.05,35.0},{21.25,0.05,40.0}},["node_names"]={"delivery","street","diner","kitchen","alley","forecourt","foyer","concessions","arcade","breaker","auditorium","balcony","backstage","effects","miniatures","projection","lift_base","lift_top","west_roof","ducts","crane","bridge","east_roof","transmitter","amplifier","boss","exit","staff_card","street_west","diner_door","diner_side","foyer_entry","arcade_entry","aud_entry","screen","backstage_east","ramp_foot","ramp_mid","ramp_top","booth_exit","roof_link","east_link","tower_link","rear_alley","fire_escape","booth_balcony","billboard","freezer","toilets","crew_room","pool_table","arcade_target","ad_secret","rooftop_cache","security"},["links"]={{0,28},{28,1},{28,29},{29,2},{2,3},{27,54},{3,47},{2,50},{2,30},{30,4},{4,43},{43,44},{44,8},{1,5},{4,1},{5,31},{31,6},{6,7},{7,32},{32,8},{8,9},{9,51},{8,33},{33,10},{10,34},{34,12},{12,49},{12,35},{35,13},{13,14},{13,36},{36,37},{37,38},{38,15},{15,45},{45,11},{15,39},{39,18},{14,16},{17,41},{18,19},{19,20},{20,46},{20,21},{21,40},{40,22},{22,53},{22,41},{41,23},{23,42},{42,24},{5,25},{25,26},{0,52},{6,48},{3,55},{55,27}},["encounters"]={{["name"]="Delivery ambush",["node"]=1,["roster"]={0,0,1,0,0,3,0,1},["variants"]={0,1,0,2,3,0,0,1}},{["name"]="Diner invasion",["node"]=2,["roster"]={1,0,0,3,3,0,1,0},["variants"]={2,1,2,1,2,3,3,0}},{["name"]="Alley crossfire",["node"]=4,["roster"]={2,0,0,1,3,3,0,2},["variants"]={0,1,2,0,3,0,3,1}},{["name"]="Ticket rush",["node"]=6,["roster"]={1,0,3,3,0,1,0,0},["variants"]={1,0,1,2,1,2,2,3}},{["name"]="Arcade infestation",["node"]=8,["roster"]={3,3,3,0,5,3,1,5},["variants"]={3,0,1,0,0,2,3,1}},{["name"]="Screen war",["node"]=10,["roster"]={2,0,1,4,2,0,3,0,1,4},["variants"]={2,1,0,0,3,2,3,3,1,1}},{["name"]="Backstage breach",["node"]=12,["roster"]={0,1,3,3,5,0,6,1},["variants"]={0,2,0,1,2,1,0,3}},{["name"]="Practical effects",["node"]=14,["roster"]={6,0,3,3,1,6,0,5},["variants"]={1,2,2,3,0,2,3,3}},{["name"]="Projection pirates",["node"]=15,["roster"]={6,0,1,4,0,6,3,3},["variants"]={3,0,1,2,1,0,0,1}},{["name"]="Rooftop ambush",["node"]=18,["roster"]={2,2,0,7,4,0,2,3},["variants"]={0,1,2,0,3,3,2,2}},{["name"]="Bridge defense",["node"]=22,["roster"]={7,0,2,4,1,0,2,6},["variants"]={1,0,3,0,2,1,0,1}},{["name"]="Broadcast guards",["node"]=23,["roster"]={7,6,2,0,4,7,0,1},["variants"]={2,2,1,2,1,3,3,3}},{["name"]="Return to the street",["node"]=25,["roster"]={0,1,2,3,3,0},["variants"]={0,0,2,3,0,1}}},["props"]={{["name"]="shutter",["node"]=31,["type"]=0,["hp"]=80},{["name"]="breaker",["node"]=9,["type"]=1,["hp"]=30},{["name"]="projector",["node"]=15,["type"]=2,["hp"]=90},{["name"]="crane",["node"]=20,["type"]=3,["hp"]=60},{["name"]="lift",["node"]=16,["type"]=4,["hp"]=1000},{["name"]="rig",["node"]=10,["type"]=5,["hp"]=30},{["name"]="marquee",["node"]=5,["type"]=6,["hp"]=80},{["name"]="glass",["node"]=1,["type"]=7,["hp"]=10},{["name"]="popcorn",["node"]=7,["type"]=8,["hp"]=30},{["name"]="vent",["node"]=48,["type"]=9,["hp"]=15},{["name"]="soda",["node"]=2,["type"]=10,["hp"]=1000},{["name"]="arcade",["node"]=51,["type"]=11,["hp"]=30},{["name"]="pool",["node"]=50,["type"]=12,["hp"]=1000},{["name"]="advert",["node"]=52,["type"]=13,["hp"]=15},{["name"]="freezer",["node"]=47,["type"]=14,["hp"]=1000},{["name"]="fan",["node"]=14,["type"]=15,["hp"]=25},{["name"]="amplifier",["node"]=24,["type"]=16,["hp"]=140},{["name"]="mirror",["node"]=48,["type"]=17,["hp"]=10},{["name"]="monitor",["node"]=54,["type"]=18,["hp"]=1000},{["name"]="film",["node"]=10,["type"]=19,["hp"]=30}},["weapons"]={{["name"]="SERVICE PISTOL",["damage"]=14,["cooldown"]=12,["spread"]=0,["ammo"]=72},{["name"]="DOORBUSTER",["damage"]=72,["cooldown"]=38,["spread"]=0.07,["ammo"]=32},{["name"]="PIPE CHARGES",["damage"]=120,["cooldown"]=30,["spread"]=0,["ammo"]=10},{["name"]="ROTARY CANNON",["damage"]=16,["cooldown"]=5,["spread"]=0.025,["ammo"]=160},{["name"]="RPG",["damage"]=135,["cooldown"]=42,["spread"]=0,["ammo"]=12},{["name"]="POCKET RAY",["damage"]=3,["cooldown"]=24,["spread"]=0,["ammo"]=24},{["name"]="CRYO SPRAYER",["damage"]=5,["cooldown"]=9,["spread"]=0.03,["ammo"]=100},{["name"]="TWIN MISSILES",["damage"]=74,["cooldown"]=12,["spread"]=0.025,["ammo"]=32}},["weapon_nodes"]={0,1,4,8,10,14,18,24},["secrets"]={{["node"]=52,["trigger"]=13},{["node"]=51,["trigger"]=11},{["node"]=48,["trigger"]=9},{["node"]=49,["trigger"]=-1},{["node"]=47,["trigger"]=14},{["node"]=46,["trigger"]=-1},{["node"]=50,["trigger"]=12}},["quotes"]={"Night shift. Of course it is.","No outside food. Humans included.","Small: eight. Large: eleven. Surrender: market price.","I do my own stunts. Mostly by accident.","Your table is ready. Your planet is not.","In an emergency, finish your shift.","Now it is an open-air cinema.","I need to speak to your manager!","We will fix your death in post.","Worst midnight screening ever.","That is one expensive popcorn refill.","Please validate my parking.","The audience is revolting. Finally, honest reviews.","Cut! No, the OTHER arm!","A little less conversation. Literally.","Chill. The previews are still running.","No refunds. No survivors? We will see.","Keep your feet off the seats. Unless you are shrinking.","Is this the director cut?","That is not a special effect. Yet.","Staff only. I am having a staff meeting.","Warning: this film contains explosive opinions.","Looks like we lost the projector warranty.","The roof has excellent surround sound.","You are obstructing my dramatic entrance.","Please switch your tentacles to silent.","Nice helmet. Does it come in tiny?","That is my cue.","Five stars for property damage.","The sequel has been cancelled.","Projection restored. Sensible management unavailable.","The cooling is finally working.","Safety first. Giant missiles second.","A complimentary drink! Only slightly radioactive.","The pool table was rigged. So was the invasion.","That is the smallest complaint I have ever heard.","Security footage: aliens still hate stairs.","I am taking this film reel as evidence.","You cannot park a spaceship there.","Midnight Matinee. NO REFUNDS."},["objectives"]={"CLEAR THE DELIVERY BAY. THE CINEMA IS STRAIGHT AHEAD.","VISIT THE DINER OR TAKE THE SERVICE ALLEY.","OPEN THE TICKET SHUTTER: USE, CHARGE, OR TAKE THE ARCADE ENTRANCE.","ARCADE: CUT THE POWER OR CROSS ON THE DRY PLATFORMS.","THROUGH THE AUDITORIUM. WATCH THE BALCONY!","BREACH THE SCREEN AND REACH THE PRACTICAL EFFECTS WORKSHOP.","TAKE THE RAMP OR FREIGHT LIFT TO THE PROJECTION BOOTH.","USE THE PROJECTOR TO REDIRECT ITS BEAM, OR DESTROY IT.","REACH THE ROOFTOPS. ALT TO TOGGLE YOUR JETPACK.","LOWER THE CRANE WALKWAY OR FLY ACROSS THE GAP.","DESTROY THE BROADCAST GUARDS AND AMPLIFIER.","THE PRODUCER HAS ARRIVED. RETURN TO THE STREET.","THE PRODUCER: KEEP MOVING. EVERY WEAPON CAN HURT HIM.","NO REFUNDS! RETURN TO THE DELIVERY BAY PORTAL."}}
local rules={}
local get,set=engine.get,engine.set
local inv=engine.inventory
local function item(h,k,v)return engine.item(h,k,math.max(0,math.min(999,v))-inv(h,k))end
local function point(n)local p=cfg.points[n+1];return {x=p[1],y=p[2],z=p[3]}end
local function distance(a,b)return math.sqrt((a.x-b.x)^2+(a.y-b.y)^2+(a.z-b.z)^2)end
local function near(a,b,r)return a and b and distance(a,b)<r end
local function marked(slot,bit)return get(slot)&(1<<bit)~=0 end
local function flag(slot,bit)set(slot,get(slot)|(1<<bit))end
local function base(i)return 32+(i-1)*6 end
local function body(p)return engine.actor(p.body)end
local function effect(p,kind,lifetime)
 local h=engine.spawn{x=p.x,y=p.y,z=p.z,kind=90,hp=0,max_hp=0,mode=3,radius=0,height=.2,lifetime=lifetime or 24}
 item(h,8,kind);return h
end
local function quote(w,id)
 local slot=30+id//24;local bit=id%24
 if w.tick<get(10) or marked(slot,bit)then return end
 flag(slot,bit);set(8,id);set(9,w.tick+240);set(10,w.tick+300)
end
local function checkpoint(node)
 set(7,node);set(20,get(20)+1);engine.checkpoint(1000+get(20))
end
local function goal(node,buttons,line,target,weapon)
 set(56,node);set(57,buttons or 2);set(60,line);set(58,target or 0);set(25,weapon or -1)
end
local function spawn_at(node,kind,hp,team,owner,mode)
 local p=point(node)
 return engine.spawn{x=p.x,y=p.y,z=p.z,kind=kind,hp=hp,max_hp=hp,team=team or 0,owner=owner or 0,mode=mode or 3,radius=.4,height=1.8,speed=4}
end
local stats={
 {hp=48,height=1.9,radius=.4,speed=3.5,damage=7,period=135},
 {hp=96,height=2.2,radius=.55,speed=2.8,damage=15,period=150},
 {hp=68,height=1.9,radius=.4,speed=4.5,damage=7,period=115,fly=true},
 {hp=23,height=.8,radius=.35,speed=6,damage=9,period=100},
 {hp=110,height=1.8,radius=.6,speed=2.3,damage=12,period=160,fly=true},
 {hp=90,height=1,radius=.45,speed=3,damage=8,period=180},
 {hp=105,height=2.1,radius=.4,speed=4.3,damage=9,period=125},
 {hp=220,height=2.6,radius=.65,speed=2,damage=42,period=210},
 {hp=4800,height=6.2,radius=1.8,speed=3,damage=42,period=110}}
local function enemy(w,node,role,encounter,index)
 local p=point(node);local s=stats[role+1];local angle=(index or 0)*2.4
 local seats=0;for _,q in ipairs(w.players)do if q.connected==1 and q.zone==1 then seats=seats+1 end end
 local hp=math.floor((encounter==15 and 650 or s.hp)*(role==8 and (1+math.max(0,seats-1)*.4) or (1+math.max(0,seats-1)*.08)))
 local h=engine.spawn{x=p.x+math.sin(angle)*1.875,y=p.y+(s.fly and 2.8 or 0),z=p.z+math.cos(angle)*1.875,kind=40+role,hp=hp,max_hp=hp,team=1,mode=encounter==15 and 3 or s.fly and 1 or 0,radius=s.radius,height=s.height,speed=s.speed}
 item(h,7,encounter);item(h,10,math.min(999,hp//10));item(h,12,30+(index or 0)*11)
 local cast=cfg.encounters[encounter]
 item(h,6,cast and cast.variants[index] or 0);item(h,11,hp%1000);item(h,13,hp//1000)
 return h
end
local function props()
 for i,definition in ipairs(cfg.props)do
  local p=point(definition.node);local kind=i-1
  if kind==5 then p.y=6.6 elseif kind==6 then p.y=5;p.z=56.875;p.x=70
  elseif kind==7 then p.x,p.z=24.375,61.875 elseif kind==8 then p.x=p.x+1.875
  elseif kind==19 then p.z=22.5 end
  local h=engine.spawn{x=p.x,y=p.y,z=p.z,kind=50+kind,hp=definition.hp,max_hp=definition.hp,team=2,mode=3,radius=kind==0 and .8 or kind==4 and 0 or .5,height=kind==16 and 3.5 or 2.5}
  item(h,0,kind);item(h,11,definition.hp==1000 and 1 or 0)
 end
 for _,node in ipairs({1,4,12,18,23})do
  local p=point(node);local h=engine.spawn{x=p.x+2.5,y=p.y,z=p.z+1.25,kind=77,hp=24,max_hp=24,team=2,mode=3,radius=.5,height=1.2}
  item(h,0,node)
 end
 for gun=1,7 do
  local h=spawn_at(cfg.weapon_nodes[gun+1],76,1,2);engine.shape(h,.05,.2);item(h,0,gun);item(h,11,1)
 end
end
function rules.init(w)
 if not engine.reset(12012026)then return w end
 w.keys,w.valves,w.phase,w.won=0,0,0,0
 set(0,1);set(63,101);set(5,1);set(25,-1);set(7,0);set(8,-1)
 props();goal(1,0,0)
 return w
end
local function enter(w,p,i)
 local h=get(base(i));local a=engine.actor(h)
 if not a then
  h=spawn_at(get(7),20,100,0,i-1,0)
  if h==0 then return end
  engine.shape(h,.3,1.7);engine.mode(h,0,7.2);item(h,15,8);item(h,9,get(5));item(h,8,30)
  for gun=0,7 do if marked(5,gun)then item(h,gun,cfg.weapons[gun+1].ammo)end end
  if marked(5,6)then item(h,14,600)end
  set(base(i),h)
 end
 engine.possess(i-1,h);p.zone,p.body,p.eligible=1,h,w.won==0 and 1 or 0
end
local function unlock(w,gun)
 if marked(5,gun)then return end
 flag(5,gun)
 for _,p in ipairs(w.players)do if p.zone==1 and p.body~=0 then
  item(p.body,9,get(5));item(p.body,gun,cfg.weapons[gun+1].ammo);item(p.body,13,gun)
  if gun==6 then item(p.body,14,600)end
 end end
 checkpoint(cfg.weapon_nodes[gun+1]);quote(w,({0,3,20,12,21,14,15,32})[gun+1])
end
local function hit(w,source,target,amount,weapon)
 local a=engine.actor(target)
 if not a or a.hp==0 then return end
 if a.kind>=40 and a.kind<=48 then
  local status=inv(target,3)
  if status==1 and weapon~=6 then amount=amount*3;effect(a,204);quote(w,15)end
  if status==2 and a.kind~=48 and weapon==8 then amount=999;quote(w,35)end
  engine.damage(target,source,amount)
  if weapon~=6 then item(target,0,6);item(target,4,12)end
  if weapon==5 or weapon==6 then
   local mode=weapon==6 and 1 or 2
   item(target,3,mode);item(target,2,a.kind==48 and 45 or 420)
   if mode==2 and a.kind~=48 then
    engine.shape(target,.1,.42);engine.mode(target,0,4.2);quote(w,7)
   elseif mode==1 then engine.mode(target,3,0)end
  end
 else engine.damage(target,source,amount)end
 engine.effect(source,target,weapon==6 and 204 or 202)
end
local function shot(w,p,i,weapon)
 local h=p.body;local a=body(p);local b=base(i);local spec=cfg.weapons[weapon+1]
 if w.tick<get(b+1) or inv(h,weapon)==0 then return false end
 local yaw,pitch=p.yaw,p.pitch
 local dx,dy,dz=math.sin(yaw)*math.cos(pitch),math.sin(pitch),-math.cos(yaw)*math.cos(pitch)
 local fired=true
 if weapon==2 or weapon==4 or weapon==7 then
  local speed=weapon==2 and 13 or weapon==4 and 33 or 44
  local projectile=engine.projectile(h,dx,dy+(weapon==2 and .2 or 0),dz,speed,spec.damage,0,0,weapon==2 and 100 or 160)
  fired=projectile~=0
  if fired then
   item(projectile,5,weapon==2 and 9 or 16);item(projectile,8,weapon==2 and 206 or 205)
   item(projectile,9,weapon==2 and 999 or 24);item(projectile,4,weapon==7 and 5 or 7)
  end
 else
  local pellets=weapon==1 and 6 or 1
  for n=1,pellets do
   local spread=spec.spread;local offset=((engine.random(0)%1000)/500-1)*spread
   local angle=yaw+offset;local lift=pitch+offset*.6
   local trace=engine.trace(h,math.sin(angle)*math.cos(lift),math.sin(lift),-math.cos(angle)*math.cos(lift),100)
   if trace.target~=0 then hit(w,h,trace.target,math.floor(spec.damage/pellets),weapon)end
   if n==1 then effect(trace,trace.target==0 and 201 or weapon==6 and 204 or 202,18)end
  end
 end
 if fired then
  engine.item(h,weapon,-1);set(b+1,w.tick+spec.cooldown);set(b+5,w.tick);p.cooldown=spec.cooldown
  item(h,12,1);engine.effect(h,0,210+weapon)
 end
 return fired
end
local function detonate(w,p)
 local count=0
 for _,h in ipairs(engine.list())do local a=engine.actor(h)
  if a and a.owner==engine.actor(p.body).owner and inv(h,8)==206 then
   engine.blast(p.body,a.x,a.y+.12,a.z,7,140);effect(a,205,28);engine.effect(p.body,0,205);engine.remove(h);count=count+1
  end
 end
 if count>0 then quote(w,28)end
 return count
end
local function kick(w,p,i)
 local b=base(i);if w.tick<get(b+3)then return end
 set(b+3,w.tick+30);item(p.body,12,3)
 local a=body(p);local best,range=0,3.1
 for _,h in ipairs(engine.list())do local target=engine.actor(h)
  if target and h~=p.body and target.hp>0 and target.team~=0 and target.kind~=76 then
   local d=distance(a,target);local facing=math.sin(p.yaw)*(target.x-a.x)-math.cos(p.yaw)*(target.z-a.z)
   if d<range and facing>-.1 then best,range=h,d end
  end
 end
 if best~=0 then
  hit(w,p.body,best,34,8);engine.mode(best,0,0);engine.impulse(best,math.sin(p.yaw)*8,1,-math.cos(p.yaw)*8)
 end
end
local function translate(first,y,z)
 local steps=math.ceil(math.sqrt(y*y+z*z))
 for step=1,steps do if not engine.platform(first,0,y/steps,z/steps)then
  for _=1,step-1 do engine.platform(first,0,-y/steps,-z/steps)end
  return false
 end end
 return true
end
local function use_prop(w,p,h,kind,damaged)
 local a=engine.actor(h)
 if marked(3,kind) and kind~=4 and kind~=10 and kind~=18 then return end
 if kind==0 then
  if not damaged and not marked(6,0) and not marked(5,2)then quote(w,20);return end
  if translate(engine.collision_start,-6,0)then flag(3,0);checkpoint(6)end
 elseif kind==1 then flag(3,1);quote(w,5)
 elseif kind==2 then flag(3,2);if not damaged then flag(6,1)end;quote(w,damaged and 22 or 30);checkpoint(15)
 elseif kind==3 then flag(3,3);quote(w,23)
 elseif kind==4 then set(12,get(12)==1 and 0 or 1)
 elseif kind==5 then
  if translate(engine.collision_start+36,-6.6,-2.5)then
   flag(3,5);engine.blast(p.body,a.x,.6,a.z-2.5,7,180);quote(w,19)
  end
 elseif kind==6 then
  if translate(engine.collision_start+48,-5.5,1.25)then flag(3,6);quote(w,6)end
 elseif kind==19 then
  if translate(engine.collision_start+60,-10,0)then flag(3,19);quote(w,19)end
 elseif kind==7 or kind==8 or kind==9 or kind==13 or kind==15 or kind==17 then
  flag(3,kind);effect(a,(kind==7 or kind==17) and 203 or 201)
  if kind==8 then engine.mode(h,0,0);engine.impulse(h,math.sin(p.yaw)*6,1,-math.cos(p.yaw)*6);quote(w,10)end
  if kind==9 then quote(w,17)elseif kind==15 then quote(w,31)end
 elseif kind==10 then
  if not marked(6,2)then engine.heal(p.body,25,0);flag(6,2);quote(w,33)end
 elseif kind==11 then flag(3,11);quote(w,12)
 elseif kind==12 then flag(3,12);quote(w,34)
 elseif kind==14 then flag(3,14);quote(w,31)
 elseif kind==16 then
  if damaged then flag(3,16);quote(w,8);checkpoint(24)end
 elseif kind==18 then
  for i,q in ipairs(w.players)do if q.body==p.body then set(base(i)+4,w.tick+300)end end
  quote(w,36)
 end
 if marked(3,kind)then item(h,1,1)end
end
local function interact(w,p)
 local a=body(p)
 if near(a,point(27),6) or near(a,point(2),5)then flag(6,0);quote(w,4)end
 for _,h in ipairs(engine.list())do local target=engine.actor(h)
  if target and target.kind>=50 and target.kind<=69 and near(a,target,target.kind==55 and 10 or 3.5)then use_prop(w,p,h,target.kind-50,false)end
 end
end
local function personal(w,p,i)
 local a=body(p);local b=base(i)
 if not a then enter(w,p,i);return end
 if a.hp==0 then
  if p.respawn==0 then p.respawn=w.tick+150 end
  if w.tick>=p.respawn then
   engine.heal(p.body,100,100);engine.mode(p.body,0,7.2);engine.warp(p.body,get(7));p.respawn=0
   item(p.body,0,math.max(36,inv(p.body,0)));item(p.body,8,20)
  end
  return
 end
 local buttons=(p.use~=0 and 2 or 0)|(p.jump~=0 and 4 or 0)|(p.alt~=0 and 8 or 0)|(p.command~=0 and 16 or 0)|(p.next~=0 and 32 or 0)
 local pressed=buttons&~get(b+2);set(b+2,buttons)
 -- A reconnecting seat receives every shared weapon discovery once, with its own ammunition.
 for gun=0,7 do if marked(5,gun) and inv(p.body,9)&(1<<gun)==0 then item(p.body,gun,cfg.weapons[gun+1].ammo);if gun==6 then item(p.body,14,600)end end end
 item(p.body,9,get(5))
 if p.weapon and p.weapon>=1 and p.weapon<=8 and marked(5,p.weapon-1)then
  item(p.body,13,p.weapon-1)
 elseif pressed&32~=0 then
  local weapon=inv(p.body,13)
  repeat weapon=(weapon+1)%8 until marked(5,weapon)
  item(p.body,13,weapon)
 end
 if pressed&2~=0 then interact(w,p)end
 if pressed&16~=0 then if detonate(w,p)==0 then kick(w,p,i)end end
 if pressed&8~=0 then
  if marked(5,6) and inv(p.body,14)>0 then engine.mode(p.body,a.mode==1 and 0 or 1,7.2)else kick(w,p,i)end
 end
 if a.mode==1 then
  if w.tick%3==0 then item(p.body,14,inv(p.body,14)-1)end
  if inv(p.body,14)==0 then engine.mode(p.body,0,7.2)end
 elseif marked(5,6) and a.grounded==1 and w.tick%20==0 then item(p.body,14,math.min(600,inv(p.body,14)+4))end
 if p.fire~=0 then shot(w,p,i,inv(p.body,13))end
 if p.fire==0 and w.tick-get(b+5)>12 and w.tick>=get(b+3)then item(p.body,12,0)end
 -- An empty player always has a slow, finite pistol recovery instead of a softlock.
 if w.tick%120==0 and inv(p.body,0)<12 then engine.item(p.body,0,1)end
 for gun=1,7 do if not marked(5,gun) and near(a,point(cfg.weapon_nodes[gun+1]),3)then unlock(w,gun)end end
 for index,secret in ipairs(cfg.secrets)do
  if not marked(4,index-1) and near(a,point(secret.node),2.8) and (secret.trigger<0 or marked(3,secret.trigger))then
   flag(4,index-1);engine.heal(p.body,30,0);item(p.body,8,math.min(100,inv(p.body,8)+35))
   for gun=0,7 do if marked(5,gun)then item(p.body,gun,inv(p.body,gun)+math.max(4,cfg.weapons[gun+1].ammo//3))end end
   checkpoint(get(7));quote(w,index==6 and 37 or 27)
  end
 end
 if not marked(3,1) and a.y<.3 and a.x>41.25 and a.x<53.125 and a.z>30 and a.z<42.5 and w.tick%40==0 then engine.damage(p.body,0,4);effect(a,204)end
 if w.won==1 and pressed&2~=0 and near(a,point(0),4)then
  engine.possess(i-1,0);engine.remove(p.body);set(b,0);p.body,p.zone,p.x,p.y,p.z,p.hp=0,0,12,0,5,100
 end
end
local function nearest(w,a)
 local best,player,range=nil,nil,90
 for _,p in ipairs(w.players)do if p.connected==1 and p.zone==1 then
  local b=body(p)
  if b and b.hp>0 then local d=distance(a,b);if d<range then best,player,range=b,p,d end end
 end end
 return best,player,range
end
local function launch(h,a,b,damage,speed,ordnance)
 local projectile=engine.projectile(h,b.x-a.x,b.y+b.height*.5-a.y-a.height*.75,b.z-a.z,speed,damage,0,0,180)
 if projectile~=0 and ordnance then item(projectile,5,16);item(projectile,8,205);item(projectile,9,24);item(projectile,4,5)end
 return projectile
end
local function ai(w,h,a)
 local role=a.kind-40;local spec=stats[role+1]
 if a.hp==0 then
  local clock=inv(h,1)+1;item(h,1,clock);item(h,0,clock<15 and 7 or clock<30 and 8 or 9)
  if clock==1 then set(11,get(11)+1);effect(a,inv(h,3)==1 and 204 or 202,40)
   if get(11)%2==0 then
    local supply=engine.spawn{x=a.x,y=a.y,z=a.z,kind=78,hp=0,max_hp=0,radius=0,mode=3,lifetime=1800}
    item(supply,0,1)
   end
   if role==2 then engine.mode(h,0,0);engine.impulse(h,3,4,2)end
  end
  if clock>150 and role~=8 then engine.remove(h)end
  return
 end
 if inv(h,2)>0 then
  item(h,2,inv(h,2)-1)
  if inv(h,3)==1 then
   if inv(h,2)>0 then return end
   engine.mode(h,inv(h,7)==15 and 3 or spec.fly and 1 or 0,spec.speed);item(h,3,0)
  elseif inv(h,2)==0 then
   if role==8 or engine.shape(h,spec.radius,spec.height)then item(h,3,0);engine.mode(h,inv(h,7)==15 and 3 or spec.fly and 1 or 0,spec.speed)
   else item(h,2,30)end
  end
 end
 local target,p,range=nearest(w,a);if not target then return end
 -- Inventory slots are bounded at 999; retain the full boss HP across two slots.
 if a.hp<inv(h,11)+inv(h,13)*1000 then item(h,4,12);item(h,5,0)end
 item(h,11,a.hp%1000);item(h,13,a.hp//1000)
 if inv(h,3)==2 and role~=8 then
  if range<1.1 then hit(w,p.body,h,999,8);return end
  local dx,dz=a.x-target.x,a.z-target.z;local yaw=math.atan(dx,-dz)
  engine.move(h,0,0,-1,-yaw,0,0,false);item(h,0,1+w.tick//8%3);return
 end
 if inv(h,4)>0 then item(h,4,inv(h,4)-1);item(h,0,6);return end
 local cooldown=inv(h,12);if cooldown>0 then item(h,12,cooldown-1)end
 if inv(h,5)>0 then item(h,5,inv(h,5)-1);item(h,0,5);return end
 local yaw=math.atan(target.x-a.x,-(target.z-a.z))
 local trace=engine.trace(h,target.x-a.x,target.y+target.height*.5-a.y-a.height*.75,target.z-a.z,range+2)
 local sees=trace.target==p.body
 if role==6 and cooldown==70 and range>7 then
  local anchor=get(56);local q=engine.node(anchor)
  if q and math.abs(q.y-a.y)<2 and near(a,q,18)then effect(a,204);engine.warp(h,anchor);quote(w,24)end
 end
 if cooldown==0 and sees and range<(role==3 and 2.4 or 38)then
  if role==3 then engine.damage(p.body,h,spec.damage)
  elseif role==1 then for shot=1,3 do launch(h,a,{x=target.x+(shot-2)*.45,y=target.y,z=target.z,height=target.height},spec.damage//3,33,false)end
  elseif role==8 then
   local phase=get(21);for n=-1,1 do launch(h,a,{x=target.x+n*(phase+1),y=target.y,z=target.z,height=target.height},spec.damage,19+phase*2,true)end
  else
   local projectile=launch(h,a,target,spec.damage,role==7 and 18 or role==4 and 12 or 22,role==7)
   if role==5 and projectile~=0 then item(projectile,5,8);item(projectile,8,207);item(projectile,9,300)end
  end
  item(h,12,math.max(45,spec.period-(role==8 and get(21)*15 or 0)));item(h,0,5);item(h,5,8)
  engine.effect(h,p.body,220+role)
 elseif cooldown>0 and cooldown<24 and sees then item(h,0,4)
 else
  local moving=range>(role==3 and 1.2 or role==1 and 7 or role==7 and 15 or 11) or not sees
  if moving then
   if sees then engine.move(h,role==2 and (w.tick//120%2==0 and .5 or -.5) or 0,spec.fly and (target.y+3-a.y)*.2 or 0,-1,-yaw,0,0,role==3 and range<5)
   elseif w.tick%30==h%30 then engine.order(a.owner,h,1,target.x,target.y+(spec.fly and 2.8 or 0),target.z,0)end
   item(h,0,1+w.tick//8%3)
  else engine.order(a.owner,h,0,0,0,0,0);engine.move(h,role==0 and (w.tick//90%2==0 and .7 or -.7) or 0,0,0,-yaw,0,0,false);item(h,0,0)end
 end
end
local function scenery(w,players)
 for _,h in ipairs(engine.list())do local a=engine.actor(h)
  if a then
   if a.kind>=50 and a.kind<=69 then
    local kind=a.kind-50
    if a.hp==0 and not marked(29,kind)then
     flag(29,kind);local p=players[1];if p then use_prop(w,p,h,kind,true)end
     effect(a,(kind==7 or kind==17) and 203 or 201,40)
    end
   elseif a.kind==77 and a.hp==0 then
    local p=players[1]
    if p then engine.blast(p.body,a.x,a.y+.7,a.z,7,130)end
    effect(a,205,30);engine.remove(h)
   elseif a.kind==78 then
    for _,p in ipairs(players)do if near(body(p),a,4)then
     engine.heal(p.body,9,0);item(p.body,0,inv(p.body,0)+12)
     for gun=1,7 do if marked(5,gun)then item(p.body,gun,inv(p.body,gun)+math.max(2,cfg.weapons[gun+1].ammo//5))end end
     engine.remove(h);break
    end end
   elseif a.kind==76 and marked(5,inv(h,0))then engine.remove(h)
   elseif a.kind==7 and inv(h,8)==206 and a.expires-w.tick<120 then
    local renewed=engine.spawn{x=a.x,y=a.y,z=a.z,kind=7,hp=0,max_hp=0,mode=3,radius=0,owner=a.owner,lifetime=900}
    if renewed~=0 then item(renewed,8,206);engine.remove(h)end
   elseif a.kind==7 and inv(h,8)==207 and w.tick%30==0 then
    for _,p in ipairs(players)do if near(body(p),a,2.5)then engine.damage(p.body,0,5)end end
   elseif a.projectile==0 and a.kind>=40 and a.kind<=48 then ai(w,h,a)end
  end
 end
 local destination=get(12)==1 and 80 or 0;local current=get(13)
 if destination~=current then
  local step=destination>current and 1 or -1
  if engine.platform(engine.collision_start+12,0,step*.1,0)then set(13,current+step)end
 end
 if marked(3,3) and get(14)<70 then
  if engine.platform(engine.collision_start+24,0,.1,0)then set(14,get(14)+1)end
 end
end
local function encounters(w,players)
 for index,encounter in ipairs(cfg.encounters)do
  if not marked(26,index-1)then
   local trigger=false
   for _,p in ipairs(players)do if near(body(p),point(encounter.node),index==13 and 7.5 or 6.875)then trigger=true end end
   local count=#engine.list()
   if trigger and count+#encounter.roster<=54 and (index~=13 or marked(3,16))then
    local complete=true
    for j,role in ipairs(encounter.roster)do if enemy(w,encounter.node,role,index,j)==0 then complete=false end end
    if complete then flag(26,index-1)end
   end
  end
 end
end
local function progression(w,players)
 local stage=get(2);local nodes={1,2,31,9,10,14,15,15,18,20,24,25,25,0}
 local function at(node,r)for _,p in ipairs(players)do if near(body(p),point(node),(r or 4)*.625)then return true end end;return false end
 if stage==0 and marked(5,1)then stage=1
 elseif stage==1 and (marked(6,0) or at(4,5))then stage=2
 elseif stage==2 and (marked(3,0) or at(8,8))then stage=3
 elseif stage==3 and (marked(3,1) or at(33,3))then stage=4
 elseif stage==4 and (at(12,7) or marked(3,19))then stage=5
 elseif stage==5 and marked(5,5)then stage=6
 elseif stage==6 and at(15,4)then stage=7
 elseif stage==7 and marked(3,2)then stage=8
 elseif stage==8 and marked(5,6)then stage=9
 elseif stage==9 and (get(14)>=70 or at(22,7))then stage=10
 elseif stage==10 and marked(3,16) and (get(18)==1 or engine.actor(get(19)) and engine.actor(get(19)).hp==0) then stage=11
 elseif stage==11 and at(25,12)then stage=12 end
 if stage~=get(2)then set(2,stage);checkpoint(nodes[stage+1]);quote(w,math.min(39,stage+8))end
 if stage>=10 and get(19)==0 then
  local h=enemy(w,23,7,15,0)
  if h~=0 then set(19,h);quote(w,25)end
 end
 local manager=engine.actor(get(19))
 if manager and manager.hp==0 then set(18,1)end
 if stage>=12 and marked(3,16) and get(1)==0 and get(18)==1 then
  local h=enemy(w,25,8,14,0)
  if h~=0 then set(1,h);set(21,1);quote(w,8)end
 end
 local boss=engine.actor(get(1))
 if boss then
  if boss.hp==0 then
   if w.won==0 then w.won,w.phase=1,3;set(2,13);engine.complete(1);checkpoint(0);quote(w,39)end
  else
   local phase=boss.hp<boss.max_hp*.33 and 3 or boss.hp<boss.max_hp*.68 and 2 or 1
   if phase~=get(21)then
    set(21,phase);w.phase=phase-1;checkpoint(25)
    if phase==2 then
     for _,h in ipairs(engine.list())do local a=engine.actor(h);if a.kind==56 then use_prop(w,players[1],h,6,true)end end
    end
    engine.mode(get(1),0,phase==3 and 5.8 or 3.5);quote(w,phase==2 and 13 or 16)
   end
   if phase==3 and w.tick%300==0 then local t=nearest(w,boss);if t then engine.impulse(get(1),(t.x-boss.x)*.3,0,(t.z-boss.z)*.3)end end
   if marked(6,1) and at(15,3)then item(get(1),2,90);item(get(1),3,1)end
  end
 end
 stage=get(2)
 local node=nodes[stage+1];local action=(stage==1 or stage==2 or stage==3 or stage==7 or stage==9) and 2 or 0
 local target=0
 if stage==4 then node=34;action=2 end
 if stage==10 then
  for _,h in ipairs(engine.list())do local a=engine.actor(h);if a.kind==66 then target=h end end
  if marked(3,16)then target=get(19)end
  action=1
 elseif stage==12 then target=get(1);action=1
 elseif stage==13 then action=2 end
 -- Guidance follows real enemies; no test-only progress or damage shortcuts.
 if stage<12 then
  for _,h in ipairs(engine.list())do local a=engine.actor(h)
   if a.team==1 and a.hp>0 and a.projectile==0 and a.kind>=40 and a.kind<=48 then
    local nearby,p,range=nearest(w,a)
    if nearby and range<23 then
     local ray=engine.trace(p.body,a.x-nearby.x,a.y+a.height*.5-nearby.y-nearby.height*.75,a.z-nearby.z,range+2)
     if ray.target==h then target=h;action=1;break end
    end
   end
  end
 end
 local selected=-1
 if target~=0 then
  selected=0;local p=players[1]
  for _,gun in ipairs({4,7,1,3})do if marked(5,gun) and inv(p.body,gun)>0 then selected=gun end end
 end
 goal(node,action,stage,target,selected)
end
function rules.step(w)
 local players={}
 for i,p in ipairs(w.players)do if p.connected==1 then
  if p.zone==0 then
   if p.use~=0 and p.portal==1 and w.unlocked>=1 then
    local active=false;for _,q in ipairs(w.players)do if q.zone==1 then active=true end end
    if w.won==1 and not active then rules.init(w)end
    enter(w,p,i);quote(w,0)
   end
  else personal(w,p,i)end
  if p.zone==1 and body(p)then players[#players+1]=p end
 end end
 if #players>0 then
  set(24,get(24)+1);scenery(w,players)
  if w.won==0 then encounters(w,players)end
  progression(w,players)
 end
 return w
end
function rules.migrate(w)return w end
return rules
