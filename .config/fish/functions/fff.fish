
function fff_prepare_file
    for line in (cat $argv)
        echo (set_color red) $argv": " (set_color normal) $line
    end
end

function fff_prepare_files
  for file in $argv
    fff_prepare_file $file
  end
end

function fff
  set files (find . -not -path "*/node_modules/*" | xargs file | rg text | rg -v long | cut -d':' -f1)
  fff_prepare_files $files | fzf --ansi
end
