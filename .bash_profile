export VISUAL=vim
PATH=$PATH:/opt/homebrew/bin
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init - bash)"

if [[ $- == *i* ]]; then
  [[ -t 0 ]] && stty -ixon
  [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true

  GREEN=$(tput setaf 2)
  YELLOW=$(tput setaf 3)
  MAGENTA=$(tput setaf 5)
  NORMAL=$(tput sgr0)

  PS1="\[$GREEN\]\t-\[$YELLOW\]pk@\H\[$NORMAL\]\w\[$MAGENTA\]\$(__git_ps1)\[$NORMAL\]\$ "
fi
