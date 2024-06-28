{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (sddm-chili-theme.override {
      themeConfig = {
        ScreenWidth = 1920;
        ScreenHeight = 1080;
        blur = true;
        recursiveBlurLoops = 3;
        recursiveBlurRadius = 5;
        background = ../user/style/wallpaper.png;
      };
    })
  ];

  services.xserver = {
    enable = true;

    videoDrivers = ["nvidia"];

    xkb = {
      layout = "de";
      variant = "";
    };
  };

  services.displayManager = {
    # startx.enable = false;

    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "chili";
    };
  };
}
