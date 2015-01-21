# place me at ~/

# for homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# aliases
alias ll='ls -lG'
alias lh='ls -lhG'
alias la='ls -laG'
alias lt='ls -laGt'
alias lah='ls -lahG'
alias clc='clear'
alias qtpy='ipython qtconsole --pylab=inline --style native --ConsoleWidget.font_family="Source Code Pro" --ConsoleWidget.font_size=14'
alias ipy='ipython --pylab'
alias ipy='ipython notebook --pylab=inline'
alias kp="/Users/jorgeh/kpcli-2.5.pl -kdb='/Users/jorgeh/Tresors/kdb/keepassDB.kdbx'"

# create alises for workstations
for i in `seq 1 60`;
do
    # echo 'Creating alias for cmn'$i
    alias cmn$i='ssh cmn'$i'.domain.com'
done


# enable color in the terminal bash shell export
CLICOLOR=1

# setup the prompt the way I like it (with color)
# (non-printing characters should be surrounded by '\[' '\]'
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/nonprintingchars.html)
export PS1='[\u@\[$(tput setaf 3)\]\h\[$(tput sgr0)\] \[$(tput bold)\]\W\[$(tput sgr0)\]]\$ '

# enable color for iTerm
export TERM=xterm-color

export EDITOR='subl -w'
