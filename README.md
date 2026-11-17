# Advent 2026 — play

**[Play Advent 2026 on GitHub Pages](https://stbange.github.io/advent2026play/)**

**Latest update:** wall sprites have stable depth separation, signs read correctly from both sides, and the cinema image moves with its screen. Day One has **four darker variants of every alien type**, with walking, sustained firing, hit reactions and dying animations: 2,880 directional frames. Character lighting preserves dark materials. [Verification and screenshots](https://github.com/stbange/advent2026/tree/5c94d6d2ff478ae7489cebb05cdb3f7e22e00a79/verification/stable-surfaces-alien-variants). Reload to receive the update. Older in-progress runs may restart; archived saves and earned ornaments are retained. The larger 4096 × 2048 atlas needs 32 MiB decoded RGBA per copy; physical-device memory/performance checks remain open.

**Day One is Midnight Matinee — No Refunds:** a connected cinema district with eight guns, eight alien roles, moving scenery, four environmental problems, seven secrets, forty subtitle jokes and the three-phase Producer finale. It retains approved ElevenLabs music/effects and adds five documented weapon-sound derivatives. The other 23 early episodes remain available.

Read the [Day One design](https://github.com/stbange/advent2026/blob/5c94d6d2ff478ae7489cebb05cdb3f7e22e00a79/docs/midnight-matinee.md) and [verification](https://github.com/stbange/advent2026/tree/5c94d6d2ff478ae7489cebb05cdb3f7e22e00a79/verification/midnight-matinee). Its **20-minute first-play duration is a design target awaiting human playtests**. Fresh solo Classic and four-player Veteran automated completion and checkpoint/reward checks pass.

Enable **Preview all available doors** before December. Otherwise doors open daily at 00:00 UTC from 1–24 December 2026. Choose a world and difficulty, then enter the hall. Click or tap the game view to enable sound; volume controls are in Settings. No ElevenLabs account or runtime service is required.

Day One: 1–8 select weapons; Tab cycles; C kicks or detonates owned charges; Q toggles the acquired jetpack; R/F fly vertically. Touch players can use the GUNS selector.

Use WASD/mouse, click to fire, E to use, Space to jump, Q alternate, C command, Tab next and R/F vertical. Near Crystal Front's tank, C boards and Q dismounts. Phones show touch controls. The world renders within 384 × 240 pixels while the interface stays readable at display resolution.

Offline play and two local views need no server. Online rooms require a separately hosted authoritative server and matching content; enter its WSS address in the lobby. GitHub Pages hosts this static client.

Source: [stbange/advent2026 at 5c94d6d](https://github.com/stbange/advent2026/tree/5c94d6d2ff478ae7489cebb05cdb3f7e22e00a79). Read the [world/role implementation](https://github.com/stbange/advent2026/blob/5c94d6d2ff478ae7489cebb05cdb3f7e22e00a79/docs/world-production.md), [current verification](https://github.com/stbange/advent2026/tree/5c94d6d2ff478ae7489cebb05cdb3f7e22e00a79/verification/world-production), [audio production](https://github.com/stbange/advent2026/blob/5c94d6d2ff478ae7489cebb05cdb3f7e22e00a79/docs/audio-production.md), and [M7 status](https://github.com/stbange/advent2026/blob/5c94d6d2ff478ae7489cebb05cdb3f7e22e00a79/docs/m7-production.md). [build-info.json](build-info.json) inventories every runtime file with its size and SHA-256 hash.

Previous all-24 Wasm entries passed loading, measured non-silent audio, save and WebGL checks, including touch emulation and local split screen. Normal-action campaigns, tank boarding/destruction/recovery, checkpoint restores, browser victory, co-op/reconnect and sixteen seats passed. The revised Day One Wasm entry, touch arsenal, WebGL, non-silent audio and save export pass. Independent C/Lua/JavaScript and world-authoring unit gates remain above 95%.

**M7 remains open.** Remaining work includes catalogued mechanics such as separately targetable mech components, full per-episode alternate-route/failure scenario acceptance, further recognizable art/gameplay polish, human pacing/balance and physical phone/controller/headset qualification. Simulated campaign duration does not establish human playtime or recognition of the original games.

Code: [MIT](LICENSE). Original art/fallback audio: [CC BY 4.0](ART-LICENSE.md). Generated audio portions: [LicenseRef-ElevenLabsMedia](licenses/ElevenLabsMedia.txt), for use in this combined game. **Created in collaboration with ElevenLabs.** Dependencies retain their [own notices](THIRD_PARTY_NOTICES.md). Classic games are research references; their assets are not included.
