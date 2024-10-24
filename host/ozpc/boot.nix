{ config, lib, pkgs, ... }:

{
  boot = {
    initrd = {
      availableKernelModules = [ "vmd" "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "uas" "sd_mod" ];
      kernelModules = [ ];
    };
    extraModulePackages = [ ];
    kernelModules = [ "kvm-intel" "coretemp" "nct6775" ];
    kernelParams = [ "quiet" "splash" "boot.shell_on_fail" "nvidia.NVreg_PreserveVideoMemoryAllocations=1" "nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
    plymouth = {
      enable = true;
      theme = "breeze";
    };
  };
}
