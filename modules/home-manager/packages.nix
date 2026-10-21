{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # CLI & System Utilities
    htop
    btop
    curl
    wl-clipboard
    fzf
    antigravity-cli
    nixd
    nil
    nmap
    dnsutils
    ripgrep
    file
    gdb

    # Dev & Ops Tools
    clang-tools
    k9s
    kubectl
    kubectx
    fluxcd
    gh
    popeye
    sops

    # Desktop Applications & GUI
    nautilus
    zed-editor
    spotify
    discord
    seahorse
    xwayland-satellite
    papers
    prismlauncher
    vlc
    nextcloud-client
    heroic
    ghidra
    telegram-desktop
    libreoffice-qt

    #Development
    rustc
    cargo
    rust-analyzer
    clippy
    rustfmt
    gcc
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      numpy
    ]))
  ];
}
