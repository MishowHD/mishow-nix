{ lib, hostName, ... }:

{
  networking = {
    hostName = lib.mkDefault hostName;
    firewall.enable = true;
  };


  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
  ];

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSSEC = "true";
      Domains = [ "~." ];
      DNSOverTLS = "true";
    };
  };


  services.tailscale.enable = true;
}
