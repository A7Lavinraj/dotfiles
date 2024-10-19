{ pkgs, ... }:

{
  enable = true;
  settings = {
    "$mainMod" = "SUPER";
    bind = [
      ",XF86AudioRaiseVolume, exec,pamixer --increase 5"
      ",XF86AudioLowerVolume, exec,pamixer --decrease 5"
      ",XF86AudioMute, exec,pamixer --toggle-mute"
      ",XF86MonBrightnessUp, exec,brightnessctl set +10%"
      ",XF86MonBrightnessDown, exec,brightnessctl set 10%-"
      "$mainMod, C, killactive"
      "$mainMod, R, exec, rofi -show drun"
    ];
  };
  extraConfig = ''
    exec = gsettings set org.gnome.desktop.interface gtk-theme "YOUR_DARK_GTK3_THEME"
    exec = gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
    monitor=eDP-1,preferred,auto,1
    exec-once = waybar & hyprpaper
    env = XCURSOR_SIZE,24
    env = HYPRCURSOR_SIZE,24
    env = QT_QPA_PLATFORMTHEME,qt6ct
    general { 
      gaps_in = 4
      gaps_out = 8
      border_size = 1
      col.active_border = rgba(292e42ee) rgba(292e42ee) 45deg
      col.inactive_border = rgba(595959aa)
      resize_on_border = false 
      allow_tearing = false
      layout = dwindle
    }
    decoration {
      rounding = 4
        active_opacity = 1.0
        inactive_opacity = 1.0
        drop_shadow = true
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)
        blur {
          enabled = true
            size = 4
            passes = 2
            vibrancy = 0.1696
        }
    }
    animations {
      enabled = true
        bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
    }
    dwindle {
      pseudotile = true
        preserve_split = true
    }
    master {
      new_status = master
    }
    misc { 
      force_default_wallpaper = -1
        disable_hyprland_logo = true
    }
    input {
      kb_layout = us
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =
        follow_mouse = 1
        sensitivity = 0
        touchpad {
          natural_scroll = true
        }
    }
    gestures {
      workspace_swipe = true
    }
    device {
      name = epic-mouse-v1
        sensitivity = -0.5
    }
  '';
}
