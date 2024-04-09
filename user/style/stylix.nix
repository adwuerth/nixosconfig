{
  pkgs,
  config,
  ...
}: {
  stylix = {
    image = ./wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font";
      };

      emoji = config.stylix.fonts.monospace;
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Serif";
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
      name = "apple-cursor";
    };
    targets.waybar.enable = false;
  };
}
