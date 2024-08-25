{
  pkgs,
  pkgs-unstable,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscodium;
    mutableExtensionsDir = false;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    extensions = with pkgs-unstable.vscode-extensions; [
      vscodevim.vim
      rust-lang.rust-analyzer
      tamasfe.even-better-toml
      jnoortheen.nix-ide
      llvm-vs-code-extensions.vscode-clangd
      xaver.clang-format
      catppuccin.catppuccin-vsc
      jdinhlife.gruvbox
      usernamehw.errorlens
      vadimcn.vscode-lldb
      serayuzgur.crates
      james-yu.latex-workshop
      # github.copilot
      ms-python.python
      ziglang.vscode-zig
    ];
    userSettings = {
      editor = {
        fontLigatures = true;
        fontFamily = "GeistMono NF Medium";
        formatOnSave = true;
        fontSize = 14;
        semanticHighlighting.enabled = true;
        wordWrap = true;
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
        colorTheme = "Catppuccin Latte";
        fontAliasing = "antialiased";
      };
      rust-analyzer.check.command = "clippy";
    };
  };
}
