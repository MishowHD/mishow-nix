{ inputs, hostName, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs hostName; };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.mishow = {
      imports = [
        ../../home-manager
      ] ++ (
        let
          hostHome = ../../../hosts/${hostName}/home.nix;
        in
        if builtins.pathExists hostHome then [ hostHome ] else [ ]
      );
    };
  };
}

