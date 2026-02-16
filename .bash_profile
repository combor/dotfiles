export VISUAL=vim
export EDITOR=vim
export GIT_EDITOR=vim
export CHECKPOINT_DISABLE="true"
export PYTEST_ADDOPTS="--log-cli-level=INFO -s"
git config --global rebase.autosquash true
git config --global push.autoSetupRemote true

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
