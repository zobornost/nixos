{ ... }:
{
  boot = {
    initrd = {
      availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod"];
    };
    kernelModules = ["kvm-intel"];
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    }
  }
}