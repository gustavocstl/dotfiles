#!/bin/bash

i3-msg 'workspace 1; exec alacritty -e tmux new-session -A -s scratchpad;' && sleep 2 && \
    i3-msg 'move scratchpad'

i3-msg 'exec copyq; exec teamviewer'
