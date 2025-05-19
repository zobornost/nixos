{ config, ... }:
{
  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/f340d68c-58a0-4ef0-961d-2957b0ece55e";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/E73A-5FB2";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };
}
