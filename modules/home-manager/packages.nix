{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # CLI & System Utilities
    neovim
    vim
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
    alacritty
    nautilus
    zed-editor
    spotify
    discord
    seahorse
    xwayland-satellite
    papers
    telegram-desktop
    prismlauncher
    vlc

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
