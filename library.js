// SPDX-License-Identifier: MIT
mergeInto(LibraryManager.library, {
  advent_web_graphics__deps: ['$GL'],
  advent_web_graphics: function() {
    Module.adventGL = GL.currentContext.GLctx;
  },
  advent_web_sync: function() {
    if (Module.persist) Module.persist();
  },
  advent_web_identity: function(token, url, room, seat) {
    try { localStorage.setItem('advent-token:' + UTF8ToString(url) + ':room:' + (room+1) + ':seat:' + (seat+1), UTF8ToString(token)); }
    catch { Module.storageWarning = true; if (Module.onStorageWarning) Module.onStorageWarning(); }
  },
  advent_web_report: function(tick, zone, health, keys, valves, phase, won, ornament, ready, rejoins, x, z) {
    Module.adventState = {tick, zone, health, keys, valves, phase, won, ornament, ready:!!ready, rejoins, x, z};
    Module.adventReportTime = Date.now();
    const portal=Module._advent_portal_request?.();
    if(portal && Module.onPortal)Module.onPortal(portal);
  }
});
