{ ... }:

{
  services.fwupd.enable = true;
  services.dbus.enable = true;

  zramSwap.enable = true;
  programs.gnupg.agent.enable = true;
  security.polkit.enable = true;
}
