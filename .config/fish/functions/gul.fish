# Defined in - @ line 1
function gul --wraps='git pull' --description 'alias gul git pull'
  git pull $argv;
end
