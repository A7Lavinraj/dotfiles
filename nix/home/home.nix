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
    pkgs.obs-studio
    pkgs.vlc
    pkgs.gh
    pkgs.luajitPackages.luacheck
    pkgs.deno
    pkgs.swappy
    pkgs.bun
    pkgs.hyprland
    pkgs.neovim
    pkgs.lazygit
    pkgs.kitty
    pkgs.prettierd
  ];

  programs.home-manager.enable = true;
  programs.vim = (import ./vim.nix { inherit pkgs; });
  programs.tmux = (import ./tmux.nix { inherit pkgs; });
  programs.kitty = (import ./kitty.nix { inherit pkgs; });

  wayland.windowManager = {
    hyprland = (import ./hyprland.nix { inherit pkgs; });
  };
  
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "/home/lavin/Pictures/wallpapers/maxresdefault.jpg"
      ];
      wallpaper = [
        ",/home/lavin/Pictures/wallpapers/maxresdefault.jpg" 
      ];
    };
  };
}
