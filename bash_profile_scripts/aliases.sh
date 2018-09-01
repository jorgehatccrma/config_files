#echo "defining aliases"

# aliases
alias vim=nvim
alias edp='vim  ~/.bash_profile'
alias rlp='source  ~/.bash_profile && tput setaf 4; echo "~/.bash_profile reloaded"'
alias evrc='vim $MYVIMRC'
alias ls='ls -FGAp'
alias ll='ls -l'
alias lh='ls -lh'
alias la='ls -la'
alias lt='ls -lat'
alias lah='ls -lah'
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

# create alises for workstations
for i in `seq 1 60`;
do
    # echo 'Creating alias for cmn'$i
    alias cmn$i='ssh -Y username@machineprefix'$i'.domain.com'
done

alias ipy='frameworkpython -m IPython'

# http://blog.yimingliu.com/2015/07/22/python-multiprocessing-code-crashes-on-os-x-under-ipython/)
alias ipynp='env no_proxy="*" ipython2'

alias grep='grep --color=auto'

# coreutils (brew installed coreutils prepends commands with a 'g')
alias shuf=gshuf

# relace `cat` with `bat` (need to `brew install bat` first)
alias cat='bat --theme TwoDark'

# replace `ctrl-r` (reverse history search) with fzf (need `brew install fzf`)
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

# improved `du`
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

# better man
alias help='tldr'

# utils
alias cmakerelease='cmake -DCMAKE_BUILD_TYPE=Release'
