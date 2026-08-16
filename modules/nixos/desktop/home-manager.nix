{ inputs, hostName, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs hostName; };

    users.mishow = {
      imports = [
        ../../home-manager
        ../../../hosts/${hostName}/home.nix
      ];
    };
  };
}


