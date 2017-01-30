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

# os dependent marks function
case $OSTYPE in
  linux*)
    function marks {
      ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
    }
    ;;
  darwin*)
    function marks {
      \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
    }
    ;;
  *)
    echo "There's no marks function for this os ($OSTYPE)"
    echo "I will try to use the linux version, but things might not work as exected"
    function marks {
      ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
    }
    ;;
esac

# for jump/mark autocompletion
_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -exec basename {} \;)
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}

complete -F _completemarks jump unmark

