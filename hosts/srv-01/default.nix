{ pkgs, ... }:

{
  imports = [
    ../../modules/nixos/common
    ../../modules/nixos/server
    ./hardware-configuration.nix
    ./disko.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages;

  boot.supportedFilesystems = [ "btrfs" "zfs" ];
  boot.zfs.forceImportRoot = false;
  networking.hostId = "8425e349";

  services.zfs.autoScrub = {
    enable = true;
    interval = "weekly";
  };

  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
  };

  services.smartd = {
    enable = true;
    notifications.wall.enable = true;
  };

  system.stateVersion = "26.05";
}
