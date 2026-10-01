{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
  };

  services.udiskie.enable = true;

  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
    };
  };

  xdg.desktopEntries = {
    ghidra = {
      name = "Ghidra";
      # On Wayland non-reparenting/tiling compositors (like Niri), Java AWT/Swing GUI
      # requires _JAVA_AWT_WM_NONREPARENTING=1 to prevent blank or unresponsive windows.
      exec = "env _JAVA_AWT_WM_NONREPARENTING=1 ghidra";
      icon = "ghidra";
    };
  };
}
