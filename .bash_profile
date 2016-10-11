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
alias qtpy='ipython qtconsole --style native --ConsoleWidget.font_family="Source Code Pro" --ConsoleWidget.font_size=14'
alias ipy='ipython'
alias ipyn='ipython notebook'
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

# marks and jumps:
# http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=$HOME/.marks
function jump {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
    rm -i "$MARKPATH/$1"
}
# Linux version
#function marks {
#    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
#}
# OS X version
function marks {
    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}

# for jump/mark autocompletion
_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -exec basename {} \;)
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}

complete -F _completemarks jump unmark

# a-la MATLAB history search
if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi

