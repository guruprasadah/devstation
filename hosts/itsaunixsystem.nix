{ self, inputs, ... }:
{
  imports = [
    ../modules/darwin.nix
  ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { nv = inputs.nixvim; };
  home-manager.users.guruprasadah = ../modules/home-manager.nix;
  system.configurationRevision =
    self.rev or self.dirtyRev or null;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
