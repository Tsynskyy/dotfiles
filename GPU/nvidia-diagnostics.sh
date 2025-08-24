#!/bin/bash
# NVIDIA Troubleshooting and Diagnostic Script

echo "🔍 NVIDIA GPU Diagnostic Report"
echo "==============================="
echo ""

# Check if NVIDIA driver is loaded
echo "📋 Driver Status:"
if command -v nvidia-smi &> /dev/null; then
    echo "✅ nvidia-smi available"
    nvidia-smi --query-gpu=name,driver_version,memory.total,memory.used,temperature.gpu,power.draw --format=csv
else
    echo "❌ nvidia-smi not found - drivers may not be installed"
fi
echo ""

# Check kernel modules
echo "🔧 Kernel Modules:"
echo "Loaded NVIDIA modules:"
lsmod | grep nvidia || echo "❌ No NVIDIA modules loaded"
echo ""

# Check modprobe configuration
echo "⚙️ Module Configuration:"
if [ -f /etc/modprobe.d/nvidia.conf ]; then
    echo "✅ /etc/modprobe.d/nvidia.conf exists:"
    cat /etc/modprobe.d/nvidia.conf
else
    echo "❌ /etc/modprobe.d/nvidia.conf missing"
fi
echo ""

# Check DRM mode setting
echo "🖥️ DRM Mode Setting:"
if [ -f /sys/module/nvidia_drm/parameters/modeset ]; then
    modeset_status=$(sudo cat /sys/module/nvidia_drm/parameters/modeset)
    if [ "$modeset_status" = "Y" ]; then
        echo "✅ DRM mode setting enabled: $modeset_status"
    else
        echo "⚠️ DRM mode setting: $modeset_status (should be Y for Wayland)"
    fi
else
    echo "❌ Cannot check DRM mode setting"
fi
echo ""

# Check Wayland environment
echo "🌊 Wayland Environment:"
echo "WAYLAND_DISPLAY: ${WAYLAND_DISPLAY:-Not set}"
echo "XDG_SESSION_TYPE: ${XDG_SESSION_TYPE:-Not set}"
echo "LIBVA_DRIVER_NAME: ${LIBVA_DRIVER_NAME:-Not set}"
echo "__GLX_VENDOR_LIBRARY_NAME: ${__GLX_VENDOR_LIBRARY_NAME:-Not set}"
echo ""

# Check package status
echo "📦 Package Status:"
pacman -Q nvidia-dkms nvidia-utils 2>/dev/null || echo "Some NVIDIA packages missing"
echo ""

# Check system logs for NVIDIA errors
echo "📝 Recent NVIDIA Errors:"
nvidia_errors=$(journalctl -k --since "1 hour ago" | grep -i nvidia | tail -5)
if [ -z "$nvidia_errors" ]; then
    echo "✅ No recent NVIDIA errors found"
else
    echo "$nvidia_errors"
fi
echo ""

echo "🔍 Diagnostic complete!"