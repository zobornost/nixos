{ ... }:
{
  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
    };
    kernelModules = [ "kvm-intel" ];
    kernelParams = [ "i915.force_probe=7d45" ];
  };
}
