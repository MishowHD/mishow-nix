{ ... }:

{
  networking = {
    firewall.enable = true;
    nftables.enable = true;
  };

  services.resolved.enable = true;
  services.tailscale.enable = true;
}
