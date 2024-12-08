{ ... }:
{
  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm = {
          enable = false;
          autoSuspend = false;
        };
        sddm.enable = true;
      };
    };
  };
}
