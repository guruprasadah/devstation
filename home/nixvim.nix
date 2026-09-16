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
      shiftwidth = 2;

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
