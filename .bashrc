#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#        eval "$("$BASE16_SHELL/profile_helper.sh")"
alias ls='ls --color=auto'
alias grep="grep --color=auto"


export PS1="\[\033[38;5;7m\][\[$(tput sgr0)\]\[\033[38;5;45m\]\u\[$(tput sgr0)\]\[\033[38;5;129m\]@\[$(tput sgr0)\]\[\033[38;5;15m\]\[\033[48;5;66m\]\h\[$(tput sgr0)\]\[$(tput sgr0)\] \[\033[38;5;11m\]\W\[$(tput sgr0)\]\[\033[38;5;7m\]]\[\033[38;5;7m\]\\$ \[$(tput sgr0)\]"

# Environment Variables
EDITOR=nvim
VISUAL=nvim
GRIM_DEFAULT_DIR='/home/rthyberg/Pictures/screenshots'
# PATHs
export GOPATH=$HOME/go
PATH=$PATH:'/home/rthyberg/bin':$(go env GOPATH)/bin
PATH=$PATH:'/home/rthyberg/.symfony/bin'

# Custom aliases
alias rhel1="ssh -i .ssh/id_RHEL 192.168.1.15"
alias ereader="foliate"
alias browser="MOZ_ENABLE_WAYLAND=1 firefox"

# Have termite ctrl-shift-t open new term in current dir
source /etc/profile.d/vte.sh
# Set bash to VI mode
set -o vi
# Startup scripts for interactive shell
python3 ~/workspace/webscraper/cat/cat.py
