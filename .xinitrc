#!/bin/sh

XORG_CONF="/etc/X11/xorg.conf.d/10-use-nvidia-only.conf"

test -f "${XORG_CONF}" && {
	xrandr --auto
}

bspwm
