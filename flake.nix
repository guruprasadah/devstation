{
  description = "System flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
    };
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nixvim, stylix }:
  let
    constants = import ./constants.nix;
  in
  {
    darwinConfigurations."itsaunixsystem" = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/itsaunixsystem.nix
        home-manager.darwinModules.home-manager
      ];
      specialArgs = {
        inherit self;
        inherit inputs;
        inherit constants;
      };
    };
  };
}
