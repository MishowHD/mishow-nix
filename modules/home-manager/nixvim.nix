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
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      signcolumn = "yes";
      termguicolors = true;
      cursorline = true;
      scrolloff = 8;
      ignorecase = true;
      smartcase = true;
      splitright = true;
      splitbelow = true;
    };

    globals = {
      mapleader = " ";
    };

    extraPackages = with pkgs; [
      fd
      ripgrep
      tree-sitter
      glib
      nixpkgs-fmt
      lazygit
    ];

    keymaps = [
      # Neo-tree (File Explorer)
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<CR>";
        options.desc = "Toggle Explorer";
      }

      # Buffer navigation (stile LazyVim)
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>bprevious<CR>";
        options.desc = "Prev Buffer";
      }
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>bnext<CR>";
        options.desc = "Next Buffer";
      }
      {
        mode = "n";
        key = "<leader>bd";
        action = "<cmd>bdelete<CR>";
        options.desc = "Delete Buffer";
      }

      # Navigazione finestre/split
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Go to Left Window";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "Go to Lower Window";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Go to Upper Window";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Go to Right Window";
      }

      # Diagnostica & Errori (Trouble)
      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>Trouble diagnostics toggle<CR>";
        options.desc = "Diagnostics (Trouble)";
      }

      # Git / LazyGit (stile LazyVim)
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>LazyGit<CR>";
        options.desc = "LazyGit";
      }

      # Formattazione manuale
      {
        mode = "n";
        key = "<leader>cf";
        action = "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<CR>";
        options.desc = "Format Document";
      }

      # Pulisci highlight di ricerca con Esc
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
        options.desc = "Clear Search Highlights";
      }

      # Ripristina ultima sessione
      {
        mode = "n";
        key = "<leader>sl";
        action = "<cmd>lua require('persistence').load()<CR>";
        options.desc = "Restore Last Session";
      }

      # Indentazione comoda in visual mode
      {
        mode = "v";
        key = "<";
        action = "<gv";
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
      }
    ];

    plugins = {
      # UI LazyVim
      web-devicons.enable = true;
      which-key.enable = true;
      bufferline.enable = true;
      lualine.enable = true;
      gitsigns.enable = true;
      lazygit.enable = true;
      nvim-autopairs.enable = true;

      # Welcome Screen
      alpha = {
        enable = true;
        theme = "dashboard";
      };

      # File Explorer
      neo-tree = {
        enable = true;
        settings.close_if_last_window = true;
      };

      # Diagnostica
      trouble.enable = true;

      # Gestione sessioni
      persistence.enable = true;

      # Formatting
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            timeout_ms = 500;
            lsp_format = "fallback";
          };
          formatters_by_ft = {
            nix = [ "nixpkgs_fmt" ];
          };
        };
      };

      # Parsing
      treesitter.enable = true;

      # Ricerca file e testo (stile moderno / LazyVim)
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader><space>" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>/" = "live_grep";
          "<leader>fr" = "oldfiles";
          "<leader>fh" = "oldfiles";
          "<leader>fm" = "marks";
          "<leader>fb" = "buffers";
        };
      };

      # Evidenziazione e ricerca TODO, FIXME, NOTE nel codice
      todo-comments.enable = true;

      # Completion
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

      # LSP (Language Server Protocol)
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
