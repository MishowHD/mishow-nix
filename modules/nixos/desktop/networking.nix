{ ... }:

{
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

  networking.wireless.iwd.settings = {
    Settings = {
      AddressRandomization = "network";
    };
  };
}
