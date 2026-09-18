{
  disko.devices = {
    disk = {
      # SSD 240GB: Sistema Operativo (Btrfs) e Bootloader (EFI)
      os = {
        type = "disk";
        device = "/dev/sdb";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                subvolumes = {
                  "@" = {
                    mountpoint = "/";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  "@nix" = {
                    mountpoint = "/nix";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  "@home" = {
                    mountpoint = "/home";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                };
              };
            };
          };
        };
      };

      # Dischi 1TB: Mirror ZFS per i dati di K3s (Immich, Nextcloud, database)
      data1 = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "zdata";
              };
            };
          };
        };
      };

      data2 = {
        type = "disk";
        device = "/dev/sdc";
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "zdata";
              };
            };
          };
        };
      };
    };

    zpool = {
      zdata = {
        type = "zpool";
        mode = "mirror";
        options = {
          ashift = "12"; # Allineamento settori a 4K (fondamentale per dischi moderni)
          autotrim = "on"; # Abilita il TRIM per liberare blocchi cancellati
        };
        rootFsOptions = {
          compression = "zstd"; # Compressione trasparente senza cali di prestazioni
        };
        datasets = {
          "k3s" = {
            type = "zfs_fs";
            mountpoint = "/var/lib/rancher/k3s";
            options.mountpoint = "legacy"; # Indica a ZFS di far gestire il mount a systemd/fstab di NixOS
          };
        };
      };
    };
  };
}
