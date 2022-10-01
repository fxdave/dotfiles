#!/bin/sh

XORG_CONF="/etc/X11/xorg.conf.d/10-use-nvidia-only.conf"

test -f "${XORG_CONF}" && {
	mv "${XORG_CONF}" "${XORG_CONF}.bak"
	echo "PRIME"
	exit 0
}


test -f "${XORG_CONF}.bak" && {
	mv "${XORG_CONF}.bak" "${XORG_CONF}"
	echo "NVIDIA only"
	exit 0
}
