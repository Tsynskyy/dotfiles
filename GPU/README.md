# NVIDIA GPU Configuration

## Environment Variables

### Current GPU Environment (from Hyprland config)

```bash
LIBVA_DRIVER_NAME=nvidia          # VA-API driver for hardware video decoding
__GLX_VENDOR_LIBRARY_NAME=nvidia  # Force NVIDIA GLX implementation
ELECTRON_OZONE_PLATFORM_HINT=auto # Electron apps Wayland compatibility
```

### Additional Variables

```bash
# For some Wayland applications
VDPAU_DRIVER=nvidia
GBM_BACKEND=nvidia
```

## Package Installation Commands

### 1. Core NVIDIA Packages

```bash
# Install DKMS driver
sudo pacman -S nvidia-dkms nvidia-utils nvidia-settings linux-headers
```

### 2. Optional NVIDIA Packages

```bash
# OpenCL compute support
sudo pacman -S opencl-nvidia
```

## Post-Installation Configuration

### 1. Enable DRM Mode Setting

```bash
# Copy modprobe config
sudo cp nvidia-modprobe.conf /etc/modprobe.d/nvidia.conf

# Verify contents:
cat /etc/modprobe.d/nvidia.conf
# Should contain: options nvidia_drm modeset=1
```

### 2. Regenerate Initramfs

```bash
sudo mkinitcpio -P
```

### 3. Configure Hyprland Environment

```bash
# Add to ~/.config/hypr/hyprland.conf:
# Copy contents from hyprland-gpu-config.conf
```

## Verification Steps

### 1. Check Driver Status

```bash
nvidia-smi
# Should show RTX 4070 Ti with driver xxx.xx.xx
```

### 2. Verify Kernel Modules

```bash
lsmod | grep nvidia
# Should show: nvidia_drm, nvidia_uvm, nvidia_modeset, nvidia
```

### 3. Check DRM Mode Setting (Wayland Compatibility Check)

```bash
sudo cat /sys/module/nvidia_drm/parameters/modeset
# Should return: Y
```

### Complete Driver Reset

```bash
# Remove all NVIDIA packages
sudo pacman -Rns nvidia-dkms nvidia-utils nvidia-settings

# Clean module configuration
sudo rm /etc/modprobe.d/nvidia.conf

# Reinstall fresh
sudo pacman -S nvidia-dkms nvidia-utils nvidia-settings
```

