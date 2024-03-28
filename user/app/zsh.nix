{ config, pkgs, ... }:

{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		# syntaxHightlighting.enable = true;

		oh-my-zsh = {
			enable = true;
			plugins = ["git"];
			theme = "norm";
		};
	};
}
