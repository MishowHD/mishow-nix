{ pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  services.printing = {
      enable = true;
  #   drivers = [
  #     pkgs.hplipWithPlugin
  #     pkgs.foo2zjs
  #   ];
    };
}
