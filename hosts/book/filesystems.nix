{ ... }:
{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/a67a0172-d5cc-4a98-9cb9-3c4a1be0aa33";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/BA62-CC03";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
  };
}
