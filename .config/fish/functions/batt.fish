# Defined in - @ line 1
function batt --wraps='echo (cat /sys/class/power_supply/BAT0/capacity)%' --description 'alias batt echo (cat /sys/class/power_supply/BAT0/capacity)%'
  echo (cat /sys/class/power_supply/BAT0/capacity)% $argv;
end
