{ lib, hostName, ... }:

{
  networking = {
    hostName = lib.mkDefault hostName;
    firewall.enable = true;
    nftables.enable = true;
    networkmanager = {
      wifi.macAddress = "random";
    };
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      Domains = [ "~." ];
    };
  };

  services.dnscrypt-proxy = {
    enable = true;
    settings = {
      server_names = [ "cloudflare" ];
      require_dnssec = true;
    };
  };

  services.tailscale.enable = true;
}
