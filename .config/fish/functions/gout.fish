# Defined in - @ line 1
function gout --wraps='git checkout' --description 'alias gout git checkout'
  git checkout $argv;
end
