# PrivApp Systemizer (Modern) for Android (Magisk / KernelSU / APatch)

[![Release](https://img.shields.io/github/v/release/Ayoubvvch/privapp-systemizer-magisk?style=flat-square&color=blue)](https://github.com/Ayoubvvch/privapp-systemizer-magisk/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%2010--15%2B-green.svg?style=flat-square)](https://github.com/Ayoubvvch/privapp-systemizer-magisk)
[![Architecture](https://img.shields.io/badge/Architecture-Universal%20%2F%20arm64-red.svg?style=flat-square)](https://github.com/Ayoubvvch/privapp-systemizer-magisk)

A modern, systemless application systemizer module for Android 10, 11, 12, 13, 14, and Android 15+. Features a sleek **KsuWebUI interactive graphical interface** as well as a powerful command-line utility. Easily move installed user applications, multi-split APK bundles, or standalone APKs into `/system/priv-app` or `/system/app` without modifying the physical system partition.

---

## ✨ Features

- **🎨 Modern WebUI (KsuWebUI / KernelSU / APatch)**: Built-in `webroot` interface featuring dark glassmorphism, instant app search, one-tap systemization, and visual management.
- **🧩 Split APKs & App Bundles**: Seamlessly copies and configures modern Android App Bundles (`base.apk` + all `split_*.apk`), preventing the crashes common with legacy systemizers.
- **🛡️ Anti-Bootloop Protection**: Enforces `ro.control_privapp_permissions=log` via `system.prop` to prevent device bootloops caused by missing privileged permission whitelists.
- **📚 Native Library Handling**: Detects and preserves native `.so` libraries (`lib/arm64`, `lib/arm`, etc.) for complete app functionality.
- **💻 Interactive & Scriptable CLI**:
  - Run `privappctl` or `systemize` in an interactive terminal menu.
  - Full CLI flag support (`-s`, `-f`, `-l`, `-r`, `--json-user-apps`, `--json-systemized`) for quick terminal commands or automated scripts.
- **🔄 Clean Revert & Removal**: Easily un-systemize any application and restore it to a normal user app without reinstalling or wiping the module.
- **🪄 100% Systemless**: Works seamlessly with **Magisk**, **KernelSU**, and **APatch** via magic mount / overlayfs.
- **⚡ In-App Updates**: Built-in `updateJson` manifest support for one-click updates directly inside the Magisk / KernelSU app.

---

## 📦 Installation

1. Download the latest **`privapp-systemizer-magisk.zip`** from [GitHub Releases](https://github.com/Ayoubvvch/privapp-systemizer-magisk/releases).
2. Open **Magisk**, **KernelSU**, or **APatch** on your phone.
3. Navigate to **Modules** ➔ **Install from storage** ➔ Select the downloaded zip.
4. Reboot your device.

---

## 🚀 How to Use

### 1. Interactive Graphical WebUI (Recommended)
If you have **KsuWebUI** (or KernelSU / APatch) installed:
1. Open the **KsuWebUI** app on your phone.
2. Select **PrivApp Systemizer**.
3. Browse and search your installed user apps, select target (`priv-app` or `app`), and click **Systemize**!
4. You can also view systemized apps and revert them with one tap from the **Systemized** tab.

### 2. Command-Line Interface (`privappctl` / `systemize`)
Open any root terminal (Termux, MT Manager, or remote **SSH** session) and run `su`.

| Command | Action |
| :--- | :--- |
| `privappctl` | Open interactive TUI terminal menu |
| `privappctl -l` | List all currently systemized applications |
| `privappctl -s <package_name>` | Systemize installed package to `/system/priv-app` (default) |
| `privappctl -s <package_name> -a` | Systemize installed package to `/system/app` (standard) |
| `privappctl -f /path/to/app.apk` | Systemize a standalone APK file from storage |
| `privappctl -r <package_name>` | Remove a systemized app and revert upon reboot |
| `privappctl -h` | Display help and options |

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
