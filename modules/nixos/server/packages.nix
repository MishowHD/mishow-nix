{ pkgs, ... }:

{
  # Default shell for root
  programs.fish.enable = true;

  programs.neovim = { enable = true; defaultEditor = true; vimAlias = true; };

  # Support for NFS file systems
  boot.supportedFilesystems = [ "nfs" ];

  # General server utilities and CLI tools
  environment.systemPackages = with pkgs; [
    fish
    htop
    smartmontools
    lm_sensors
    jq
    findutils
    rsync
    zellij
    tree
    yq-go
    bat
    curl
    git

    # Fun utilities
    fastfetch
  ];
}
