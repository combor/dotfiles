alias tmux="TERM=screen-256color-bce tmux"
export VISUAL=vim
$(boot2docker shellinit 2>/dev/null)

# Load the custom .*-pass I have
for i in ~/.*-pass; do 
    [ -e $i/.load.bash ] && . $i/.load.bash
done
