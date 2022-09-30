#!/bin/sh

zenity --list --column Display $(xrandr | grep " connected" | cut -d' ' -f1)
