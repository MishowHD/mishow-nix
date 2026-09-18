{ ... }:

{
  imports = [
    ./auto-upgrade.nix
    ./k3s.nix
    ./packages.nix
    ./ssh.nix
    ./user.nix
  ];
}
