{ config, pkgs, ... }:

{
  home.username = "lavin";
  home.homeDirectory = "/home/lavin";

  home.stateVersion = "23.11";

  home.packages = [
    pkgs.gcc
    pkgs.nodejs
    pkgs.pnpm
    pkgs.clang-tools
    pkgs.nerdfonts
    pkgs.gnumake
    pkgs.python3
    pkgs.luarocks
    pkgs.tree-sitter
    pkgs.waybar
    pkgs.hyprpaper
    pkgs.rofi
    pkgs.pamixer
    pkgs.brightnessctl
    pkgs.killall
    pkgs.eza
    pkgs.lua
    pkgs.unzip
    pkgs.stylua
    pkgs.gtk3
    pkgs.lua-language-server
    pkgs.tmux
    pkgs.git
    pkgs.fzf
    pkgs.jq
    pkgs.ripgrep
    pkgs.zoxide
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
  programs.neovim.enable = true;
  programs.lazygit.enable = true;
}
