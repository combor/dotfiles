export VISUAL=vim
export EDITOR=vim
export GIT_EDITOR=vim
export CHECKPOINT_DISABLE="true"
export PYTEST_ADDOPTS="--log-cli-level=INFO -s"
export GPG_TTY=$(tty)
export DISABLE_TELEMETRY=1
export CLAUDE_CODE_SUBAGENT_MODEL=sonnet

git config --global rebase.autosquash true
git config --global push.autoSetupRemote true

PATH="${HOME}/fvm/default/bin:${HOME}/.local/bin:/opt/homebrew/opt/openjdk@17/bin:${PATH}:/opt/homebrew/bin"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null && eval "$(pyenv init - bash)"

export ANDROID_HOME="/opt/homebrew/share/android-commandlinetools"
export ANDROID_SDK_ROOT="${ANDROID_HOME}"
export JAVA_HOME="$(/usr/libexec/java_home -v 17)"
export PATH="${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/emulator:${PATH}"

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

  test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
fi
