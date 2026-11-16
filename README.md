# Advent 2026 — playable web build

**[Play Advent 2026](https://stbange.github.io/advent2026play/)**

First playable versions of **all 24 numbered episodes** are available. Enable **Preview all available doors** before December 2026. Event mode unlocks one new day at 00:00 UTC from December 1–24.

Days **13–24** are longer first versions with six or eight connected sectors, distinct reference-inspired systems and final bosses. Every new campaign passed ordinary-input solo and two-player completion tests with at least 30 active minutes, with selected four-player runs too. These are automated pacing diagnostics; human timing, balance and recognition still need playtesting. Days 1–12 retain their compact scopes. The explicitly labelled compact Red Furnace prototype and the engineering workshop are additional preview options.

Choose a world, enter the hall, then walk to a numbered door and press **E**. Other available doors download their worlds on demand. The renderer uses a bounded 384 × 240 world framebuffer, local point lights and shadows, with original polygon, sprite and voxel detail. Production level/art/audio polish and physical-device qualification remain in progress.

WASD moves; mouse looks; click fires; E uses; Space jumps/grabs/jets; Q is alternate; C commands; Tab switches tools or tactical soldiers; R/F moves vertically; Backspace returns to the hall. Touch devices show matching controls. The settings panel supports remapping, save export/import and desktop split screen. Online co-op needs the exact matching world on a separate friend server; this static site also runs offline after caching.

[Source and full instructions](https://github.com/stbange/advent2026) · [Days 13–24 systems and controls](https://github.com/stbange/advent2026/blob/main/docs/remaining-episodes.md) · [Campaign verification](https://github.com/stbange/advent2026/tree/main/verification/remaining-episodes) · [Days 1–12 guide](https://github.com/stbange/advent2026/blob/main/docs/first-twelve.md)

Code: **MIT**. Original art and audio: **CC BY 4.0**, Advent2026 contributors. External packs retain their manifests and attribution; classic game assets are not included. Third-party notices and licenses are distributed beside the runtime. `build-info.json` pins the source commit and SHA-256 of every runtime file.
