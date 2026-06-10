# DMTool

[English](./README.md) | [Chinese](./README.zh.md)

DMTool is the DAMIAO motor debugging and configuration application. This repository publishes the packaged desktop binaries and the matching user manual for direct distribution.

## Contents

The repository root currently includes these runnable assets:

- `Windows/x86_64/DMTool 2.1.6.7.exe`
- `Linux/x86_64/DMTool-v2.1.6.7-x86_64.AppImage`
- `Linux/x86_64/arch_lib_install.sh`
- `MacOS/x86_64/DMTool-v2.1.6.7-x86_64.app`
- `MacOS/arm64/DMTool-v2.1.6.7-arm64.app`
- `DMTool-Host-Software-User-Manual.pdf`

## Windows

Use `Windows/x86_64/DMTool 2.1.6.7.exe`.

1. Open `Windows/x86_64/`.
2. Double-click `DMTool 2.1.6.7.exe`.
3. If Windows SmartScreen blocks the app on first launch, choose "More info" and continue.

Only the `x86_64` Windows package is provided in this repository. For driver, permission, or serial-port access issues, check `DMTool-Host-Software-User-Manual.pdf` first.

## Linux

Use `Linux/x86_64/DMTool-v2.1.6.7-x86_64.AppImage`.

```bash
cd Linux/x86_64
chmod +x DMTool-v2.1.6.7-x86_64.AppImage
./DMTool-v2.1.6.7-x86_64.AppImage
```

If you are on Arch Linux or a compatible distribution and runtime libraries are missing, run the helper script first:

```bash
cd Linux/x86_64
chmod +x arch_lib_install.sh
./arch_lib_install.sh
```

If the app cannot access the USB/CAN device, inspect the device with `lsusb` and configure `udev` rules for your distribution.

## macOS

- Intel Macs: `MacOS/x86_64/DMTool-v2.1.6.7-x86_64.app`
- Apple Silicon Macs: `MacOS/arm64/DMTool-v2.1.6.7-arm64.app`

Open the directory that matches your CPU architecture and double-click the `.app`. If Gatekeeper blocks the app, allow it from "System Settings -> Privacy & Security".

## Documentation

- User manual: [`DMTool-Host-Software-User-Manual.pdf`](./DMTool-Host-Software-User-Manual.pdf)
- Release history: [`CHANGELOG.en.md`](./CHANGELOG.en.md)
- Chinese README: [`README.zh.md`](./README.zh.md)

## Version

- DMTool version in this repository: `2.1.6.7`

## Copyright and Third-Party Licenses

DMTool is proprietary software owned by DAMIAO Technology Co., Ltd.

The packaged application uses third-party open-source libraries including Qt, Qwt, and libusb through dynamic linking. Users may obtain, modify, and redistribute the source code of those third-party components according to their respective licenses.
