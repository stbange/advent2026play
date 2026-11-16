# Advent 2026 — play

**[Play Advent 2026 on GitHub Pages](https://stbange.github.io/advent2026play/)**

All 24 calendar worlds have playable first versions. This M7 production candidate adds distinct episode phases and choices, physical smoke/flash and environmental effects, Story/Classic/Veteran selection, checkpoint recovery and editable thirteen-cue audio banks. Full production acceptance remains open.

Enable **Preview all available doors** before December. Otherwise doors open daily at 00:00 UTC from 1–24 December 2026. Choose a world and difficulty, then enter the hall. Saved expeditions retain their difficulty. Use WASD/mouse, click to fire, E to use, Space to jump, Q alternate, C command, Tab next and R/F vertical; mobile devices show touch controls. The world renders within 384 × 240 pixels while the interface stays readable at display resolution.

Local/offline play and two local views need no server. Online rooms require a separately hosted authoritative server and a matching content version; enter its WSS address in the lobby. GitHub Pages hosts this static client.

Source: [stbange/advent2026 at 101bb85](https://github.com/stbange/advent2026/tree/101bb851c90c28a04b341547bcdfbe979ad110c7). Read the [M7 implementation and limitations](https://github.com/stbange/advent2026/blob/101bb851c90c28a04b341547bcdfbe979ad110c7/docs/m7-production.md), [verification evidence](https://github.com/stbange/advent2026/tree/101bb851c90c28a04b341547bcdfbe979ad110c7/verification/m7-production) and [audio production record](https://github.com/stbange/advent2026/blob/101bb851c90c28a04b341547bcdfbe979ad110c7/docs/audio-production.md). [build-info.json](build-info.json) records every deployed runtime file's size and SHA-256.

Local verification passed 85 isolated unit cases with the 95% C/Lua/JavaScript gates, 42 gameplay cases plus six raised-route reruns, 72 native render poses, all 24 Wasm entries and native/browser/network recovery suites. This does not qualify human first-completion pacing, original-game recognition, complete per-episode scenario/balance acceptance, physical phones/controllers or headsets. Windows CI and actual Windows graphics are separate from the local Linux/browser evidence.

ElevenLabs MCP generated 472 takes for 122 original sound/music cues. The public build uses original fallback audio while the generated candidates await audition and compatible redistribution rights. No ElevenLabs account or runtime service is required to play.

Code: [MIT](LICENSE). Original shipped artwork/fallback audio: [CC BY 4.0](ART-LICENSE.md), attributed to Advent2026 contributors in each pack. Dependencies retain their [own notices](THIRD_PARTY_NOTICES.md). No original commercial-game assets or generated provider-audio drafts are included.
