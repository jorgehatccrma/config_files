#echo "setting up prompt"

# setup the prompt the way I like it (with color)
# (non-printing characters should be surrounded by '\[' '\]'
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/nonprintingchars.html)
# export PS1='[\u@\[$(tput setaf 3)\]\h\[$(tput sgr0)\] \[$(tput bold)\]\W\[$(tput sgr0)\]]\$ '
# export PS1='\[$(tput setaf 2)\][\h \W]\$\[$(tput sgr0)\] '
# export PS1='\[$(tput setaf 2)\]\h \W\[$(tput sgr0)\] '
export PS1='\[$(tput setaf 2)\]\W\[$(tput sgr0)\] '

# Show git state in prompt
GIT_PS1_SHOWDIRTYSTATE=true
# export PS1='\[\e]0;\u@\h: \w\a\]\[\e[32;1m\]\u@\h:\W \[\e[33;1m\]$(__git_ps1 "[%s] ")\[\e[32;1m\]\$ \[\e[0m\]'
# export PS1='\[\e]0; \w\a\]\[\e[32;1m\]\W \[\e[33;1m\]$(__git_ps1 "[%s] ")\[\e[32;1m\]\$ \[\e[0m\]'
export PS1='🌎 \[\e]0; \w\a\]\[\e[32;1m\]\W \[\e[33;1m\]$(__git_ps1 "[%s] ")\[\e[32;1m\]\$ \[\e[0m\]'
#export PS1='🐅🐆🐍🐕🐒🐉🐛🐌🌈🌊🌋🗻  \[\e]0; \w\a\]\[\e[32;1m\]\W \[\e[33;1m\]$(__git_ps1 "[%s] ")\[\e[32;1m\]\$ \[\e[0m\]'
