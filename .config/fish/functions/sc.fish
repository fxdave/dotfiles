# Defined in - @ line 1
function sc --wraps='sudo systemctl' --description 'alias sc sudo systemctl'
  sudo systemctl $argv;
end
