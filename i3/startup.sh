#!/bin/bash

i3-msg 'workspace 1; exec google-chrome-stable' && sleep 1 && \
	i3-msg 'workspace 2; exec spotify-launcher' && sleep 1 && \
	i3-msg 'workspace 3; exec code' && sleep 1 && \
	i3-msg 'workspace 4; exec postman' && sleep 1

i3-msg 'workspace 1; exec alacritty -e tmux new-session -A -s scratchpad;' && sleep 1 && \
   	i3-msg 'move scratchpad'
