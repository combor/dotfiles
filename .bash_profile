export VISUAL=vim
stty -ixon
PATH=$PATH:/opt/homebrew/bin
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

source /opt/homebrew/etc/bash_completion.d/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

eval "$(pyenv init - bash)"

GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
MAGENTA=$(tput setaf 5)
NORMAL=$(tput sgr0)

PS1="\[$GREEN\]\t-\[$YELLOW\]pk@\H\[$NORMAL\]\w\[$MAGENTA\]\$(__git_ps1)\[$NORMAL\]\$ "
