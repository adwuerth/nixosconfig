{
  pkgs,
  pkgs-unstable,
  ...
}: {
  imports = [
    ./app/zsh.nix
    ./app/kitty.nix
    ./app/waybar.nix
    ./app/rofi.nix
    ./app/git.nix
    ./app/nixvim.nix
    ./app/hyprland.nix
    ./app/vscode.nix

    ./style/stylix.nix
  ];

  home.username = "adrian";
  home.homeDirectory = "/home/adrian";

  home.stateVersion = "23.11";

  qt.enable = true;
  home.packages =
    (with pkgs; [
      thunderbird
      obs-studio
      # obs-studio-plugins.wlrobs
      blender
      neofetch

      libreoffice
      kitty
      spotify

      virt-manager
      virt-viewer
      qemu
      libvirt

      zed-editor

      firefox

      texlive.combined.scheme-full

      imagemagick
      pdf2svg
      img2pdf
      pdftk

      unzip

      zig

      helvum
      qpwgraph
      wf-recorder
      ranger
      lolcat
      # (pkgs.discord.override {
      #   withOpenASAR = true;
      #   withVencord = true;
      # })
    ])
    ++ (with pkgs-unstable; [
      texlivePackages.csquotes

      jetbrains.rust-rover
      obsidian
      vesktop
    ]);

  # home.services.dunst.enable = true;

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  #gtk.font.name = "JetBrainsMono Nerd Font";

  # home.pointerCursor = {
  #   gtk.enable = true;
  #   # package = pkgs.vanilla-dmz;
  #   # name = "Vanilla-DMZ";
  #
  #   name = "";
  # };

  programs.home-manager.enable = true;
}
