set -g mode-style "fg=#c0caf5,bg=#3b4261"  

set -g status-style "fg=#565f89,bg=default"  
set -g message-style "fg=#7aa2f7,bg=default"  
set -g message-command-style "fg=#7dcfff,bg=default"  

setw -g window-status-format " #[fg=#565f89]#I "  
setw -g window-status-current-format " #[fg=#bb9af7]#I "  
setw -g window-status-separator ""  
setw -g window-status-activity-style "fg=#ff9e64,bg=default"  

set -g pane-border-style "fg=#3b4261"  
set -g pane-active-border-style "fg=#7aa2f7"  

set -g popup-style "fg=#c0caf5,bg=#1a1b26"  
set -g popup-border-style "fg=#7aa2f7"  
set -g popup-border-lines single

setw -g clock-mode-colour "#7dcfff"  

set -g status-position bottom
set -g status-left-length 100
set -g status-right-length 100
set -g status-left ""  
set -g status-right "#[fg=#565f89]%H:%M #[fg=#7aa2f7]| #[fg=#565f89]%d-%b-%y"
