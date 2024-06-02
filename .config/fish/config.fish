set -gx PATH $PATH $HOME/.cargo/bin
set -gx PATH $PATH $HOME/.local/bin
set -gx DEBUGINFOD_URLS "https://debuginfod.archlinux.org"
set -gx theme_date_timezone Europe/Budapest

# Fucking ruby...
status --is-interactive; and rbenv init - fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/dbiro/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/home/dbiro/Downloads/google-cloud-sdk/path.fish.inc'; end
