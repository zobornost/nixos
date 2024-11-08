{ config, lib, pkgs, ... }:

{

  boot.initrd.availableKernelModules = [ "vmd" "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "uas" "sd_mod" ];
  boot.kernelModules = [ "kvm-intel" "coretemp" "nct6775" ];
  boot.kernelParams = [ "quiet" "splash" "boot.shell_on_fail" "nvidia.NVreg_PreserveVideoMemoryAllocations=1" "nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" ];

  hardware = {

    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    enableRedistributableFirmware = true;

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };

    opengl = {
      enable = true;
      driSupport32Bit = true;
      extraPackages = with pkgs;[ vaapiVdpau nvidia-vaapi-driver ];
    };

  };

  services.xserver.videoDrivers = [ "nvidia" ];
}
