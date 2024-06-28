{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      cmp = {
        enable = true;
        settings = {
          # snippet.expand = "luasnip";
          mapping = {
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-space>" = "cmp.mapping.complete()";
            "<C-y>" = {
              action = "cmp.mapping.confirm({
                                select = true, behavior = cmp.ConfirmBehavior.Insert })";
            };
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), { 'i', 'c' })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), { 'i', 'c' })";
          };
        };
        # window.documentation.border = [
        #   "╭"
        #   "─"
        #   "╮"
        #   "│"
        #   "╯"
        #   "─"
        #   "╰"
        #   "│"
        # ];
        # sources = [
        #   {name = "nvim_lua";}
        #   {name = "nvim_lsp";}
        #   # {name = "cmdline";}
        #   # {name = "path";}
        #   # {name = "luasnip";}
        #   {name = "buffer";}
        # ];
      };
      cmp-buffer.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lua.enable = true;
      cmp-cmdline.enable = true;
      cmp-path.enable = true;
    };
    extraConfigLua = ''
      -- Extra options for cmp-cmdline setup
      local cmp = require("cmp")
      cmp.setup.cmdline(":", {
      	mapping = cmp.mapping.preset.cmdline(),
      	sources = cmp.config.sources({
      		{ name = "path" },
      	}, {
      		{
      			name = "cmdline",
      			option = {
      				ignore_cmds = { "Man", "!" },
      			},
      		},
      	}),
      })
    '';
  };
}
