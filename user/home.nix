{
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
  config,
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

      kitty
      spotify

      virt-manager
      virt-viewer
      qemu
      libvirt

      # spotify-tui

      # obsidian

      firefox
      # rofi-wayland

      texlive.combined.scheme-basic

      # clang
      # gcc

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

  home.pointerCursor = {
    gtk.enable = true;
    # package = pkgs.vanilla-dmz;
    # name = "Vanilla-DMZ";
  };

  programs.home-manager.enable = true;
}
