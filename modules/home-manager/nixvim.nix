{ inputs, ... }:

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

    globals.mapleader = " ";

    # Theme
    colorschemes.monokai-pro = {
      enable = true;
      settings = {
        filter = "classic";
      };
    };

    # Editor options
    opts = {
      clipboard = "unnamedplus";

      number = true;
      relativenumber = true;
      signcolumn = "yes";
      cursorline = true;

      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;

      scrolloff = 8;
      smoothscroll = true;

      ignorecase = true;
      smartcase = true;

      splitright = true;
      splitbelow = true;

      undofile = true;
      updatetime = 200;
      timeoutlen = 300;

      laststatus = 3;
    };

    # Diagnostics
    diagnostic.settings = {
      virtual_lines.current_line = true;
      severity_sort = true;

      float = {
        border = "rounded";
        source = true;
      };
    };

    # LSP
    plugins.lspconfig.enable = true;

    lsp = {
      inlayHints.enable = true;
      keymaps = [
        {
          key = "gd";
          mode = "n";
          lspBufAction = "definition";
          options.desc = "Goto Definition";
        }
        {
          key = "gD";
          mode = "n";
          lspBufAction = "declaration";
          options.desc = "Goto Declaration";
        }
      ];

      servers = {
        clangd.enable = true;
        gopls.enable = true;
        jsonls.enable = true;
        lua_ls.enable = true;
        marksman.enable = true;
        nixd.enable = true;
        pyright.enable = true;
        rust_analyzer.enable = true;
        taplo.enable = true;
      };
    };

    # Keymaps
    keymaps = [
      # Buffers
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>bprevious<CR>";
        options.desc = "Previous Buffer";
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
      # File explorer
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<CR>";
        options.desc = "Toggle Explorer";
      }

      # Flash
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "s";
        action = "<cmd>lua require('flash').jump()<CR>";
        options.desc = "Flash";
      }

      # Search and replace
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>sr";
        action = "<cmd>lua require('grug-far').open({ transient = true })<CR>";
        options.desc = "Search and Replace";
      }

      # Diagnostics
      {
        mode = "n";
        key = "gl";
        action = "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>";
        options.desc = "Line Diagnostics";
      }
      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>Trouble diagnostics toggle<CR>";
        options.desc = "Diagnostics";
      }

      # Git
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>LazyGit<CR>";
        options.desc = "LazyGit";
      }

      # Formatting
      {
        mode = "n";
        key = "<leader>cf";
        action = "<cmd>lua require('conform').format({ async = true, lsp_format = 'fallback' })<CR>";
        options.desc = "Format";
      }
    ];

    plugins = {
      # UI
      alpha = {
        enable = true;
        theme = "dashboard";
      };

      neo-tree = {
        enable = true;
        settings.close_if_last_window = true;
      };

      noice.enable = true;
      bufferline.enable = true;
      lualine.enable = true;

      which-key = {
        enable = true;
        settings.preset = "helix";
      };

      # Mini.nvim: editing utilities
      mini = {
        enable = true;
        mockDevIcons = true;

        modules = {
          ai = { };
          icons = { };
          pairs = { };
          surround = { };
        };
      };

      # Navigation and search
      flash.enable = true;
      grug-far.enable = true;

      telescope = {
        enable = true;

        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fr" = "oldfiles";
          "<leader>fb" = "buffers";
          "<leader>fh" = "help_tags";
          "<leader>fm" = "marks";
        };
      };

      # Git and diagnostics
      gitsigns.enable = true;
      lazygit.enable = true;
      todo-comments.enable = true;
      trouble.enable = true;

      # Completion
      friendly-snippets.enable = true;

      blink-cmp = {
        enable = true;
        settings = {
          keymap.preset = "enter";
          completion.documentation.auto_show = true;
        };
      };

      # Parsing
      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
      };

      # Formatting
      conform-nvim = {
        enable = true;

        settings = {
          formatters_by_ft = {
            nix = [ "nixfmt" ];
          };

          format_on_save = {
            timeout_ms = 500;
            lsp_format = "fallback";
          };
        };
      };

      # Markdown
      render-markdown.enable = true;

      # Sessions
      persistence.enable = true;

      # Cursor animation
      smear-cursor.enable = true;
    };
  };
}
