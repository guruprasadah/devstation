{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.vim
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.users.guruprasadah = {
    home = "/Users/guruprasadah";
    shell = pkgs.zsh;
  };

  system.stateVersion = 6;
}
