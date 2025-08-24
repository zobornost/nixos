{ config, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "usbhid"
    "usb_storage"
    "sd_mod"
    "rtsx_pci_sdmmc"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [
    "kvm-amd"
    "amdgpu"
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
    "typec"
    "ucsi_acpi"
  ];
  boot.kernelParams = [
    "drm.edid_firmware=DP-8:edid/dp8.bin,DP-9:edid/dp9.bin"
    "amdgpu.dc=1"
    "amdgpu.dcdebugmask=0x10"
  ];
  boot.extraModulePackages = [ ];
}
