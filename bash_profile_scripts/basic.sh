#echo "basic config"

# use vim as default editor
export EDITOR=vim
export MYVIMRC=~/.vim/vimrc
# alias vim='vim -c "set shell=bash\ -l"'

# for me
export PATH=$HOME/bin:$PATH

# for homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# enable color in the terminal bash shell export
CLICOLOR=1

# enable color for iTerm
export TERM=xterm-256color
# export TERM=xterm-color


# fix strange tmux terminal interaction
# (see https://tutorials.technology/tutorials/Iterm2--terminal-where-in-my-cursor-behaves-strangely.html)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# display colored gtest (google test suite) output
export GTEST_COLOR=1

# a-la MATLAB history search
if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi


