{ lib, ... }:
{
  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "rtsx_pci_sdmmc" ];
    };
    kernelModules = [ "kvm-intel" ];
  };
}
