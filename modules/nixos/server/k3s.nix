{ config, pkgs, ... }:

{
  # K3s service configuration

  networking.firewall.allowedTCPPorts = [
    6443 # k3s: required so that pods can reach the API server (running on port 6443 by default)
    # 2379 # k3s, etcd clients: required if using a "High Availability Embedded etcd" configuration
    # 2380 # k3s, etcd peers: required if using a "High Availability Embedded etcd" configuration
    10250
  ];
  networking.firewall.allowedUDPPorts = [
    # 8472 # k3s, flannel: required if using multi-node for inter-node networking
  ];

  services.k3s = {
    enable = true;
    package = pkgs.k3s_1_36;
    role = "server";
    extraFlags = toString [
      "--tls-san=${config.networking.hostName}"
    ];
  };

  # Environment variables for Kubernetes
  environment.variables = {
    KUBECONFIG = "/etc/rancher/k3s/k3s.yaml";
  };

  # Kubernetes CLI tools
  environment.systemPackages = with pkgs; [
    k9s
    kubectl
  ];
}
