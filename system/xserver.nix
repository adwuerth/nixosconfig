{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (sddm-chili-theme.override {
      themeConfig = {
        ScreenWidth = 1920;
        ScreenHeight = 1080;
        blur = true;
        recursiveBlurLoops = 3;
        recursiveBlurRadius = 5;
      };
    })
  ];

  services.xserver = {
    enable = true;
    # displayManager.startx.enable = true;

    displayManager = {
      startx.enable = false;
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "chili";
      };
      # setupCommands = ''
      #   wlr-randr --output HDMI-A-1 --off
      # '';
    };

    videoDrivers = ["nvidia"];

    layout = "de";
    xkbVariant = "";
    # dpi = 96;
  };
}
