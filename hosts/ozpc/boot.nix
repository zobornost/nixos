{ config, ... }:
{
  boot = {
    #extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
    initrd = {
      availableKernelModules = [
        "vmd"
        "xhci_pci"
        "ahci"
        "nvme"
        "usbhid"
        "usb_storage"
        "uas"
        "sd_mod"
        "nvidia"
        "nvidia_modeset"
        "nvidia_drm"
        "nvidia_uvm"
      ];
    };
    kernelModules = [
      "kvm-intel"
      "coretemp"
      "nct6775"
    ];
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "usbcore.autosuspend=-1"
      "nvidia-drm.fbdev=1"
      "nvidia-drm.modeset=1"
      "fbcon=map:1"
    ];
  };
}
