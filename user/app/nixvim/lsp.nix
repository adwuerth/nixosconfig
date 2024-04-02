{pkgs, ...}: {
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
      };
    };

    /*
    lsp-format.enable = true;
    */
  };
}
