# custom color palette
set-option -g status-style fg=white,bg=default
set-option -g message-style fg=white,bg=default
set-option -g status-left " #[fg=white]❯"
set-option -g popup-border-lines single

setw -g window-status-format " #[fg=white]#W "
setw -g window-status-current-format " #[fg=green]#W "
setw -g window-status-separator ""

set -g status-position bottom
set -g status-left-length 50
set -g status-right-length 100
set -g status-right " #(bash $HOME/workspace/dotfiles/tmux/scripts/git.sh)#[fg=white] ❮ %Y-%m-%d %H:%M "
