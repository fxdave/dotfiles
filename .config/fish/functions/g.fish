# Defined in - @ line 1
function g --wraps='git status' --description 'alias g git status'
  git status $argv;
end
