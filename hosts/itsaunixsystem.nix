{ self, inputs, pkgs, constants, ... }:
{
  imports = [
    ../modules/nixpkgs.nix
    ../modules/darwin.nix
  ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs; inherit pkgs; inherit constants; };
  home-manager.users.${constants.username} = ../modules/home-manager.nix;
  system.configurationRevision =
    self.rev or self.dirtyRev or null;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
