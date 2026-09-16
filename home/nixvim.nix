{ nv, ... }:

{
  imports = [
    nv.homeModules.nixvim
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
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    plugins = {
      mini-pairs = {
        enable = true;
        settings.modes = {
          command = true;
          insert = true;
          terminal = false;
        };
      };
    };
  };
}
