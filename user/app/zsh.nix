{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;

    shellAliases = {
      ls = "eza -a --icons";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = "af-magic";
    };
  };

  programs.eza = {
    enable = true;
    icons = true;
  };
}
