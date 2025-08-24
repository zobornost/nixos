{
  config,
  lib,
  pkgs,
  ...
}:
{
  hardware = {
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
    firmware = [
      (pkgs.runCommand "custom-edid" { } ''
        mkdir -p $out/lib/firmware/edid
        cp ${./hardware/edid/dp8.bin} $out/lib/firmware/edid/dp8.bin
        cp ${./hardware/edid/dp9.bin} $out/lib/firmware/edid/dp9.bin
      '')
    ];
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        nvidia-vaapi-driver
      ];
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      prime = {
        sync.enable = true;
        amdgpuBusId = "PCI:6:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
