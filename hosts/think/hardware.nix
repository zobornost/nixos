{ lib, pkgs, ... }:
{
  hardware = {
    enableRedistributableFirmware = lib.mkDefault true;
    graphics.extraPackages = [
      pkgs.vpl-gpu-rt
    ];
    cpu.intel.updateMicrocode = lib.mkDefault true;
  };
}
