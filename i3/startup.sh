#!/bin/bash

i3-msg 'exec google-chrome-stable; exec spotify-launcher; exec telegram-desktop; exec postman; exec alacritty -T tmux -e tmux' && sleep 2
i3-msg 'workspace 1; exec alacritty -e tmux new-session -A -s scratchpad;' && sleep 2 && \
   	i3-msg 'move scratchpad'
