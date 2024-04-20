{pkgs, ...}: {
  home.packages = with pkgs; [
    lua-language-server
    rust-analyzer
    nixd
    nixfmt
    # clangd
  ];
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        clangd = {
          enable = true;
        };
      };
    };

    /*
    lsp-format.enable = true;
    */
  };
}
