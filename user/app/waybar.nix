{
  config,
  pkgs,
  ...
}: {
  programs.waybar.enable = true;

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 26;
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
        format = "{icon} -> {windows}";
        window-rewrite-default = "";
        window-rewrite = {
          "class<firefox>" = "";
          "class<thunderbird>" = "";
          "class<kitty>" = "";
          "494d6d0" = "";
          "virt-manager" = "󰢹";
          "rofi" = "󱓞";
          "class<discord>" = "󰙯";
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

  home.file = {
    ".config/waybar/style.css" = {
      source = ./waybar/style.css;
    };
  };
}
