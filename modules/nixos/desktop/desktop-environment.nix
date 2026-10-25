{ ... }:

{
  programs.niri.enable = true;
  programs.dux-shell.enable = true;

  services.displayManager.dux-greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/mishow";
    configFiles = [
      "/home/mishow/.config/DankMaterialShell/settings.json"
    ];
  };

  security.pam.services.login.fprintAuth = false;
  security.pam.services.greetd = {
    enableGnomeKeyring = true;
  };

  services.gnome.gnome-keyring.enable = true;
}
