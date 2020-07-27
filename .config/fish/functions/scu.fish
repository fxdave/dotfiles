# Defined in - @ line 1
function scu --wraps='sudo systemctl --user' --wraps='systemctl --user' --description 'alias scu systemctl --user'
  systemctl --user $argv;
end
