{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    neofetch
    bat
    fzf
    tree
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    shellAliases = {
      ls = "eza -a --icons";
      buildhome = "home-manager switch --flake ~/.dotfiles/";
      buildos = "sudo nixos-rebuild switch --flake ~/.dotfiles/";
      buildall = "buildos; buildhome";
      obsidian-ozone = "obsidian --disable-gpu --enable-features=UseOzonePlatform --ozone-platform=wayland";
      codium-ozone = "codium --enable-features=UseOzonePlatform --ozone-platform=wayland";
      # cat = "bat";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = "awesomepanda";
    };
  };

  programs.eza = {
    enable = true;
    icons = true;
  };
}
