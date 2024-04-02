{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # syntaxHightlighting.enable = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;

    shellAliases = {
      ls = "eza -a --icons";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = "norm";
    };
  };
}
