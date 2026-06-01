# DMTool

[中文](./README.md) | [EN](./README.en.md)

本文档按当前目录内实际提供的文件编写，适用于直接分发的 DMTool 安装包与运行包。

## 目录内容

当前仓库根目录包含以下可执行资源：

- `Windows/x86_64/DMTool 2.1.6.7.exe`
- `Linux/x86_64/DMTool-v2.1.6.7-x86_64.AppImage`
- `Linux/x86_64/arch_lib_install.sh`
- `MacOS/x86_64/DMTool-v2.1.6.7-x86_64.app`
- `MacOS/arm64/DMTool-v2.1.6.7-arm64.app`
- `DMTool上位机软件说明书.pdf`

## Windows

适用文件：

- `Windows/x86_64/DMTool 2.1.6.7.exe`

使用方法：

1. 进入 `Windows/x86_64/`
2. 双击运行 `DMTool 2.1.6.7.exe`
3. 首次运行如被系统拦截，选择“更多信息”后继续运行

说明：

- 当前目录只提供 `x86_64` Windows 安装包。
- 如设备驱动、权限或串口访问存在问题，优先参考 `DMTool上位机软件说明书.pdf`。

## Linux

适用文件：

- `Linux/x86_64/DMTool-v2.1.6.7-x86_64.AppImage`
- `Linux/x86_64/arch_lib_install.sh`

### 通用运行步骤

1. 进入 `Linux/x86_64/`
2. 为 AppImage 增加可执行权限：

```bash
chmod +x DMTool-v2.1.6.7-x86_64.AppImage
```

3. 运行程序：

```bash
./DMTool-v2.1.6.7-x86_64.AppImage
```

### Arch Linux 额外依赖

若在 Arch Linux 或兼容发行版上缺少运行库，先执行：

```bash
chmod +x arch_lib_install.sh
./arch_lib_install.sh
```

然后重新运行 AppImage。

### USB 设备权限

若程序无法访问 USB/CAN 设备，先确认设备信息：

```bash
lsusb
```

如需放开当前设备访问权限，可按发行版配置 `udev` 规则。常见示例：

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

执行完成后建议重新登录一次系统，再启动 DMTool。

## macOS

适用文件：

- Intel: `MacOS/x86_64/DMTool-v2.1.6.7-x86_64.app`
- Apple Silicon: `MacOS/arm64/DMTool-v2.1.6.7-arm64.app`

使用方法：

1. 根据芯片架构进入对应目录
2. 双击 `.app` 启动
3. 若被 Gatekeeper 拦截，到“系统设置 -> 隐私与安全性”中允许本次打开

说明：

- `x86_64` 目录适用于 Intel Mac。
- `arm64` 目录适用于 Apple Silicon Mac。
- 当前目录内 `.app` 已包含运行所需框架与资源文件。

## 配套文档

- 详细使用说明：`DMTool上位机软件说明书.pdf`
- 更新记录：[`CHANGELOG.md`](./CHANGELOG.md)

## 版本

- 当前目录中的 DMTool 版本：`2.1.6.7`

#### 版权与第三方协议

1. **软件版权**
本软件为闭源软件，版权归达妙科技有限公司所有。

2. **第三方组件声明**
本软件核心程序为专有软件。开发过程中使用了遵循开源协议的开源库，具体包括：

Qt 库：遵循 GNU Lesser General Public License version 2.1 (LGPLv2.1) 或 version 3 (LGPLv3) 协议。使用模块包括 `QtCore`、`QtGui`、`QtSerialPort`、`QtCore5Compat`、`QtSql`、`QtOpenGL`。
Copyright (C) 2025 The Qt Company Ltd. All rights reserved.

Qwt 库：遵循 GNU Lesser General Public License version 2.1 (LGPLv2.1) 协议。

libusb 库：遵循 GNU Lesser General Public License version 2.1 (LGPLv2.1) 协议。

用户可按上述开源协议要求获取、修改和重新分发对应第三方组件源码。当前目录中的程序通过动态链接方式使用这些库，以满足相关许可证要求。
