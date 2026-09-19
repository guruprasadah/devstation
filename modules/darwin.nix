{ pkgs, config, ... }:

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

  system.primaryUser = "guruprasadah";

  system.stateVersion = 6;
}
