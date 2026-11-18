# Advent 2026 — play

**[Play Advent 2026 on GitHub Pages](https://stbange.github.io/advent2026play/)**

**Day Two — Emberwake.** Fly a patterned carpet through Lantern Keep’s amber-lit arches, past the striped mana balloon and over a violet desert. Follow the crystals into Glasswell Caverns, then face the masked Ash Regent on a split sail. Break the violet tether to protect your collector. Enable **Preview all available doors** before December, select **02 — Emberwake** and use Door 2 in the hall. On touch, **CLAIM** marks mana and **SPELLS** opens the palette. [Paintings beside the playable scenes](https://github.com/stbange/advent2026/tree/d24223fff4fd1466334bf9378733c15e4e59a975/verification/emberwake-concept-art) · [Episode design and controls](https://github.com/stbange/advent2026/blob/d24223fff4fd1466334bf9378733c15e4e59a975/openspec/changes/emberwake-rework/design.md).

**Replay Day One.** Midnight Matinee generates 36 combinations of open passages through the street, alley, auditorium and backstage. Weapons and alien encounter positions vary. The cinema landmarks, rooftop objectives and Producer finale return in every run. Finish, return to the hall and enter the first portal again for a different layout. The party shares its generated route across saves and reconnects. Older active Day One checkpoints may restart through save recovery. Earned ornaments stay on the profile. [Route comparison and verification](https://github.com/stbange/advent2026/tree/d24223fff4fd1466334bf9378733c15e4e59a975/verification/matinee-procedural-routes).

**Day One is Midnight Matinee — No Refunds:** a connected cinema district with eight guns, four variants per alien type, moving scenery, four environmental problems, seven secrets, forty subtitle jokes and the three-phase Producer finale. It retains approved ElevenLabs music/effects and adds five documented weapon-sound derivatives. The other 23 early episodes remain available.

Read the [Day One design](https://github.com/stbange/advent2026/blob/d24223fff4fd1466334bf9378733c15e4e59a975/docs/midnight-matinee.md) and [verification](https://github.com/stbange/advent2026/tree/d24223fff4fd1466334bf9378733c15e4e59a975/verification/midnight-matinee). Its **20-minute first-play duration is a design target awaiting human playtests**. Fresh solo Classic and four-player Veteran automated completion and checkpoint/reward checks pass.

Enable **Preview all available doors** before December. Otherwise doors open daily at 00:00 UTC from 1–24 December 2026. Choose a world and difficulty, then enter the hall. Click or tap the game view to enable sound; volume controls are in Settings. No ElevenLabs account or runtime service is required.

Day One: 1–8 select weapons; Tab cycles; C kicks or detonates owned charges; Q toggles the acquired jetpack; R/F fly vertically. Touch players can use the GUNS selector.

Use WASD/mouse, click to fire, E to use, Space to jump, Q alternate, C command, Tab next and R/F vertical. Near Crystal Front's tank, C boards and Q dismounts. Phones show touch controls. The world renders within 384 × 240 pixels while the interface stays readable at display resolution.

Offline play and two local views need no server. Online rooms require a separately hosted authoritative server and matching content; enter its WSS address in the lobby. GitHub Pages hosts this static client.

Source: [stbange/advent2026 at d24223f](https://github.com/stbange/advent2026/tree/d24223fff4fd1466334bf9378733c15e4e59a975). Read the [world/role implementation](https://github.com/stbange/advent2026/blob/d24223fff4fd1466334bf9378733c15e4e59a975/docs/world-production.md), [current verification](https://github.com/stbange/advent2026/tree/d24223fff4fd1466334bf9378733c15e4e59a975/verification/world-production), [audio production](https://github.com/stbange/advent2026/blob/d24223fff4fd1466334bf9378733c15e4e59a975/docs/audio-production.md), and [M7 status](https://github.com/stbange/advent2026/blob/d24223fff4fd1466334bf9378733c15e4e59a975/docs/m7-production.md). [build-info.json](build-info.json) inventories every runtime file with its size and SHA-256 hash.

Previous all-24 Wasm entries passed loading, measured non-silent audio, save and WebGL checks, including touch emulation and local split screen. Normal-action campaigns, tank boarding/destruction/recovery, checkpoint restores, browser victory, co-op/reconnect and sixteen seats passed. The revised Day One Wasm entry, touch arsenal, WebGL, non-silent audio and save export pass. Independent C/Lua/JavaScript and world-authoring unit gates remain above 95%.

**M7 remains open.** Remaining work includes catalogued mechanics such as separately targetable mech components, full per-episode alternate-route/failure scenario acceptance, further recognizable art/gameplay polish, human pacing/balance and physical phone/controller/headset qualification. Simulated campaign duration does not establish human playtime or recognition of the original games.

Code: [MIT](LICENSE). Original art/fallback audio: [CC BY 4.0](ART-LICENSE.md). Generated audio portions: [LicenseRef-ElevenLabsMedia](licenses/ElevenLabsMedia.txt), for use in this combined game. **Created in collaboration with ElevenLabs.** Dependencies retain their [own notices](THIRD_PARTY_NOTICES.md). Classic games are research references; their assets are not included.
