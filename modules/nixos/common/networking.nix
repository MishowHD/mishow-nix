{ lib, hostName, ... }:

{
  networking = {
    hostName = lib.mkDefault hostName;
    firewall.enable = true;
    nftables.enable = true;
  };

  services.resolved.enable = true;
  services.tailscale.enable = true;
}
