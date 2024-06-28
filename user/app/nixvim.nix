{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./nixvim/format.nix
    # ./nixvim/cmp.nix
    ./nixvim/lsp.nix
    ./nixvim/lint.nix
    # ./nixvim/telescope.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    # colorschemes.dracula.enable = true;

    clipboard.register = "unnamedplus";
    globals = {
      mapleader = " ";
    };
    extraPackages = with pkgs; [
      alejandra
      nodePackages.prettier
      prettierd
      rustfmt
    ];
    plugins = {
      luasnip.enable = true;
      oil.enable = true;
      treesitter.enable = true;
      comment.enable = true;
      gitsigns.enable = true;

      vimtex = {
        enable = true;
      };

      lualine = {
        enable = true;
        iconsEnabled = true;
        globalstatus = true;
        # theme = "gruvbox";
      };

      nix.enable = true;
    };
    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      shiftwidth = 2;
      tabstop = 2;
    };
  };
}
