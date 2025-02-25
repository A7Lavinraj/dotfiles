set-option -g status-style fg=white,bg=default
set-option -g message-style fg=white,bg=default
set-option -g status-left '#S '
set-option -g status-right " #(git -C #{pane_current_path} rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'no-git')#[fg=white] | %Y-%m-%d %H:%M "
set -g @cursor-style "beam"
