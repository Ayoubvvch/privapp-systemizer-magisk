# Changelog

## v1.0.0
- **Initial Stable Release**: Modern systemless app systemizer module for Android 10, 11, 12, 13, 14, and 15+.
- **Split APKs & App Bundles**: Seamless support for multi-split APK architectures (`base.apk` + all `split_*.apk`).
- **Native Libraries Support**: Preserves native `.so` shared libraries in `lib/` (e.g. `arm64-v8a`) to prevent app crashes.
- **Bootloop Prevention**: Sets `ro.control_privapp_permissions=log` via `system.prop` to avoid Android priv-app whitelist bootloops.
- **Interactive & Non-Interactive CLI**: Provides `privappctl` and `systemize` commands for interactive search/selection, standalone APK installs, and CLI scripting.
- **In-App Auto-Updates**: Native `updateJson` support for instant updates inside Magisk, KernelSU, and APatch.
