# Advent 2026 — play

**[Play Advent 2026 on GitHub Pages](https://stbange.github.io/advent2026play/)**

All 24 early episodes include approved ElevenLabs music, ambience and effects. This revision adds distinct world scenery, carpet flight through desert/castle/cave spaces, a giant mech cockpit, a boardable twin-cannon tracked tank, an original explorer companion and a grey cyberpunk city. These are first versions; further gameplay and art production remains.

Enable **Preview all available doors** before December. Otherwise doors open daily at 00:00 UTC from 1–24 December 2026. Choose a world and difficulty, then enter the hall. Click or tap the game view to enable sound; volume controls are in Settings. No ElevenLabs account or runtime service is required.

Use WASD/mouse, click to fire, E to use, Space to jump, Q alternate, C command, Tab next and R/F vertical. Near Crystal Front's tank, C boards and Q dismounts. Phones show touch controls. The world renders within 384 × 240 pixels while the interface stays readable at display resolution.

Offline play and two local views need no server. Online rooms require a separately hosted authoritative server and matching content; enter its WSS address in the lobby. GitHub Pages hosts this static client.

Source: [stbange/advent2026 at acaf93b](https://github.com/stbange/advent2026/tree/acaf93b59184f28fdf83814df76df0698ef4df96). Read the [world/role implementation](https://github.com/stbange/advent2026/blob/acaf93b59184f28fdf83814df76df0698ef4df96/docs/world-production.md), [current verification](https://github.com/stbange/advent2026/tree/acaf93b59184f28fdf83814df76df0698ef4df96/verification/world-production), [audio production](https://github.com/stbange/advent2026/blob/acaf93b59184f28fdf83814df76df0698ef4df96/docs/audio-production.md), and [M7 status](https://github.com/stbange/advent2026/blob/acaf93b59184f28fdf83814df76df0698ef4df96/docs/m7-production.md). [build-info.json](build-info.json) inventories every runtime file with its size and SHA-256 hash.

All 24 actual Wasm entries passed loading, measured non-silent audio, save and WebGL checks, including touch emulation and local split screen. Normal-action campaigns, tank boarding/destruction/recovery, checkpoint restores, browser victory, co-op/reconnect and sixteen seats passed. Independent C/Lua/JavaScript and world-authoring unit gates remain at 95%.

**M7 remains open.** Remaining work includes catalogued mechanics such as separately targetable mech components, full per-episode alternate-route/failure scenario acceptance, further recognizable art/gameplay polish, human pacing/balance and physical phone/controller/headset qualification. Simulated campaign duration does not establish human playtime or recognition of the original games.

Code: [MIT](LICENSE). Original art/fallback audio: [CC BY 4.0](ART-LICENSE.md). Generated audio portions: [LicenseRef-ElevenLabsMedia](licenses/ElevenLabsMedia.txt), for use in this combined game. **Created in collaboration with ElevenLabs.** Dependencies retain their [own notices](THIRD_PARTY_NOTICES.md). Classic games are research references; their assets are not included.
