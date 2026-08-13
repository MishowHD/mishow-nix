{ pkgs, ... }:

{
  imports = [
    ../../modules/nixos/common
    ../../modules/nixos/desktop
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelParams = [
      "quiet"
      "noapic"
      "intel_iommu=on"
      "lockdown=integrity"
    ];

    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Btrfs mount optimizations
  fileSystems."/".options = [
    "compress=zstd"
    "noatime"
  ];
  fileSystems."/home".options = [
    "compress=zstd"
    "noatime"
  ];
  fileSystems."/nix".options = [
    "compress=zstd"
    "noatime"
  ];
  services.btrfs.autoScrub.enable = true;

  hardware.graphics.enable = true;

  # Nvidia drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
  };

  programs.steam.enable = true;

  system.stateVersion = "26.05";
}
