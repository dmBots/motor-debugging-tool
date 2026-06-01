# DMTool

[中文](./README.md) | [EN](./README.en.md)

This document matches the files that currently exist in this directory and is intended for direct distribution of the packaged DMTool binaries.

## Contents

The repository root currently includes these runnable assets:

- `Windows/x86_64/DMTool 2.1.6.7.exe`
- `Linux/x86_64/DMTool-v2.1.6.7-x86_64.AppImage`
- `Linux/x86_64/arch_lib_install.sh`
- `MacOS/x86_64/DMTool-v2.1.6.7-x86_64.app`
- `MacOS/arm64/DMTool-v2.1.6.7-arm64.app`
- `DMTool上位机软件说明书.pdf`

## Windows

Applicable file:

- `Windows/x86_64/DMTool 2.1.6.7.exe`

How to use it:

1. Open `Windows/x86_64/`
2. Double-click `DMTool 2.1.6.7.exe`
3. If Windows SmartScreen blocks the app on first launch, choose "More info" and continue

Notes:

- Only the `x86_64` Windows package is provided in this directory.
- For driver, permission, or serial-port access issues, check `DMTool上位机软件说明书.pdf` first.

## Linux

Applicable files:

- `Linux/x86_64/DMTool-v2.1.6.7-x86_64.AppImage`
- `Linux/x86_64/arch_lib_install.sh`

### Generic run steps

1. Open `Linux/x86_64/`
2. Make the AppImage executable:

```bash
chmod +x DMTool-v2.1.6.7-x86_64.AppImage
```

3. Run the app:

```bash
./DMTool-v2.1.6.7-x86_64.AppImage
```

### Extra dependencies for Arch Linux

If you are on Arch Linux or a compatible distribution and runtime libraries are missing, run:

```bash
chmod +x arch_lib_install.sh
./arch_lib_install.sh
```

Then launch the AppImage again.

### USB device permissions

If the app cannot access the USB/CAN device, first inspect the device:

```bash
lsusb
```

If needed, configure `udev` rules for the device. Common examples:

Debian / Ubuntu:

```bash
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="34b7", ATTR{idProduct}=="6877", MODE="0666", GROUP="plugdev"
SUBSYSTEM=="usb_device", ATTR{idVendor}=="34b7", ATTR{idProduct}=="6877", MODE="0666", GROUP="plugdev"' | sudo tee /etc/udev/rules.d/99-dm-fdcan.rules > /dev/null
sudo udevadm control --reload-rules
sudo udevadm trigger
sudo usermod -aG plugdev $USER
```

Arch Linux:

```bash
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="34b7", ATTR{idProduct}=="6877", MODE="0666", GROUP="uucp", TAG+="uaccess"
SUBSYSTEM=="usb_device", ATTR{idVendor}=="34b7", ATTR{idProduct}=="6877", MODE="0666", GROUP="uucp", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/99-dm-fdcan.rules > /dev/null
sudo udevadm control --reload-rules
sudo udevadm trigger
sudo usermod -aG uucp $USER
```

After that, log out and back in before launching DMTool.

## macOS

Applicable files:

- Intel: `MacOS/x86_64/DMTool-v2.1.6.7-x86_64.app`
- Apple Silicon: `MacOS/arm64/DMTool-v2.1.6.7-arm64.app`

How to use it:

1. Open the directory that matches your CPU architecture
2. Double-click the `.app`
3. If Gatekeeper blocks the app, allow it from "System Settings -> Privacy & Security"

Notes:

- `x86_64` is for Intel Macs.
- `arm64` is for Apple Silicon Macs.
- The `.app` bundles in this directory already contain the runtime frameworks and resources.

## Additional Documentation

- Full user guide: `DMTool上位机软件说明书.pdf`
- Release history: [`CHANGELOG.en.md`](./CHANGELOG.en.md)

## Version

- DMTool version in this directory: `2.1.6.7`

#### Copyright and Third-Party Agreements

1. **Software Copyright**
This software is proprietary software. Copyright belongs to DAMIAO Technology Co., Ltd.

2. **Third-Party Component Statement**
The core program is proprietary software. During development, several open-source libraries were used, including:

Qt: licensed under GNU Lesser General Public License version 2.1 (LGPLv2.1) or version 3 (LGPLv3). Modules include `QtCore`, `QtGui`, `QtSerialPort`, `QtCore5Compat`, `QtSql`, and `QtOpenGL`.
Copyright (C) 2025 The Qt Company Ltd. All rights reserved.

Qwt: licensed under GNU Lesser General Public License version 2.1 (LGPLv2.1).

libusb: licensed under GNU Lesser General Public License version 2.1 (LGPLv2.1).

Users may obtain, modify, and redistribute the source code of those third-party components according to their respective open-source licenses. The binaries in this directory use those libraries through dynamic linking to satisfy the corresponding license requirements.
