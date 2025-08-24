# System Configuration

## Hardware Specifications

### Motherboard & CPU

- **Motherboard:** Gigabyte Z790 A PRO X WIFI7
- **CPU:** Intel Core i7-14700K
  - 20 cores, 28 threads (hyper-threading enabled)
  - Base frequency: 800MHz, Max boost: 5.6GHz
  - Architecture: x86_64
- **RAM:** 32GB
- **Storage:** Samsung NVMe SSD 980 (DRAM-less)

### Graphics & Display

- **GPU:** NVIDIA GeForce RTX 4070 Ti (AD104 architecture)
- **VRAM:** 12,282MB
- **Audio:** Intel HDA + NVIDIA HDA controllers

### Network & Connectivity

- **WiFi:** Intel Wi-Fi 7 (802.11be) AX1775*/AX1790*/BE20*/BE401/BE1750* 2x2
- **Ethernet:** Realtek RTL8126 5GbE Controller

## Operating System

### Core System

- **Distribution:** Arch Linux
- **Kernel:** Linux 6.16.3-arch1-1 (SMP PREEMPT_DYNAMIC)
- **Architecture:** x86_64
- **Init System:** systemd
- **Firmware:** UEFI (Version F5b, December 2024)

### Boot Configuration

- **Boot Type:** UEFI
- **Boot Partition:** 1GB (/dev/nvme0n1p5, 691MB used)
- **Root Partition:** 143GB (/dev/nvme0n1p6)
- **Swap:** 4GB zram-based virtual swap

## NVIDIA Configuration

### Driver Setup

- **Driver Package:** nvidia-dkms 580.76.05-4 (DKMS for kernel compatibility)
- **CUDA Support:** Version 13.0
- **Driver Type:** Proprietary NVIDIA drivers (NOT nouveau)

### Loaded Kernel Modules

```
nvidia              - Main NVIDIA driver
nvidia_drm          - DRM support for Wayland/X11
nvidia_uvm          - Unified Virtual Memory
nvidia_modeset      - Mode setting support
```

## Desktop Environment

### Window Manager & Compositor

- **Primary:** Hyprland 0.50.1-1 (Wayland compositor)
- **Display Protocol:** Wayland 1.24.0-1
- **X11 Compatibility:** Xwayland for legacy applications
- **Configuration:** ~/.config/hypr/

### Applications

#### Core Applications

- **Terminal:** alacritty 0.15.1-1
- **Shell:** bash
- **File Manager:** (determine from config)
- **Code Editor:** Visual Studio Code 1.103.2-1 (AUR)
- **Web Browser:** Zen Browser (AUR binary)
- **Communication:** Telegram Desktop 6.0.2-1

#### System Tools

- **Package Manager:** pacman
- **AUR Helper:** yay

### Key AUR Packages

- visual-studio-code-bin
- zen-browser-bin

