{ config, lib, pkgs, modulesPath, ... }:

{
  #imports = [ (modulesPath + "/installer/scan/not-detected.nix")];
  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [  ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelParams = [ "i915.force_probe=7d45" ];
  boot.extraModulePackages = [ ];
  hardware.enableRedistributableFirmware = lib.mkDefault true;
  hardware.graphics.extraPackages = [
    pkgs.vpl-gpu-rt
  ];
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
