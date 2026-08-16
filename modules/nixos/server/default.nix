{ ... }:

{
  imports = [
    ./auto-upgrade.nix
    ./k3s.nix
    ./packages.nix
    ./proxmox.nix
    ./ssh.nix
    ./user.nix
  ];
}
