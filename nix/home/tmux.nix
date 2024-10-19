{ ... }:

{
  enable = true;
  extraConfig = ''
    set -g mouse on
    set -g pane-base-index 1
    set -g base-index 1
    set-option -sg escape-time 10
    set-option -g default-terminal "screen-256color"
    set-option -a terminal-features "kitty:RGB"
    set-option -a terminal-overrides "kitty:Tc"
    set-option -g focus-events on
    set-option -g renumber-windows on
    set-window-option -g pane-base-index 1
    set-window-option -g mode-keys vi


    set-option -g status-right ""
    set-option -g status-left "#[fg=#7aa2f7]  "
    set-option -g status-style bg=default,fg="#414868"
    set-option -g message-style fg=default,bg=default
    set-option -g pane-border-style "fg=#414868"
    set-option -g pane-active-border-style "fg=#414868"
    set-window-option -g window-status-format "#[fg=#c0caf5,bg=default] #W"
    set-window-option -g window-status-current-style fg="#ff9e64",bg=default
    set-window-option -g window-status-current-format "#[fg=#7aa2f7,bg=default] #W"

    unbind C-b
    set -g prefix C-space
    bind C-space send-prefix
    bind r source-file ~/coding/dotfiles/.tmux.conf
    bind '|' split-window -h -c "#{pane_current_path}"
    bind '-' split-window -v -c "#{pane_current_path}"
    bind -r m resize-pane -Z
    bind-key -T copy-mode-vi v send-keys -X begin-selection
    bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
    bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

    set -g @plugin "tmux-plugins/tpm"
    set -g @plugin "tmux-plugins/tmux-sensible"
    set -g @plugin "tmux-plugins/tmux-yank"
    set -g @plugin "christoomey/vim-tmux-navigator"

    run "~/.tmux/plugins/tpm/tpm"
  '';
}
