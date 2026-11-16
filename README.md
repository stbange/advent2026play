# Advent 2026 — play

**[Play Advent 2026 on GitHub Pages](https://stbange.github.io/advent2026play/)**

All 24 early episodes now include owner-approved ElevenLabs music, ambience and sound effects. Click or tap the game view to enable audio; volume controls are in Settings. No ElevenLabs account or runtime service is required.

Enable **Preview all available doors** before December. Otherwise doors open daily at 00:00 UTC from 1–24 December 2026. Choose a world and difficulty, then enter the hall. Use WASD/mouse, click to fire, E to use, Space to jump, Q alternate, C command, Tab next and R/F vertical; phones show touch controls. The world renders within 384 × 240 pixels while the interface stays readable at display resolution.

Offline play and two local views need no server. Online rooms require a separately hosted authoritative server and matching content; enter its WSS address in the lobby. GitHub Pages hosts this static client.

Source: [stbange/advent2026 at edca0a7](https://github.com/stbange/advent2026/tree/edca0a7da32e5da5be854e489f176f048dad2f5a). See the [audio integration evidence](https://github.com/stbange/advent2026/tree/edca0a7da32e5da5be854e489f176f048dad2f5a/verification/audio-integration), [production record](https://github.com/stbange/advent2026/blob/edca0a7da32e5da5be854e489f176f048dad2f5a/docs/audio-production.md), and [M7 status](https://github.com/stbange/advent2026/blob/edca0a7da32e5da5be854e489f176f048dad2f5a/docs/m7-production.md). [build-info.json](build-info.json) inventories all runtime files with sizes and SHA-256 hashes.

All 24 actual Wasm entries passed audio-signal, loading, save and WebGL checks, including touch and local split screen. Native/browser co-op victory, reconnect and download/save recovery passed. The isolated C/Lua/JavaScript coverage gates remain at 95%. Human listening, physical devices and first-completion pacing remain unqualified.

**M7 remains open.** The owner's review found that the settings and roles need substantial work to resemble their inspirations. Recognizable landscapes, architecture, characters, carpet flight, tank boarding and giant cockpit scale are being reworked. The current art is an early version. The previous automated campaign pacing results do not establish human playtime or original-game recognition.

Code: [MIT](LICENSE). Original art/fallback audio: [CC BY 4.0](ART-LICENSE.md). Generated audio portions: [LicenseRef-ElevenLabsMedia](licenses/ElevenLabsMedia.txt), for use in this combined game; no standalone generated WAV distribution. **Created in collaboration with ElevenLabs.** Dependencies retain their [own notices](THIRD_PARTY_NOTICES.md). Classic games are research references; their assets are not included.
