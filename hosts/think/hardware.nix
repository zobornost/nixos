{ lib, pkgs, ... }:
{
  hardware = {
    enableRedistributableFirmware = true;
    graphics.extraPackages = [
      pkgs.vpl-gpu-rt
    ];
    cpu.intel.updateMicrocode = true;
  };
}
