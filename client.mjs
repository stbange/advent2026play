// SPDX-License-Identifier: MIT
import { persistence, loadPack, installFiles, exportSave, importSave, credits, activatePack } from './storage.mjs';
import { XRBridge } from './xr.mjs';
export const assets = ['manifest.json'];

export function serverURL(value, protocol) {
  const url = new URL(value);
  if (!['ws:', 'wss:'].includes(url.protocol) || url.username || url.password || url.hash) throw new Error('Use a ws:// or wss:// server address without a password or fragment.');
  if (protocol === 'https:' && url.protocol !== 'wss:') throw new Error('This page needs a secure wss:// server.');
  return url.href;
}

export function bindTouch(button, action, module) {
  const down = event => { event.preventDefault(); button.setPointerCapture(event.pointerId); module._advent_touch_button(action, 1); };
  const up = event => { event.preventDefault(); module._advent_touch_button(action, 0); };
  button.addEventListener('pointerdown', down);
  for (const name of ['pointerup','pointercancel','lostpointercapture']) button.addEventListener(name, up);
  return () => { button.removeEventListener('pointerdown', down); for (const name of ['pointerup','pointercancel','lostpointercapture']) button.removeEventListener(name, up); module._advent_touch_button(action,0); };
}

export async function start({createAdvent, canvas, url, fetch, storage, bot = false, botParty = 1, preview = false, split = false, room = 1, difficulty = 'classic', base = 'assets/', onStatus}) {
  if (!['classic','story','veteran'].includes(difficulty)) throw new Error('Choose Classic, Story or Veteran difficulty.');
  onStatus('Loading the hall…');
  const module = await createAdvent({canvas, print: () => {}, printErr: text => onStatus(String(text)), onStorageWarning: () => onStatus('This browser cannot save your reconnect identity. Keep this tab open to retain it for this session.')});
  await persistence(module, onStatus);
  let cache;
  try { cache = await caches?.open('advent2026-content-2'); } catch { /* Private browsing still permits an in-memory session. */ }
  const files=await loadPack({fetch, cache, base});
  installFiles(module, files);
  module.activeFiles=files;module.activeRoot='/assets';module.credits=credits(files);
  let token = '';
  try { token = storage.getItem(`advent-token:${url}:room:${room}:seat:1`) || ''; } catch { module.storageWarning = true; }
  if (!/^[a-f0-9]{32}$/.test(token)) token = '';
  const args = ['--assets','/assets','--data-dir','/saves'];
  if (url) args.push('--server',url);
  else args.push('--difficulty',difficulty);
  if (!Number.isInteger(room) || room<1 || room>4) throw new Error('Room must be 1–4.');
  args.push('--room',String(room));
  if (preview) args.push('--preview');
  if (split) args.push('--split');
  if (token) args.push('--token',token);
  if(split && url){try {const token2=storage.getItem(`advent-token:${url}:room:${room}:seat:2`);if(/^[a-f0-9]{32}$/.test(token2))args.push('--token2',token2);}catch{module.storageWarning=true;}}
  if (bot) args.push('--bot','--bot-party',String(botParty));
  module.callMain(args);
  onStatus(module.storageWarning ? 'Connected. This browser cannot save your reconnect identity.' : 'Click the view to look around. Escape releases the mouse.');
  return module;
}

