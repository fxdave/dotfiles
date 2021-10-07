#!/usr/bin/fish

function vpnup --wraps='nmcli con up Stylers --ask && xsetroot -solid "#f00"' --wraps='nmcli con down Stylers --ask && xsetroot -solid "#000"' --description 'alias vpnup nmcli con up Stylers --ask && xsetroot -solid "#f00"'
  nmcli con up Stylers --ask && xsetroot -solid "#f00" $argv;
end

function vpndown --wraps='nmcli con down Stylers --ask && xsetroot -solid "#000"' --description 'alias vpndown nmcli con down Stylers --ask && xsetroot -solid "#000"'
  nmcli con down Stylers --ask && xsetroot -solid "#000" $argv;
end


test $argv[1] = "up" && vpnup
test $argv[1] = "down" && vpndown
