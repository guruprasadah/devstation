{
  programs.pandoc = {
    enable = true;

    defaults = {
      pdf-engine = "xelatex";
    };
  };
  home.packages = with pkgs; [
    (texlive.combined.scheme-medium.override {
      withXeTeX = true;
    })
  ];
}