export function mount({document, window, createAdvent}) {
  const element = id => document.getElementById(id);
  const params = new URLSearchParams(window.location.search);
  element('server').value = params.get('server') || `${window.location.protocol === 'https:' ? 'wss' : 'ws'}://${window.location.hostname}:${window.location.protocol === 'https:' ? '443' : '8081'}/`;
  if (params.has('server')) element('mode').value = 'online';
  if (window.navigator?.serviceWorker) window.navigator.serviceWorker.register('./service-worker.js').catch(() => { element('status').textContent='Offline page caching is unavailable.'; });
  element('join').addEventListener('submit', async event => {
    event.preventDefault();
    const button = element('join').querySelector('button'); button.disabled = true;
    try {
      const url = element('mode').value === 'offline' ? '' : serverURL(element('server').value, window.location.protocol);
      element('stage').hidden = false;
      const module = await start({createAdvent,canvas:element('canvas'),url,fetch:window.fetch.bind(window),storage:{getItem:key=>window.localStorage.getItem(key)},bot:params.get('bot')==='1',botParty:Number(params.get('party'))||1,preview:element('preview').checked,split:element('split').checked,room:Number(element('room').value)||1,difficulty:element('difficulty').value||'classic',base:element('initial-world').value||'assets/',onStatus:text => { element('status').textContent=text; }});
      window.advent = module;
      element('credits').textContent=module.credits;
      const ordinaryLabels=Array.from({length:8},(_,i)=>element('weapon-'+(i+1)).textContent);
      const updatePalette=()=>{
        const manifest=JSON.parse(new TextDecoder().decode(module.activeFiles[0][1]));
        const carpet=manifest.id==='emberwake';
        const spells=['1 · Ember Bolt','2 · Stone Lift','3 · Ward','4 · Gust'];
        element('arsenal').textContent=carpet?'SPELLS':'GUNS';
        element('alt').textContent=carpet?'CLAIM':'ALT';
        element('jump').textContent=carpet?'BOOST':'JUMP';
        for(let i=0;i<8;i++){
          const button=element('weapon-'+(i+1));
          button.hidden=carpet && i>=4;
          button.textContent=carpet?spells[i]||'':ordinaryLabels[i];
        }
      };
      updatePalette();
      let loading;
      element('world-load').disabled=!!url;
      const loadWorld=async (base,enter=false)=>{
        if(loading || url)return;
        loading=new AbortController();element('world-load').disabled=true;element('world-cancel').hidden=false;
        try {element('credits').textContent=await activatePack(module,{fetch:window.fetch.bind(window),base,signal:loading.signal});element('status').textContent='World ready. Use its doorway to enter.';updatePalette();if(enter){module._advent_touch_button(2,1);setTimeout(()=>module._advent_touch_button(2,0),200);}}
        catch(error){element('status').textContent=error.message;}
        finally{loading=null;element('world-load').disabled=false;element('world-cancel').hidden=true;}
      };
      element('world-load').addEventListener('click',()=>loadWorld(element('world').value));
      const portals=new Map(Array.from(element('world').options||[]).filter(option=>option.dataset?.day && !option.dataset.previewOnly).map(option=>[Number(option.dataset.day),option.value]));
      module._advent_portals?.(Array.from(portals.keys()).reduce((mask,day)=>mask|(1<<(day-1)),0));
      module.onPortal=day=>{const base=portals.get(day);if(base){element('world').value=base;void loadWorld(base,true);}};
      element('world-cancel').addEventListener('click',()=>loading?.abort());
      document.body.classList.add('playing');
      element('lobby').hidden = true;
      const query = window.matchMedia('(pointer: coarse)');
      const adapt = () => { element('touch').hidden = !query.matches; };
      query.addEventListener('change',adapt); adapt();
      for (const [id, action] of [['fire',1],['use',2],['jump',4],['alt',8],['command',16],['next',32],['return',64]]) bindTouch(element(id),action,module);
      element('arsenal').addEventListener('click',()=>{
        const mask=module._advent_weapon_mask();
        element('weapon-wheel').hidden=!element('weapon-wheel').hidden || !mask;
        for(let i=1;i<=8;i++)element('weapon-'+i).disabled=!(mask&(1<<(i-1)));
      });
      for(let i=1;i<=8;i++)element('weapon-'+i).addEventListener('click',()=>{
        module._advent_weapon(i);element('weapon-wheel').hidden=true;element('canvas').focus();
      });
      const release = () => { element('weapon-wheel').hidden=true; for(let action=1;action<=64;action*=2) module._advent_touch_button(action,0); module._advent_touch_axis(0); module._advent_cancel_input(); };
      window.addEventListener('blur',release); window.addEventListener('orientationchange',release);
      for (const [id,direction] of [['up',1],['down',-1]]) {
        element(id).addEventListener('pointerdown',event=>{event.preventDefault();element(id).setPointerCapture(event.pointerId);module._advent_touch_axis(direction);});
        for (const name of ['pointerup','pointercancel','lostpointercapture'])element(id).addEventListener(name,()=>module._advent_touch_axis(0));
      }
      element('controls').hidden=false;
      try {
        const saved=JSON.parse(module.FS.readFile('/saves/settings.json',{encoding:'utf8'}));
        for(const key of ['sensitivity','fov','volume','invert','snap','seated','screen']) {
          const input=element(key);if(input.type==='checkbox')input.checked=!!saved[key];else input.value=String(saved[key]);
        }
      } catch { /* The engine uses defaults when no valid settings file exists. */ }
      for (const [id,key] of [['sensitivity',0],['fov',1],['volume',2],['invert',3],['snap',4],['seated',5],['screen',6]]) element(id).addEventListener('change',()=>{
        const input=element(id),value=input.type==='checkbox'?Number(input.checked):Number(input.value);
        if(!module._advent_setting(0,key,value))element('status').textContent='Setting could not be saved.';
      });
      element('export').addEventListener('click',()=>{
        try { const url=window.URL.createObjectURL(new Blob([exportSave(module)],{type:'application/octet-stream'}));const a=document.createElement('a');a.href=url;a.download='advent2026.adv';a.click();window.URL.revokeObjectURL(url); }
        catch(error){element('status').textContent=error.message;}
      });
      element('import').addEventListener('change',async()=>{
        try { const file=element('import').files[0];if(file)importSave(module,await file.arrayBuffer()); }
        catch(error){element('status').textContent=error.message;}
      });
      const xr=new XRBridge({module,canvas:element('canvas'),navigator:window.navigator,Layer:window.XRWebGLLayer,status:text=>{element('status').textContent=text;},fetch:window.fetch.bind(window)});
      element('xr').disabled=!(await xr.supported());
      element('xr').addEventListener('click',async()=>{try{await xr.enter({seated:element('seated').checked,snap:element('snap').checked,screen:element('screen').checked});}catch(error){element('status').textContent=error.message;}});
      element('calibrate').addEventListener('click',()=>xr.calibrate());
      element('remap').addEventListener('keydown',event=>{
        const code=event.code;let scan=0;
        if(/^Key[A-Z]$/.test(code))scan=code.charCodeAt(3)-61;
        else scan=({Space:44,Tab:43,Backspace:42,ArrowUp:82,ArrowDown:81,ArrowLeft:80,ArrowRight:79})[code]||0;
        if(scan){event.preventDefault();if(module._advent_bind(0,Number(element('action').value),scan))element('remap').textContent='Bound to '+code;}
      });
      element('canvas').focus();
    } catch (error) { element('status').textContent=error.message; button.disabled=false; }
  });
}
