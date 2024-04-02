{pkgs, ...}: {
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      formatOnSave = {
        lspFallback = true;
        timeoutMs = 2000;
      };
      formattersByFt = {
        nix = ["alejandra"];
        css = ["prettierd" "prettier"];
        markdown = ["prettier"];
      };
    };

    extraConfigLuaPre = ''
      -- Formatting function for conform
      _G.format_with_conform = function()
      	local conform = require("conform")
      	conform.format({
      		lsp_fallback = true,
      		async = false,
      		timeout_ms = 2000,
      	})
      end
    '';
  };
}
