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
          ashift = "12";
          autotrim = "off";
        };
        rootFsOptions = {
          compression = "zstd";
        };
        datasets = {
          "storage" = {
            type = "zfs_fs";
            mountpoint = "/var/lib/rancher/k3s/storage";
            options.mountpoint = "legacy";
          };
        };
      };
    };
  };
}
