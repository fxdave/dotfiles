# Defined in - @ line 1
function gc --wraps='git commit -m' --description 'alias gc git commit -m'
    if test (count $argv) -eq 1
        if test (echo $argv[1] | string sub --length 2) = "--"
            git commit $argv
        else
            git commit -m $argv
        end
    else
        git commit $argv
    end
end
