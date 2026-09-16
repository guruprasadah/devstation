{
  imports = [
    ./gh.nix
  ];

  programs.git = {
    enable = true;

    settings = {
      user = {
	name = "Guruprasad AH";
	email = "guruprasadah08@gmail.com";
      };

      init.defaultBranch = "main";
    };
  };
}
