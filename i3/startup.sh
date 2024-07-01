#!/bin/bash

i3-msg 'workspace 1; exec alacritty -e tmux new-session -A -s scratchpad;' && sleep 2 && \
    i3-msg 'move scratchpad' && sleep 1 && \
    i3-msg 'exec firefox; exec spotify-launcher; exec telegram-desktop; exec postman; exec alacritty -T tmux -e tmux'

i3-msg 'exec copyq; exec teamviewer'
