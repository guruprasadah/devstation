{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    opts = {
      number = true;
      relativenumber = true;

      mouse = "a";

      breakindent = true;

      list = true;
      listchars = {
        tab = "» ";
        trail = "·";
        nbsp = "␣";
      };

      inccommand = "split";

      confirm = true;

      expandtab = true;
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;

      clipboard = "unnamedplus";
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ":Ex<CR>";
        options = {
          silent = true;
          desc = "Open netrw in current file's dir";
        };
      }
    ];

    plugins = {
      mini-pairs = {
        enable = true;
        settings.modes = {
          command = true;
          insert = true;
          terminal = false;
        };
      };

      fidget.enable = true;

      blink-cmp = {
        enable = true;
        settings = {
          keymap.preset = "enter";
          sources.default = [ "lsp" "path" "snippets" "buffer" ];
        };
      };

      lspconfig.enable = true;

      lsp-signature = {
        enable = true;
        autoLoad = true;
      };
    };

    diagnostic = {
      settings = {
        virtual_text = true;
        signs = true;
        underline = true;
      };
    };

    lsp = {
      servers = {
        nixd.enable = true;
        pyright.enable = true;
      };
      onAttach = ''
      if client.supports_method("textDocument/inlayHint") then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    '';
    };
  };
}
