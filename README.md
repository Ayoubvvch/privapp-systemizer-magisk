# PrivApp Systemizer (Modern) for Android (Magisk / KernelSU / APatch)

[![Release](https://img.shields.io/github/v/release/Ayoubvvch/privapp-systemizer-magisk?style=flat-square&color=blue)](https://github.com/Ayoubvvch/privapp-systemizer-magisk/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%2010--15%2B-green.svg?style=flat-square)](https://github.com/Ayoubvvch/privapp-systemizer-magisk)
[![Architecture](https://img.shields.io/badge/Architecture-Universal%20%2F%20arm64-red.svg?style=flat-square)](https://github.com/Ayoubvvch/privapp-systemizer-magisk)

A modern, systemless application systemizer module for Android 10, 11, 12, 13, 14, and Android 15+. Easily move installed user applications, multi-split APK bundles, or standalone APKs into `/system/priv-app` or `/system/app` without modifying the physical system partition.

---

## ✨ Features

- **🧩 Split APKs & App Bundles**: Seamlessly copies and configures modern Android App Bundles (`base.apk` + all `split_*.apk`), preventing the crashes common with legacy systemizers.
- **🛡️ Anti-Bootloop Protection**: Enforces `ro.control_privapp_permissions=log` via `system.prop` to prevent device bootloops caused by missing privileged permission whitelists.
- **📚 Native Library Handling**: Detects and preserves native `.so` libraries (`lib/arm64`, `lib/arm`, etc.) for complete app functionality.
- **💻 Interactive & Scriptable CLI**:
  - Run `privappctl` or `systemize` in an interactive TUI to search and pick apps easily.
  - Full CLI flag support (`-s`, `-f`, `-l`, `-r`) for quick terminal commands or automated scripts.
- **🔄 Clean Revert & Removal**: Easily un-systemize any application and restore it to a normal user app without reinstalling or wiping the module.
- **🪄 100% Systemless**: Works seamlessly with **Magisk**, **KernelSU**, and **APatch** via magic mount / overlayfs.
- **⚡ In-App Updates**: Built-in `updateJson` manifest support for one-click updates directly inside the Magisk / KernelSU app.

---

## 📦 Installation

1. Download the latest **`privapp-systemizer-magisk.zip`** from [GitHub Releases](https://github.com/Ayoubvvch/privapp-systemizer-magisk/releases).
2. Open **Magisk**, **KernelSU**, or **APatch** on your phone.
3. Navigate to **Modules** ➔ **Install from storage** ➔ Select the downloaded zip.
4. Reboot your device to activate the `privappctl` command.

---

## 🚀 Usage

Open any root terminal (Termux, MT Manager terminal, or remote **SSH** session) and run `su`.

### 1. Interactive Menu (Recommended)
Simply type:
```bash
privappctl
# or
systemize
```

You will be presented with a menu:
```text
==========================================================
        PrivApp Systemizer (Modern) - v1.0.0
        Systemless App Systemizer for Android 10-15+
==========================================================

Please choose an action:
  [1] Systemize an installed user app (Search & Pick)
  [2] Systemize a standalone APK file (/sdcard/...)
  [3] List currently systemized apps
  [4] Remove / Revert a systemized app
  [5] Reboot device
  [0] Exit
```

### 2. Command-Line Options (One-liners)

| Command | Action |
| :--- | :--- |
| `privappctl` | Open interactive TUI menu |
| `privappctl -l` | List all currently systemized applications |
| `privappctl -s <package_name>` | Systemize installed package to `/system/priv-app` (default) |
| `privappctl -s <package_name> -a` | Systemize installed package to `/system/app` (standard) |
| `privappctl -f /path/to/app.apk` | Systemize a standalone APK file from storage |
| `privappctl -r <package_name>` | Remove a systemized app and revert upon reboot |
| `privappctl -h` | Display help and options |

#### Examples:
```bash
# Systemize MT Manager into /system/priv-app
privappctl -s bin.mt.plus

# Systemize a standalone APK downloaded to your phone
privappctl -f /sdcard/Download/MyTool.apk

# List all systemized apps
privappctl -l

# Revert an app
privappctl -r bin.mt.plus
```

---

## ⚙️ How It Works

1. **Source Inspection**: Resolves the exact package install directory using `pm path <package>`.
2. **Bundle Collection**: Copies the base APK and every split APK, alongside native libraries in `lib/`.
3. **Target Placement**: Places files into `/data/adb/modules/privapp_systemizer/system/priv-app/<package_name>/`.
4. **Permissions & Security**: Sets strict POSIX ownership (`0:0`), permissions (`0755` directories, `0644` files), and SELinux label (`u:object_r:system_file:s0`).
5. **Magic Mount**: On boot, Magisk merges the directory into the root filesystem.

---

## 🔨 Building from Source

```bash
git clone https://github.com/Ayoubvvch/privapp-systemizer-magisk.git
cd privapp-systemizer-magisk
zip -r9 privapp-systemizer-magisk.zip . -x ".git*" ".github*" "*.zip" "README.md" "LICENSE" "update.json" "changelog.md"
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
Developed by [Ayoubvvch](https://github.com/Ayoubvvch).
