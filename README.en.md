# DMTool

[中文](./README.md) | [EN](./README.en.md)

This document matches the files that currently exist in this directory and is intended for direct distribution of the packaged DMTool binaries.

## Contents

The repository root currently includes these runnable assets:

- `Windows/x86_64/DMTool-2.2.2.2-hotfix.exe`
- `Linux/x86_64/DMTool-v2.2.2.2-hotfix-x86_64.AppImage.tar.gz`
- `Linux/arm64/DMTool-v2.2.2.2-hotfix-arm64.tar.gz`
- `MacOS/x86_64/DMTool-v2.2.2.2-hotfix-x86_64.app.zip`
- `MacOS/arm64/DMTool-v2.2.2.2-hotfix-arm64.app.zip`
- `DMTool上位机软件说明书.pdf`

> Note: Linux and macOS artifacts are distributed as `tar.gz` / `zip` archives. The executable permissions are preserved inside the archives, so the programs can be run directly after extraction. See "Executable permissions" at the end of this document for details.

## Windows

Applicable file:

- `Windows/x86_64/DMTool-2.2.2.2-hotfix.exe`

How to use it:

1. Open `Windows/x86_64/`
2. Double-click `DMTool-2.2.2.2-hotfix.exe`
3. If Windows SmartScreen blocks the app on first launch, choose "More info" and continue

Notes:

- Only the `x86_64` Windows package is provided in this directory.
- For driver, permission, or serial-port access issues, check `DMTool上位机软件说明书.pdf` first.

## Linux

### x86_64

Applicable file:

- `Linux/x86_64/DMTool-v2.2.2.2-hotfix-x86_64.AppImage.tar.gz`

Run steps:

1. Open `Linux/x86_64/`
2. Extract the archive:

```bash
tar -xzf DMTool-v2.2.2.2-hotfix-x86_64.AppImage.tar.gz
```

This produces `DMTool-v2.2.2.2-hotfix-x86_64.AppImage` and `arch_lib_install.sh`, both with executable permissions preserved.

3. Run the app:

```bash
./DMTool-v2.2.2.2-hotfix-x86_64.AppImage
```

### arm64

Applicable file:

- `Linux/arm64/DMTool-v2.2.2.2-hotfix-arm64.tar.gz`

Run steps:

1. Open `Linux/arm64/`
2. Extract the archive:

```bash
tar -xzf DMTool-v2.2.2.2-hotfix-arm64.tar.gz
```

3. Enter the extracted directory and run the start script:

```bash
cd DMTool_arm64
./start.sh
```

`start.sh` and `bin/serial-port-assistant` both have executable permissions preserved.

### Extra dependencies for Arch Linux

If you are on Arch Linux or a compatible distribution and runtime libraries are missing, run (from the x86_64 package):

```bash
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

- Intel: `MacOS/x86_64/DMTool-v2.2.2.2-hotfix-x86_64.app.zip`
- Apple Silicon: `MacOS/arm64/DMTool-v2.2.2.2-hotfix-arm64.app.zip`

How to use it:

1. Open the directory that matches your CPU architecture
2. Extract the `.app.zip` (double-click, or use `ditto -x -k <file> .`)
3. Double-click the extracted `.app`
4. If Gatekeeper blocks the app, allow it from "System Settings -> Privacy & Security"

Notes:

- `x86_64` is for Intel Macs.
- `arm64` is for Apple Silicon Macs.
- The `.app` bundles already contain the runtime frameworks and resources, and the main executable retains its executable permission.

## Executable permissions

The executable permissions for the Linux and macOS artifacts are preserved in the packages:

- Linux artifacts are packaged as `tar.gz` and macOS artifacts as `zip`; the Unix execute bit is recorded inside the archives. After extraction, the AppImage, `arch_lib_install.sh`, `start.sh`, and the `.app` main executable can be run directly — no manual `chmod +x` is needed.
- Please extract on Linux / macOS using the system's native tools (`tar`, Finder, `ditto`).
- Note: the Windows filesystem, and archives repacked on Windows, do not preserve the Unix execute bit. If you extract on Windows and then copy to Linux / macOS, the execute permission may be lost; you can restore it manually:

```bash
chmod +x <file>
```

## Additional Documentation

- Full user guide: `DMTool上位机软件说明书.pdf`
- Release history: [`CHANGELOG.en.md`](./CHANGELOG.en.md)

## Version

- DMTool version in this directory: `2.2.2.2` (hotfix build)

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
