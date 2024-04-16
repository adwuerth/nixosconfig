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

    ./style/stylix.nix
  ];

  home.username = "adrian";
  home.homeDirectory = "/home/adrian";

  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;
  qt.enable = true;

  home.packages =
    (with pkgs; [
      thunderbird
      obs-studio
      # obs-studio-plugins.wlrobs
      blender
      pavucontrol
      hyprpicker
      xdg-utils
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      grim
      slurp
      wl-clipboard
      playerctl
      dunst
      feh
      wlr-randr
      neofetch

      kitty
      spotify

      lua-language-server
      rust-analyzer

      virt-manager
      virt-viewer
      qemu
      libvirt

      firefox

      waybar
      swww
      xclip
      # rofi-wayland

      ranger

      (pkgs.discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
    ])
    ++ (with pkgs-unstable; [
      # vesktop
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
