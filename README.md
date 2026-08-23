# pacman-apk

![Installer](screenshots/0.jpg?raw=true "Installer")

A desktop package installer and manager for Android apps on Windows, written in Dart language, and built with Flutter and Fluent UI.

Originally built upon and heavily refactored from **[WSA_Pacman](https://github.com/alesimula/wsa_pacman)**, `pacman-apk` now serves as a modernized, unified sideloading GUI for both **WSA** and **physical Android devices connected via USB (wired ADB)**. It expands sideloading capabilities to composite split APK formats (.xapk, .apks, .apkm), fixes persistent upstream bugs, and updates the core to the latest Flutter & Fluent UI standards. Just double-click Android app package files from Windows Explorer to inspect app metadata, review permissions, and install, update, or downgrade apps with one click.

## Features

- **Package Formats**: Supports standard single `.apk` files as well as composite/split bundles: `.xapk`, `.apks`, and `.apkm`.
- **Dual Target Sideloading**:
  - **Windows Subsystem for Android (WSA)**: Tracks subsystem status (booted, sleeping, running, arrested), provides quick boot/shutdown buttons, direct links to Android system/app settings, and creates Windows desktop shortcuts (`WsaClient.exe /launch wsa://...`).
  - **Wired Devices (USB ADB)**: Automatically detects connected physical devices and provides a device dropdown selector when multiple devices or WSA are concurrently active.
- **Package Details Preview**: Displays app icon, label, package name, version, and minimum Android OS version (e.g., Android 14 / API 34). In terms of icon parsing, standard icons, vector graphics, and adaptive vector graphics have been taken into account and supported to the greatest extent possible.
- **Permission Inspector**: Displays declared permissions mapped to clean Fluent UI categories (Storage, Camera, Location, Admin, Sensors, etc.).
- **Smart Installation Logic**:
  - Automatically queries the target device via `dumpsys package` to detect current installation status.
  - Action button dynamically switches between **Install**, **Update** (with `old => new` version diffing), **Reinstall**, and **Downgrade** (with `-r -d` flags).
  - Post-install actions: launch the application immediately or create a desktop shortcut (for WSA).
- **Native Windows 11 Fluent UI**: Customizable Mica window transparency, dark/light theme matching, and adaptive icon masking (squircle, circle, rounded square, or legacy).

## Settings

- **WSA Port / IP**: Configure connection endpoint (default: `127.0.0.1:58526`).
- **Autostart WSA**: Automatically spin up WSA before installing if it is currently shut down.
- **Timeout**: Adjustable installation timeout slider (in seconds) or disable timeout for large split packages.
- **Language**: Multi-language support with automatic system locale detection.
- **Theme Mode**: System / Dark / Light.
- **Window Transparency (Mica)**: Full / Partial / Disabled (Windows 11 only).
- **Adaptive Icon Shape**: Squircle / Circle / Rounded Square / Legacy.

## FAQ

<details>
<summary><strong>WSA is always showing the "Offline" or "Disconnected" status. How do I fix it?</strong></summary>

1. Open **Windows Subsystem for Android Settings**.
2. Go to the **Developer** tab and enable **Developer mode**.
3. Ensure **USB debugging** is turned on.
4. Verify that the port configured in PacMan-APK settings matches the port shown in WSA developer settings (default is `58526`).
5. If unauthorized, click the **Reauthenticate** button and accept the ADB debugging prompt inside WSA.
</details>

<details>
<summary><strong>How do I install packages to a physical Android device instead of WSA?</strong></summary>

Plug in your Android device via USB with **USB Debugging** enabled in Developer Options, and tap the **Allow** button when the authorization dialog box appears. PacMan-APK will automatically detect it under the **Wired** tab. When double-clicking an app package file (apk or split apks), select your target phone from the device dropdown list at the top of the installer window.
</details>

<details>
<summary><strong>Can I use this on Windows 10?</strong></summary>

Yes. Physical wired ADB installation works out of the box on Windows 10. While Microsoft only officially provided WSA on Windows 11, third-party modified WSA builds (such as MagiskOnWSALocal or WSA-Windows-10) run on Windows 10, and PacMan-APK can interface with them. Note that Mica window transparency requires Windows 11.
</details>

<details>
<summary><strong>How are multi-split packages (.xapk / .apks / .apkm) handled?</strong></summary>

PacMan-APK includes built-in Protobuf and manifest decoders running in a background isolate. It unpacks the split configs and streams the required slices directly to ADB via `install-multiple` without requiring external extraction tools or bundletool.
</details>

## Acknowledgements

`pacman-apk` is an independent, modernized continuation and hard fork of **[WSA-Pacman](https://github.com/alesimula/wsa_pacman)**.

- **Original Project & Concept**: Deep gratitude to [alesimula](https://github.com/alesimula) and the original contributors for building the foundational architecture and proof-of-concept for WSA package management.
- **Why this fork exists**: With the original repository inactive since 2023 and Microsoft deprecating official WSA support, this project was created to resolve long-standing stability bugs, introduce physical ADB device support, implement native split APK bundling, and ensure ongoing maintenance for the community.
- **Third-Party Libraries**: Built with [Flutter](https://flutter.dev/) and [fluent_ui](https://github.com/bdlukaa/fluent_ui).

## License

This project is licensed under the **GNU General Public License v3.0 (GPL-3.0)**.

- Copyright (C) 2021–2023 [alesimula](https://github.com/alesimula) and WSA_Pacman contributors
- Copyright (C) 2026 [nuloperrito](https://github.com/nuloperrito)

You may redistribute and/or modify this software under the terms of the GPL-3.0 license. See the [LICENSE](LICENSE) file for details.

<details><summary><ruby><p></ruby>

## More screenshots
  </p></summary>

  ![](screenshots/1.jpg?raw=true)
  ![](screenshots/2.jpg?raw=true)
  ![](screenshots/3.jpg?raw=true)
  ![](screenshots/4.jpg?raw=true)
  ![](screenshots/5.jpg?raw=true)
</details>
