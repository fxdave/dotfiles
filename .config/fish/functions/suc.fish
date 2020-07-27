# Defined in - @ line 1
function suc --wraps='systemd --user' --wraps='systemctl --user' --description 'alias suc systemctl --user'
  systemctl --user $argv;
end
