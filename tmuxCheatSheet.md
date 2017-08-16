# tmux cheat sheet

( adapted from https://gist.github.com/andreyvit/2921703 )

(C-x means ctrl+x, M-x means alt+x)


## Prefix key

The default prefix is C-b. If you (or your muscle memory) prefer <prefix>, you
need to add this to `~/.tmux.conf`:

    # remap prefix to Control + a
    set -g prefix <prefix>
    # bind '<prefix> <prefix>' to type '<prefix>'
    bind <prefix> send-prefix
    unbind C-b


## Sessions, windows, panes

Session is a set of windows, plus a notion of which window is current.

Window is a single screen covered with panes. (Once might compare it to a
‘virtual desktop’ or a ‘space’.)

Pane is a rectangular part of a window that runs a specific command, e.g. a
shell.


## Getting help

Display a list of keyboard shortcuts:

    <prefix> ?

Navigate using Vim or Emacs shortcuts, depending on the value of `mode-keys`.
Emacs is the default, and if you want Vim shortcuts for help and copy modes
(e.g. j, k, C-u, C-d), add the following line to `~/.tmux.conf`:

    setw -g mode-keys vi

Any command mentioned in this list can be executed as `tmux something` or
`<prefix> :something` (or added to `~/.tmux.conf`).


## Managing sessions

Creating a session:

    tmux new-session -s work

Create a new session that shares all windows with an existing session, but has
its own separate notion of which window is current:

    tmux new-session -s work2 -t work

Attach to a session:

    tmux attach -t work

Detach from a session: `<prefix> d`.

Switch between sessions:

    <prefix> (          previous session
    <prefix> )          next session
    <prefix> L          ‘last’ (previously used) session
    <prefix> s          choose a session from a list

Other:

    <prefix> $          rename the current session
    <prefix>


## Managing windows

Create a window:

    <prefix> c          create a new window

Switch between windows:

    <prefix> 1 ...      switch to window 1, ..., 9, 0
    <prefix> 9
    <prefix> 0
    <prefix> p          previous window
    <prefix> n          next window
    <prefix> l          ‘last’ (previously used) window
    <prefix> w          choose window from a list

Switch between windows with a twist:

    <prefix> M-n        next window with a bell, activity or
                   content alert
    <prefix> M-p        previous such window


Other:

    <prefix> ,          rename the current window
    <prefix> &          kill the current window


## Managing split panes

Creating a new pane by splitting an existing one:

    <prefix> "          split vertically (top/bottom)
    <prefix> %          split horizontally (left/right)

Switching between panes:

    <prefix> left       go to the next pane on the left
    <prefix> right      (or one of these other directions)
    <prefix> up
    <prefix> down
    <prefix> o          go to the next pane (cycle through all of them)
    <prefix> ;          go to the ‘last’ (previously used) pane

Moving panes around:

    <prefix> {          move the current pane to the previous position
    <prefix> }          move the current pane to the next position
    <prefix> C-o        rotate window ‘up’ (i.e. move all panes)
    <prefix> M-o        rotate window ‘down’
    <prefix> !          move the current pane into a new separate
                   window (‘break pane’)
    <prefix> :move-pane -t :3.2
                   split window 3's pane 2 and move the current pane there

Resizing panes:

    <prefix> M-up, <prefix> M-down, <prefix> M-left, <prefix> M-right
                   resize by 5 rows/columns
    <prefix> C-up, <prefix> C-down, <prefix> C-left, <prefix> C-right
                   resize by 1 row/column

Applying predefined layouts:

    <prefix> M-1        switch to even-horizontal layout
    <prefix> M-2        switch to even-vertical layout
    <prefix> M-3        switch to main-horizontal layout
    <prefix> M-4        switch to main-vertical layout
    <prefix> M-5        switch to tiled layout
    <prefix> space      switch to the next layout


Other:

    <prefix> x          kill the current pane
    <prefix> q          display pane numbers for a short while


## Other config file settings

Force a reload of the config file on <prefix> r:

    unbind r
    bind r source-file ~/.tmux.conf

Some other settings that I use:

    setw -g xterm-keys on

