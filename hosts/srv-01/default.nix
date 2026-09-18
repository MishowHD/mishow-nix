{ ... }:

{
  imports = [
    ../../modules/nixos/common
    ../../modules/nixos/server
    ./hardware-configuration.nix
    ./disko.nix
  ];

  # Standard UEFI bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Filesystems configuration
  boot.supportedFilesystems = [ "btrfs" "zfs" ];
  boot.zfs.forceImportRoot = false;
  networking.hostId = "8425e349";

  system.stateVersion = "26.05";
}
