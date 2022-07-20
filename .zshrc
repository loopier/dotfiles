source $HOME/.shrc

export WORDCHARS=${WORDCHARS//[-<>=_.,;\/]}
export HISTORY_IGNORE="(ls|l|ll|la|cd) *"

autoload -U colors && colors

# fabian
# export PROMPT="%{$fg_bold[red]%} > %{$reset_color%}"
# export RPROMPT="%{$fg_bold[yellow]%}%d%{$reset_color%} "

export PROMPT="%{$fg_bold[yellow]%}%~%{$fg_bold[red]%} > %{$reset_color%}"

# zle_highlight=(default:bold)

autoload -Uz compinit
compinit -d $HOME/.cache/zcompdump

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*:processes-names' command 'ps -e -o comm='

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'

zstyle ':completion:*' rehash true

zstyle ':completion:*' completer _oldlist _expand _complete
zstyle ':completion:*' menu select

bindkey -e
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey "^[[3~" delete-char
bindkey "^[[P" delete-char
bindkey "[3~" delete-word
bindkey "[C" forward-word
bindkey "[D" backward-word

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# source /usr/share/doc/pkgfile/command-not-found.zsh

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt autocd
setopt interactivecomments
setopt dotglob

unsetopt listambiguous
# unsetopt nomatch
setopt +o nomatch
