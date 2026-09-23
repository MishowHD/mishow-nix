{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.git.override { withLibsecret = true; };
    settings = {
      credential.helper = "libsecret";
      user = {
        name = "Giacomo Di Clerico";
        email = "giacomodiclerico@gmail.com";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
