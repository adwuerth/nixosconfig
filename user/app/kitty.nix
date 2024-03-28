{ config, lib, pkgs, ... }:

{
	programs.kitty = {
		enable = true;
		font = {
			name = "JetBrainsMono Nerd Font";
		};
		theme = "Kaolin Aurora";
		settings = {
			background_opacity = lib.mkForce "0.80";
		};
	};
}
