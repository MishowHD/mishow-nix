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
}
