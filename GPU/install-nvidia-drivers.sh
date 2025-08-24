#!/bin/bash
# NVIDIA Driver Installation Script

set -e  # Exit on any error

echo "🚀 Installing NVIDIA drivers for RTX 4070 Ti..."

# Update system first
echo "📦 Updating system packages..."
sudo pacman -Syu --noconfirm

# Install base-devel if not present (needed for AUR)
echo "🔧 Installing development tools..."
sudo pacman -S --needed --noconfirm base-devel git

# Install NVIDIA drivers and utilities
echo "🎮 Installing NVIDIA drivers..."
sudo pacman -S --noconfirm \
    nvidia-dkms \
    nvidia-utils \
    nvidia-settings \
    linux-headers

# Install optional packages for enhanced functionality
echo "🔧 Installing optional NVIDIA packages..."
sudo pacman -S --noconfirm \
    opencl-nvidia

# Copy modprobe configuration
echo "⚙️ Configuring kernel modules..."
sudo cp nvidia-modprobe.conf /etc/modprobe.d/nvidia.conf

# Regenerate initramfs
echo "🔄 Regenerating initramfs..."
sudo mkinitcpio -P

echo "✅ NVIDIA driver installation complete!"
echo ""
echo "Next steps:"
echo "1. Reboot system"
echo "2. Install and configure Hyprland"
echo "3. Copy hyprland-gpu-config.conf contents to ~/.config/hypr/hyprland.conf"
echo "4. Test with: nvidia-smi"
echo ""
echo "⚠️ IMPORTANT: Reboot is required for drivers to take effect!"