{ inputs, ... }:

{
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;

    image = ./wallpapers/supra_festival.jpeg;
    polarity = "dark";
  };
}
