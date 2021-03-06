# ZPLUG
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'plugins/tmux', from:oh-my-zsh
zplug 'plugins/history', from:oh-my-zsh
zplug 'plugins/autojump', from:oh-my-zsh
zplug 'plugins/fzf', from:oh-my-zsh

zplug 'wfxr/forgit'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-history-substring-search'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'marlonrichert/zsh-autocomplete'
zplug "jackharrisonsherlock/common", as:theme
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

zstyle ':autocomplete:*' min-input 1
# zstyle ':autocomplete:*' default-context history-incremental-search-backward
zstyle ':autocomplete:*' min-delay 0.2
zstyle ':autocomplete:*' min-input 2
zstyle ':autocomplete:*' recent-dirs autojump
zstyle ':autocomplete:*' widget-style menu-complete
zstyle ':autocomplete:*' fzf-completion yes
zstyle ':autocomplete:*' list-lines 6

# Bind Keys
if zplug check zsh-users/zsh-history-substring-search; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
    bindkey -M vicmd 'k' history-substring-search-up
    bindkey -M vicmd 'j' history-substring-search-down
fi
bindkey -v '^?' backward-delete-char

# Enable edit command in $EDITOR
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line

# Exports
# export PATH="/usr/local/share/git-core/contrib/git-jump:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export VISUAL=vim
export EDITOR="${VISUAL}"
# export TERM="xterm-256color"

# Alias
alias v="vim"
alias nv="nvim"
alias emuand="$HOME/Library/Android/sdk/emulator/emulator"
alias simulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias lc="colorls"
alias ll="colorls -lA --sd"
alias lt="colorls --sd --gs -lA --tree=1"

alias gap='git add -p'
alias gcb='git checkout -b'
alias gcv='git commit -v'
alias gfa='git fetch --all'
alias gll='git pull'
alias gpf='git push --force-with-lease'
alias gps='git push'
alias grh='git reset --hard'
alias gst='git status'
alias gsw='git switch'

alias tmn="tmux new -s"
alias tml="tmux ls | fzf"
alias tmk="tmux kill-session -t"
alias tma="tmux attach-session -t"

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude __snapshots__ --exclude macaw'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_COMPLETION_TRIGGER='**'

# zcompdump location
# compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# autojump
# [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

alias luamake=/Users/p.borde/.config/lua-language-server/3rd/luamake/luamake
