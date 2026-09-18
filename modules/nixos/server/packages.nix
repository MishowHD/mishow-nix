{ pkgs, ... }:

{
  # Default shell for root
  programs.fish.enable = true;

  # Global environment variables
  environment.variables = {
    EDITOR = "vim";
  };

  # Support for NFS file systems
  boot.supportedFilesystems = [ "nfs" ];

  # General server utilities and CLI tools
  environment.systemPackages = with pkgs; [
    fish
    htop
    btop
    iotop-c
    smartmontools
    lm_sensors
    sysstat
    jq
    findutils
    rsync
    screen
    tcpdump
    zellij
    tree
    vim
    neovim
    yq-go
    bat
    nfs-utils
    curl
    git
    ncdu

    # Fun utilities
    cowsay
    figlet
    lolcat
    fastfetch
  ];
}
