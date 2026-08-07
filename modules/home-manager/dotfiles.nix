{ config, ... }:

let
  dotfilesDir = "${config.home.homeDirectory}/.config/nixos/dotfiles";
in
{
  xdg.configFile = {
    "fastfetch".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/.config/fastfetch";
    "nvim".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/.config/nvim";
    "niri".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/.config/niri";
    "alacritty".source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/.config/alacritty";
    "DankMaterialShell".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/.config/DankMaterialShell";
  };
}
