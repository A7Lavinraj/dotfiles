# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Exports
export DOCKER_HOST=unix:///var/run/docker.sock
export EDITOR=nvim
export TMUX_PLUGIN_MANAGER_PATH="$HOME/workspace/dotfiles/tmux/plugins/tpm"
export PATH="$HOME/.local/bin:$HOME/workspace/personal-scripts:$HOME/workspace/scripts:$PATH"
export GTK_THEME=Tokyonight-Dark
export BAT_THEME="tokyonight_night"

local color00='#1a1b26'
local color01='#16161e'
local color02='#2f3549'
local color03='#444b6a'
local color04='#787c99'
local color05='#a9b1d6'
local color06='#cbccd1'
local color07='#d5d6db'
local color08='#f7768e'
local color09='#ff9e64'
local color0A='#e0af68'
local color0B='#9ece6a'
local color0C='#73daca'
local color0D='#7aa2f7'
local color0E='#bb9af7'
local color0F='#ff7a93'

export FZF_DEFAULT_OPTS="
  --color=bg+:#16161e,bg:#1a1b26,spinner:#7dcfff,hl:#7aa2f7
  --color=fg:#c0caf5,header:#7aa2f7,info:#ff9e64,pointer:#7dcfff
  --color=marker:#7dcfff,fg+:#c0caf5,prompt:#ff9e64,hl+:#7aa2f7
  --color=gutter:#1a1b26,border:#3b4261
  --layout=reverse
  --height=100%
  --border=rounded
  --margin=1
  --padding=1
  --info=inline-right
  --preview='bat --color=always --style=numbers --line-range=:500 {}'
  --prompt='  '
  --pointer='➤'
  --marker='✓ '
  --preview-window='right:55%:border-rounded'
  --preview-label='  Preview'
  --preview-label-pos=2
  --bind='ctrl-d:preview-half-page-down'
  --bind='ctrl-u:preview-half-page-up'
  --bind='?:toggle-preview'
  --bind='ctrl-a:select-all'
  --bind='ctrl-y:execute-silent(echo {+} | clip.exe)'
"

# Directory navigation with better preview
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf --preview='eza -T --level=2 --color=always {}') &&
  cd "$dir"
}

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
# zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='eza --icons'
alias tree='eza --tree --icons'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/lavinraj/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/lavinraj/.opam/opam-init/init.zsh' ]] || source '/home/lavinraj/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
