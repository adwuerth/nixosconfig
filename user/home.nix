{ config, pkgs, ... }:
{
	imports = [
		./app/zsh.nix
		./app/kitty.nix
		./app/waybar.nix
		./app/rofi.nix
		./app/git.nix
		./wm/hyprland.nix
	];

  home.username = "adrian";
  home.homeDirectory = "/home/adrian";

  home.stateVersion = "23.11";

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  gtk.font.name = "JetBrainsMono Nerd Font";

home.pointerCursor = {
  gtk.enable = true;
  package = pkgs.vanilla-dmz;
  name = "Vanilla-DMZ";
};

programs = {
  neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = ''
    '';
    plugins = with pkgs.vimPlugins; [
    ];
  };
};
  
  programs.home-manager.enable = true;
}
