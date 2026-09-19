{ inputs, pkgs, ... }:
{
  programs.pandoc = {
    enable = true;

    defaults = {
      pdf-engine = "xelatex";
    };
  };
  home.packages = with pkgs; [
    (texlive.combine {
      inherit (texlive) scheme-medium xetex;
      # Add other texlive packages here if needed, e.g., fontspec, collection-fontsrecommended
    })
  ];
}
