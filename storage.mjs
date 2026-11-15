// SPDX-License-Identifier: MIT
export async function persistence(module, status) {
  module.FS.mkdir('/saves');
  let mounted = false;
  try {
    module.FS.mount(module.IDBFS, {}, '/saves'); mounted = true;
    await new Promise((resolve, reject) => module.FS.syncfs(true, error => error ? reject(error) : resolve()));
  } catch { mounted=false;module.saveStatus='unavailable';status('Persistent storage is unavailable. This run is temporary; export your save before closing.'); }
  let busy = false, pending = false;
  module.saveGeneration = module.savedGeneration = 0;
  const flush = () => {
    const generation = module.saveGeneration;
    busy = true;
    module.FS.syncfs(false, error => {
      busy = false;
      if (!error) module.savedGeneration = generation;
      module.saveStatus = error ? 'failed' : 'saved';
      if (error) status('Save could not be synchronized. Export a backup before closing this tab.');
      if (pending) { pending = false; module.saveStatus = 'saving'; flush(); }
    });
  };
  module.persist = () => {
    if (!mounted) return;
    module.saveGeneration++;
    module.saveStatus = 'saving';
    if (busy) { pending = true; return; }
    flush();
  };
}

export async function loadPack({fetch, cache, base = 'assets/', signal}) {
  async function request(path) {
    let response;
    try { response = await fetch(path, {cache:'no-cache',signal}); }
    catch (error) { if(signal?.aborted) throw error; response = await cache?.match(path); if (!response) throw error; }
    if (!response.ok) throw new Error(`Could not load ${path}.`);
    if (cache) { try { await cache.put(path, response.clone()); } catch { /* C validates cached bytes before use. */ } }
    return new Uint8Array(await response.arrayBuffer());
  }
  const bytes = await request(`${base}manifest.json`);
  const manifest = JSON.parse(new TextDecoder().decode(bytes));
  if (!manifest || manifest.schema !== 1 || !Array.isArray(manifest.files) || !manifest.files.length || manifest.files.length > 64) throw new Error('Unsupported content manifest.');
  const names = new Set();
  for (const file of manifest.files) {
    if (typeof file.path !== 'string' || !/^[a-zA-Z0-9_./-]{1,191}$/.test(file.path) || file.path.split('/').some(s => !s || s === '.' || s === '..') || names.has(file.path) || !/^[0-9a-f]{64}$/.test(file.sha256)) throw new Error('Unsafe content entry.');
    names.add(file.path);
  }
  const files = await Promise.all(manifest.files.map(async file => [file.path, await request(`${base}${file.path}?v=${file.sha256}`)]));
  return [['manifest.json', bytes], ...files];
}

export function installFiles(module, files, root = '/assets') {
  module.FS.mkdir(root);
  for (const [path, bytes] of files) {
    const parts = path.split('/'); parts.pop();
    let directory = root;
    for (const part of parts) { directory += `/${part}`; module.FS.mkdirTree(directory); }
    module.FS.writeFile(`${root}/${path}`, bytes);
  }
}

export function credits(files) {
  const manifest=JSON.parse(new TextDecoder().decode(files[0][1]));
  return 'Advent2026 code: MIT. Original art: CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/).\n'+
    manifest.files.map(file=>`${file.path} — ${file.creator} — ${file.license}`).join('\n');
}

export async function activatePack(module, options) {
  const files=await loadPack(options);
  if(options.signal?.aborted) throw new Error('World loading cancelled.');
  const root='/world-'+(module.packSequence=(module.packSequence||0)+1);
  const remove=(directory, entries)=>{
    const directories=new Set([directory]);
    for(const [path] of entries){module.FS.unlink(`${directory}/${path}`);const parts=path.split('/');parts.pop();let parent=directory;for(const part of parts){parent+='/'+part;directories.add(parent);}}
    for(const path of [...directories].sort((a,b)=>b.length-a.length))module.FS.rmdir(path);
  };
  installFiles(module,files,root);
  const name=new TextEncoder().encode(root+'\0'),pointer=module._malloc(name.length);
  let ok=false;
  try {
    if(!pointer)throw new Error('Not enough memory to activate this world.');
    module.HEAPU8.set(name,pointer);
    ok=!!module._advent_pack(pointer);
    if(!ok)throw new Error('Return both local players to the hall before changing worlds. The pack must validate and match this engine.');
  } finally { if(pointer)module._free(pointer);if(!ok)remove(root,files); }
  if(module.activeFiles)remove(module.activeRoot,module.activeFiles);
  module.activeRoot=root;module.activeFiles=files;
  return credits(files);
}

export function exportSave(module) {
  if (!module._advent_save(0)) throw new Error('Only local runs can be exported.');
  return module.FS.readFile('/saves/export.adv');
}
export function importSave(module, bytes) {
  if (bytes.byteLength > 32833 || bytes.byteLength <= 64) throw new Error('Invalid save size.');
  module.FS.writeFile('/saves/import.adv', new Uint8Array(bytes));
  if (!module._advent_save(1)) throw new Error('This save is invalid, uses different content, or belongs to a different season mode.');
}
