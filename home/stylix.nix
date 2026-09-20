{ inputs, constants, ... }:

{
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;

    image = constants.wallpaper;
    polarity = "dark";
  };
}
