{ pkgs, ... }:

{
  users.users.mishow = {
    isNormalUser = true;
    description = "Giacomo Di Clerico";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
}
