#echo "defining aliases"

# aliases
alias edp='vim  ~/.bash_profile'
alias rlp='source  ~/.bash_profile && tput setaf 4; echo "~/.bash_profile reloaded"'
alias evrc='vim $MYVIMRC'
alias ll='ls -lG'
alias lh='ls -lhG'
alias la='ls -laG'
alias lt='ls -laGt'
alias lah='ls -lahG'
alias clc='clear'
alias qtpy='ipython qtconsole --style native --ConsoleWidget.font_family="Source Code Pro" --ConsoleWidget.font_size=14'

#alias ipy2='ipython2'
#alias ipy2n='ipython2 notebook'
#alias ipy3='ipython3'
#alias ipy3n='ipython3 notebook'
#alias ipy=ipy2
#alias ipyn=ipy2n

# FIX for matplotlib running in virtualenvs
# see http://matplotlib.org/faq/virtualenv_faq.html
function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
    else
        /usr/local/bin/python "$@"
    fi
}

alias ipy='frameworkpython -m IPython'

# http://blog.yimingliu.com/2015/07/22/python-multiprocessing-code-crashes-on-os-x-under-ipython/)
alias ipynp='env no_proxy="*" ipython2'

alias grep='grep --color=auto'

# coreutils (brew installed coreutils prepends commands with a 'g')
alias shuf=gshuf

# utils
alias cmakerelease='cmake -DCMAKE_BUILD_TYPE=Release'
