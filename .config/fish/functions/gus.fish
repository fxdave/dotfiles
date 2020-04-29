# Defined in - @ line 1
function gus --wraps='git push' --description 'alias gus git push'
  git push $argv;
end
