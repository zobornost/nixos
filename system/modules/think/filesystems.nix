{config, lib, pkgs, ...}:
{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/8129c75d-dce1-4c39-b4fe-1f3c6568f572";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/09B6-3D27";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/26ad19ba-1e45-4d57-b732-1c25b753368c"; }
    ];
}
