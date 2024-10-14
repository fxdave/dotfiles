#!/bin/sh

XORG_CONF="/etc/X11/xorg.conf.d/10-use-nvidia-only.conf"

export MOZ_DISABLE_RDD_SANDBOX=1
export LIBVA_DRIVER_NAME=iHD

test -f "${XORG_CONF}" && {
	export LIBVA_DRIVER_NAME=nvidia
	echo "Setting xrandr"

	xrandr --setprovideroutputsource modesetting NVIDIA-0
	xrandr --auto
}

echo "Starting BSPWM"
bspwm
