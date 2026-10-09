{ ... }:

{
  networking = {
    nftables.enable = true;
    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
    };
    firewall.trustedInterfaces = [ "virbr0" ];
  };

  services.resolved.settings.Resolve = {
    Domains = [ "~." ];
  };

  services.dnscrypt-proxy = {
    enable = true;
    settings = {
      server_names = [ "cloudflare" ];
      require_dnssec = true;
    };
  };
}
