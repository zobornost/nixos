{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/2a216358-b008-47ab-93d4-4e73752dff30";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C076-BA57";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };
  fileSystems."/media" = {
    device = "/dev/disk/by-uuid/1f34ad5b-b44b-4ece-9099-76512ba3f3e0";
    fsType = "ext4";
  };
}