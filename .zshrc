export PATH="$PATH:/usr/sbin"
export EDITOR=vim
#export DISPLAY=:0

PROMPT='%F{201}%~ $ %f%F{082}'
RPROMPT='%f%F{240}%T% %f'

# Open new terminal in current working directory using ctrl+shift+t
if [ -f /etc/profile.d/vte.sh ]; then
    source /etc/profile.d/vte.sh
fi

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' prompt '%e'
zstyle :compinstall filename '/home/bondi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
bindkey -e
# End of lines configured by zsh-newuser-install

alias ls='ls --color=auto'
