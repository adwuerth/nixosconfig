{
  pkgs,
  pkgs-unstable,
  config,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = true;
    # image = ./wallpaper.png;
    image = ./dock.jpg;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/solarflare.yaml";
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    fonts = {
      monospace = {
        package = pkgs-unstable.nerdfonts.override {fonts = ["GeistMono"];};
        name = "GeistMono Nerd Font";
      };

      emoji = config.stylix.fonts.monospace;
      serif = {
        package = pkgs-unstable.geist-font;
        name = "Geist Medium";
      };
      sansSerif = config.stylix.fonts.serif;

      sizes = {
        applications = 12;
        desktop = 12;
        popups = 12;
        terminal = 12;
      };
    };
    cursor = {
      size = 24;
      package = pkgs.apple-cursor;
      name = "macOS-BigSur";
    };
    targets.waybar.enable = false;
    targets.vscode.enable = false;
  };
}
