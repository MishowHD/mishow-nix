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

  # Workaround for a race condition between iwd and udev at boot:
  # iwd sometimes starts before the wireless interface exists, so its
  # Manager gives up trying to find the "default interface" and never
  # retries — NetworkManager then sees the device but it never connects.
  # Restarting iwd manually after boot always fixes it because by then
  # the interface is already present.
  # See: https://wiki.archlinux.org/title/Iwd#Frequent_disconnects_or_restart_is_needed_after_boot
  systemd.services.iwd = {
    after = [ "sys-subsystem-net-devices-wlan0.device" ];
    bindsTo = [ "sys-subsystem-net-devices-wlan0.device" ];
  };
}
