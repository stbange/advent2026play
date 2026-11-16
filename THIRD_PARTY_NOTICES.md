# Dependency notices

Generated game audio was created in collaboration with ElevenLabs through its MCP authoring service. It is distributed within mixed scene assets under [LicenseRef-ElevenLabsMedia](licenses/ElevenLabsMedia.txt), separately from MIT code and CC BY original artwork. Exact generation and conditioning records are under `art/source/audio/approved/`. ElevenLabs is not a runtime service or linked engine dependency.


Project code is MIT. Third-party dependencies keep their own licenses. Downloads
are versioned and SHA-256 pinned in `cmake/Dependencies.cmake`; dependency source
is kept in the build directory, outside the first-party coverage inventory.

| Dependency | Version | License / use |
| --- | --- | --- |
| Lua | 5.4.7 | MIT; external gameplay interpreter |
| SDL | 3.2.10 | zlib; platform, input, window and GL context |
| libwebsockets | 4.3.3 | MIT with upstream BSD/zlib/public-domain exceptions; native WebSocket transport |
| SQLite | 3.49.1 | Public domain; profiles, checkpoint and unique rewards |
| OpenSSL | 3.x system development package; Windows CI uses MSYS2 3.6.5-1 in a private prefix | Apache-2.0; TLS and secure reconnect-token generation |
| Emscripten SDK | tested with 4.0.10 | MIT/NCSA and bundled toolchain licenses; build tool, generated runtime |
| LuaCov | 0.16.0 | MIT; trusted test instrumentation only |
| cgltf | bbeb5b0b070ddacddac6852fb72143eb68454937 | MIT; static glTF parsing; [notice](licenses/cgltf.txt) |
| stb_image | 9f755b604db3492df2cbeb39bf84b81e3e3932e3 | MIT or public domain; PNG decoding; [notice](licenses/stb.txt) |
| cJSON | 1.7.19 | MIT; manifests, navigation and settings; [notice](licenses/cJSON.txt) |

Upstream notices for Lua, SDL and libwebsockets are reproduced under `licenses/`.
SQLite's public-domain dedication is in its downloaded source header and at
https://www.sqlite.org/copyright.html. OpenSSL licensing is at
https://www.openssl.org/source/license.html. Redistributed binary packages must
include applicable dependency notices and any required runtime DLLs; this first
milestone ships source and build instructions, not certified Windows installers.

Node tooling is development-only and pinned by `package-lock.json`; its packages
retain their upstream notices. Research screenshots in `references/visual/` are
separately credited, are not CC BY 4.0 game art and are never copied into builds.

Ponytail project guidance: DietrichGebert/ponytail at `96608e078b2d5ea607c5c3b8b5a54d1c1fba6846`, MIT, reproduced in `AGENTS.md`; [notice](licenses/Ponytail.txt). It is development guidance, not a runtime dependency.
