#!/bin/sh

#/usr/bin/nvidia-settings -a '[gpu:0]/GPUPowerMizerMode=1'

sudo pstate-frequency --set --min 35
sudo pstate-frequency --set --max 60

# Clocks Throttle Reasons
#        Idle                              : Not Active
#        Applications Clocks Setting       : Not Active
#        SW Power Cap                      : Active
#        HW Slowdown                       : Not Active
#            HW Thermal Slowdown           : Not Active
#            HW Power Brake Slowdown       : Not Active
#        Sync Boost                        : Not Active
#        SW Thermal Slowdown               : Active
#        Display Clock Setting             : Not Active
#

xrandr --output DP-1-3 --mode 1920x1080
#xrandr --output eDP-1 --mode 1920x1200
steam-native steam://rungameid/730

#steam-runtime steam://rungameid/730
