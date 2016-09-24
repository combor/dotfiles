set -x 
export GITAWAREPROMPT=~/.bash/git-aware-prompt
# shellcheck source=/dev/null
source $GITAWAREPROMPT/main.sh
alias tmux="TERM=screen-256color-bce tmux"
export VISUAL=vim
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin
stty -ixon

for i in ~/.*-pass; do
    # shellcheck source=/dev/null
    [ -e "${i}"/.load.bash ] && . "${i}"/.load.bash
done

# shellcheck source=/dev/null
source ~/.git-completion.bash
export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

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
