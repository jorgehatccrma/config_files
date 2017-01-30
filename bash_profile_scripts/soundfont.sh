# play a midi file using fluidsynth + General User foundfont
# http://apple.stackexchange.com/a/111995/152759
function playmidi {

    #SOUNDFONT='/usr/local/share/fluidsynth/generaluser.v.1.44.sf2'
    SOUNDFONT="$HOME/ccrma/soundfonts/generaluser.v1.47.sf2"

    if [ -e "$SOUNDFONT" ]
    then

        for i in "$@"
        do
            if [ -e "$i" ]
            then
                (fluidsynth -i "$SOUNDFONT" "$i"  2>&1) >/dev/null
            else
                echo "[playmidi]: cannot find file at $i"
                return 1
            fi
        done
    else
            echo "[playmidi]: SOUNDFONT file not found at $SOUNDFONT"
            return 1
    fi
}

