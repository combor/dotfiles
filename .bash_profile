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
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"

export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

PS1="\[$GREEN\]\t-\[$YELLOW\]pk@mac\[$LIGHT_GRAY\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$LIGHT_GRAY\]\$ "

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
  git diff --no-ext-diff -w "$@" | vim -u ~/.vimrc.go -R –
}
