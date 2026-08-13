{
  description = "MishowHD configurations for NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, nixpkgs-stable, ... }:
    {
      nixosConfigurations = {
        des-01 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; hostName = "des-01"; };
          modules = [ ./hosts/des-01 ];
        };

        lap-01 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; hostName = "lap-01"; };
          modules = [ ./hosts/lap-01 ];
        };

        srv-01 = nixpkgs-stable.lib.nixosSystem {
          specialArgs = { inherit inputs; hostName = "srv-01"; };
          modules = [ ./hosts/srv-01 ];
        };
      };
    };
}
