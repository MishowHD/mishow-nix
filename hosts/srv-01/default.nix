{ ... }:

{
  imports = [
    ../../modules/nixos/common
    ../../modules/nixos/server
    ./hardware-configuration.nix
    ./disko.nix
  ];

  # Standard UEFI bootloader for Proxmox / VM / Bare-metal
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "26.05";
}
