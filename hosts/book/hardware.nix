{ ... }:
{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          ControllerMode = "dual";
          FastConnectable = "true";
          RememberPowered = "true";
        };
      };
    };
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
  };
}
