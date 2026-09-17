{ pkgs, nv, ... }:

{
  imports = [
    ../home/nixvim.nix
    ../home/git.nix
    ../home/uv.nix
  ];

  home.username = "guruprasadah";
  home.homeDirectory = "/Users/guruprasadah";
  home.packages = [ pkgs.ripgrep pkgs.htop ];
  home.stateVersion = "26.05";
}

