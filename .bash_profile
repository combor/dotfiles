alias tmux="TERM=screen-256color-bce tmux"
export VISUAL=vim
export GOPATH=/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin
stty -ixon

for i in ~/.*-pass; do
    [ -e "${i}"/.load.bash ] && . "${i}"/.load.bash
done

for i in /usr/local/etc/bash_completion.d/*; do 
    . "${i}"
done

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

GPG_AGENT=$(which gpg-agent)

if [ -f "${GPG_AGENT}" ]; then
    GPG_TTY=$(tty)
    export GPG_TTY
    envfile="${HOME}/.gnupg/gpg-agent.env"

    if test -f "${envfile}" && kill -0 "$(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2)" 2>/dev/null; then
        eval "$(cat "$envfile")"
    else
        eval "$(gpg-agent --daemon --log-file=~/.gpg/gpg.log --write-env-file "$envfile")"
    fi
    export GPG_AGENT_INFO  # the env file does not contain the export statement
fi

eval "$(thefuck --alias)"

eval "$(fasd --init auto)"

function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R –
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#Enable virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
