{ ... }:

{

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a67a0172-d5cc-4a98-9cb9-3c4a1be0aa33";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/BA62-CC03";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/953f0e5d-a327-41ee-b069-69d1c1f5c851"; }
    ];

}
