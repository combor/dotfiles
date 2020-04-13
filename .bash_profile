export VISUAL=vim
export GOPATH=~/dev
export PATH=/usr/local/opt/gnu-getopt/bin:$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin:/usr/local/sbin
stty -ixon

export GPG_TTY=$(tty)

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

PS1="\[$GREEN\]\t-\[$YELLOW\]pk@\H\[$NORMAL\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$NORMAL\]\$ "

eval "$(thefuck --alias)"

eval "$(fasd --init auto)"

function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R –
}

#rbenv
eval "$(rbenv init -)"

#pyenv
eval "$(pyenv init -)"

export GO111MODULE=on
export HOMEBREW_AUTO_UPDATE_SECS="86400"
