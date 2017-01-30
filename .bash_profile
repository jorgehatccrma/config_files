# place me at ~/

SCRIPTS_FOLDER="$HOME/bash_profile_scripts"

. "$SCRIPTS_FOLDER/basic.sh"
. "$SCRIPTS_FOLDER/aliases.sh"
. "$SCRIPTS_FOLDER/utils.sh"
. "$SCRIPTS_FOLDER/prompt.sh"
. "$SCRIPTS_FOLDER/cuda_env.sh"
. "$SCRIPTS_FOLDER/go_env.sh"
. "$SCRIPTS_FOLDER/mark_system.sh"
. "$SCRIPTS_FOLDER/soundfont.sh"


# force brewed python
export PYTHON_LIBRARY="/usr/local/Cellar/python/2.7.12_1/Frameworks/Python.framework/Versions/2.7/lib/libpython2.7.dylib"

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# git autocompletion
source $HOME/git-completion.bash
source $HOME/.git-prompt.sh

# virtualenvwrapper
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh
