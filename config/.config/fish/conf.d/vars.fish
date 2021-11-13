set -x FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git --exclude __snapshots__ --exclude macaw --exclude backstop_data --exclude '*.xml' --exclude '*.net' --exclude '*.java' --exclude '*.jsp'"
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_DEFAULT_OPTS "--ansi"
set -x EDITOR "nvim"
set -x VISUAL "nvim"
set -U TERM "xterm-256color"

set -x MANPAGER "vim -M +MANPAGER -"

set -x RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/.ripgreprc"
