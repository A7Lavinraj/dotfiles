#!/bin/bash

CONFIG_FILE="$HOME/workspace/dotfiles/waybar/config.jsonc"
STYLES_FILE="$HOME/workspace/dotfiles/waybar/style.css"

killall waybar
waybar -c $CONFIG_FILE -s $STYLES_FILE &
