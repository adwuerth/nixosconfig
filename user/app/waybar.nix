{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  programs.waybar = {
    enable = true;
    package = pkgs-unstable.waybar;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        # height = 26;
        # output = [
        #   "eDP-1"
        # ];

        modules-left = ["custom/logo" "hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = ["memory" "cpu" "pulseaudio" "clock"];

        "custom/logo" = {
          format = "";
          tooltip = false;
          on-click = ''rofi -show drun -show-icons'';
        };

        "hyprland/workspaces" = {
          format = "{icon} / {windows}";
          show-special = true;
          window-rewrite-default = "";
          # format-icons = {
          #   "1" = "";
          #   "2" = "";
          #   "3" = "";
          #   "4" = "";
          #   "5" = "";
          #   default = "";
          # };
          # persistent-workspaces = {
          #   "*" = 5;
          # };
          window-rewrite = {
            "class<firefox>" = "";
            "class<thunderbird>" = "";
            "class<kitty>" = "";
            "class<spotify>" = "";
            "class<obsidian>" = "";
            "virt-manager" = "󰢹";
            "rofi" = "󱓞";
            "class<discord>" = "󰙯";
            "class<VSCodium>" = "";
            "class<codium-url-handler>" = "";
          };
        };

        cpu = {
          interval = 1;
          format = "{}% ";
          max-length = 10;
        };

        memory = {
          interval = 10;
          format = "{}% ";
          max-length = 10;
        };

        # 	"custom/media" = {
        #     format = "{icon} {}";
        #     escape = true;
        #     return-type = "json";
        #     max-length = 40;
        #     on-click = "playerctl play-pause";
        #     on-click-right = "playerctl stop";
        #     smooth-scrolling-threshold = 10;
        #     on-scroll-up = "playerctl next";
        #     on-scroll-down = "playerctl previous";
        #     exec = "python3 ~/.config/waybar/mediaplayer.py --player spotify";
        # };

        "hyprland/window" = {
        };

        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-icons = {
            car = "";
            default = ["" "" ""];
            handsfree = "";
            headphones = "";
            headset = "";
            phone = "";
            portable = "";
          };
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          on-click = "pavucontrol";
        };
        "clock" = {
          interval = 60;
          format = "{:%a %d/%m %I:%M}";
        };
      };
    };
  };

  # home.file = {
  #   ".config/waybar/style.css" = {
  #     source = ./waybar/style.css;
  #   };
  # };

  home.file = let
    colors = config.lib.stylix.colors;
    colorize = name: hex: "@define-color ${name} #${hex};\n";
  in {
    ".config/waybar/style.css" = {
      text =
        colorize "highlight" colors.base0A
        + colorize "background" colors.base00
        + colorize "text" colors.base05
        + colorize "logo" colors.base0D
        + colorize "border" colors.base03
        # + "@define-color abc rgb(from hex(#ffffff) r g b / 0.8);\n"
        + builtins.readFile
        ./waybar/style_new.css;
    };
  };
}
