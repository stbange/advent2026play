# Advent 2026 — Play in your browser

**[Play Advent 2026 on GitHub Pages](https://stbange.github.io/advent2026play/)**

Explore a festive winter hall and enter original retro-inspired first-person worlds. This build includes the hall and **Portal 13: Red Furnace**, with three weapons, two key routes and a two-phase furnace boss. The other 23 episodes are still in development. An optional engine workshop is available for preview testing.

## Start playing

1. Open **https://stbange.github.io/advent2026play/** in a browser with WebGL 2 support.
2. Leave **Play mode** set to **Local / offline**.
3. Before **13 December 2026 at 01:00 in Warsaw (00:00 UTC)**, enable **Preview all available doors** to try Red Furnace. Preview progress is separate from the December calendar.
4. Choose **Enter the hall**, then walk to **Portal 13** and use it.

The first visit downloads the game and external assets. After a successful load, supported browsers can retain the selected world for offline play. Local saves and settings use browser storage; **Controls & settings** includes save export/import.

## Controls

- **Desktop:** WASD to move, mouse to look, left click to fire, E to use, Space to jump, Tab to switch weapons and Backspace to return to the hall. Escape releases the mouse.
- **Touch:** the game switches to touch controls automatically; drag to move/look and use the on-screen action buttons.
- **Local split screen:** select **Two local players** before entering; player two uses a gamepad.
- **VR:** compatible WebXR browsers expose the VR button in **Controls & settings**. Physical headset comfort/performance qualification is still in progress.

GitHub Pages hosts the web client and its assets. **Online co-op requires a separately hosted compatible secure WebSocket (`wss://`) game server**; this repository does not host that server. Local play needs no server installation.

## Build and source

This repository contains the ready-to-play Emscripten/WebGL 2 build and external Lua/glTF/PNG/WAV content. The source project is [stbange/advent2026](https://github.com/stbange/advent2026), revision [`015070e`](https://github.com/stbange/advent2026/commit/015070e22d99aa1da5793b53f34dd66bb273f972). See [build-info.json](build-info.json) for exact build and content hashes.

GitHub Pages publishes the root of the `main` branch. `.nojekyll` preserves the static runtime files. To update, build the source revision with Emscripten 4.0.10, install its CMake **Runtime** component, and publish the complete runtime together so manifests and asset bytes stay in sync. Preserve this README, `.nojekyll` and the license files.

## Licenses and credits

Code is [MIT licensed](LICENSE). Original Advent2026 art and audio by Advent2026 contributors are **[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)**; see [the art license](ART-LICENSE.md), [asset credits](assets/ATTRIBUTION.md), and the per-file creators/licenses in each content manifest. Dependency notices and license texts are included in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) and [licenses/](licenses/).
