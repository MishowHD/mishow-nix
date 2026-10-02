{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    nixpkgs.source = inputs.nixpkgs;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };

    opts = {
      winbar = "%=%m %f";
      clipboard = "unnamedplus";
    };

    globals = {
      mapleader = " ";
    };

    extraPackages = with pkgs; [ fd tree-sitter glib ];

    plugins = {
      lualine.enable = true;
      treesitter.enable = true;

      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
        };
      };

      neo-tree.enable = true;

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
          };
        };
      };

      lsp = {
        enable = true;
        keymaps.lspBuf = {
          "K" = "hover";
          "gd" = "definition";
          "<leader>ca" = "code_action";
          "<leader>cr" = "rename";
        };
        servers = {
          clangd.enable = true;
          gopls.enable = true;
          jsonls.enable = true;
          marksman.enable = true;
          nixd.enable = true;
          pyright.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          taplo.enable = true;
          lua_ls.enable = true;
        };
      };
    };
  };
}
