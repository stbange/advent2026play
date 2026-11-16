// SPDX-License-Identifier: MIT
const cacheName = 'advent2026-engine-4';
const shell = ['./','./index.html','./style.css','./client.mjs','./storage.mjs','./xr.mjs','./screen.mjs','./screen.vert','./screen.frag','./advent.js','./advent.wasm'];
self.addEventListener('install', event => event.waitUntil(caches.open(cacheName).then(cache => cache.addAll(shell))));
self.addEventListener('activate', event => event.waitUntil(self.clients.claim()));
self.addEventListener('fetch', event => {
  if (event.request.method !== 'GET' || new URL(event.request.url).origin !== self.location.origin) return;
  event.respondWith((async () => {
    const cache = await caches.open(cacheName);
    try {
      const response = await fetch(event.request);
      if (response.ok) await cache.put(event.request, response.clone());
      return response;
    } catch (error) {
      const response = await cache.match(event.request);
      if (!response) throw error;
      return response;
    }
  })());
});
