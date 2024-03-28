{config, pkgs, ...}:

{
	programs.git = {
		enable = true;
		userName = "Adrian";
		userEmail = "adrian.wuerth@outlook.de";
		extraConfig  = {
			init.defaultBranch = "main";
		};
	};
}
