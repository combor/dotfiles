export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
alias tmux="TERM=screen-256color-bce tmux"
alias kubectl="kubectl -s http://172.18.24.159:8080"
export VISUAL=vim
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin
$(boot2docker shellinit 2>/dev/null)

# Load the custom .*-pass I have
for i in ~/.*-pass; do 
    [ -e $i/.load.bash ] && . $i/.load.bash
done
source ~/.git-completion.bash
export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
