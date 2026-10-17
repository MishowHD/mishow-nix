{ hostName, ... }:

{
  # Automatic system upgrades for server stability and security
  system.autoUpgrade = {
    enable = true;
    flake = "github:MishowHD/mishow-nix#${hostName}";
    dates = "04:00";
    allowReboot = true;
  };
}
