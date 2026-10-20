# Changelog

## v1.1.0
- **KsuWebUI & KernelSU Web Interface**: Added interactive WebUI (`webroot/index.html`) fully compatible with KsuWebUI (`io.github.a13e300.ksuwebui`), KernelSU, and APatch.
- **Search & Filter**: Added instant real-time search across installed 3rd-party user applications in the WebUI.
- **One-Tap Systemizing**: Seamlessly convert apps to `/system/priv-app` or `/system/app` directly from the WebUI.
- **Systemized Apps Management**: View, inspect split APK counts, and revert systemized applications with a single tap.
- **Custom APK Installer**: Easily install standalone APKs from local storage via GUI.
- **JSON Engine**: Added `--json-user-apps` and `--json-systemized` CLI commands to `privappctl` for automated integration.
- **Offline & Responsive**: 100% offline self-contained Dark/Glassmorphism mobile interface with Material You aesthetics.

## v1.0.0
- **Initial Stable Release**: Modern systemless app systemizer module for Android 10, 11, 12, 13, 14, and 15+.
- **Split APKs & App Bundles**: Seamless support for multi-split APK architectures (`base.apk` + all `split_*.apk`).
- **Native Libraries Support**: Preserves native `.so` shared libraries in `lib/` (e.g. `arm64-v8a`) to prevent app crashes.
- **Bootloop Prevention**: Sets `ro.control_privapp_permissions=log` via `system.prop` to avoid Android priv-app whitelist bootloops.
- **Interactive & Non-Interactive CLI**: Provides `privappctl` and `systemize` commands for interactive search/selection, standalone APK installs, and CLI scripting.
- **In-App Auto-Updates**: Native `updateJson` support for instant updates inside Magisk, KernelSU, and APatch.
