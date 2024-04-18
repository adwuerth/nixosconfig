{
  pkgs,
  pkgs-unstable,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscodium;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      rust-lang.rust-analyzer
      tamasfe.even-better-toml
      jnoortheen.nix-ide
    ];
    userSettings = {
      editor = {
        fontLigatures = true;
        fontFamily = "GeistMono NF Medium";
        formatOnSave = true;
        fontSize = 14;
      };

      nix = {
        formatterPath = "nixfmt";
        enableLanguageServer = true;
        serverPath = "nixd";
        serverSettings.nixd = {
          formatting.command = ["nixfmt"];
        };
      };

      workbench = {
        colorTheme = "Monokai";
        fontAliasing = "antialiased";
      };
      rust-analyzer.check.command = "clippy";
    };
  };
}
