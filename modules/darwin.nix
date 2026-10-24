{ pkgs, config, constants, ... }:

{
  environment.systemPackages = [
    pkgs.zsh
    pkgs.vim
    pkgs.desktoppr
  ];

  environment.systemPath = [
    "$HOME/.local/bin"
  ];

  programs.zsh.enable = true;

  nix-homebrew = {
    enable = true;
    enableRosetta = false;
    user = constants.username;
  };

  homebrew = {
    enable = true;
    brews = [
      "cloudflared"
    ];
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "none";
    };
  };

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

  system.activationScripts.postActivation.text = ''
    echo "Setting macOS wallpaper from Stylix..."
    sudo -u ${constants.username} ${pkgs.desktoppr}/bin/desktoppr "${constants.wallpaper}"
  '';

}
