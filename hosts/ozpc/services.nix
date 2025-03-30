{ ... }:
{
  services = {
    cockpit.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = false;
      alsa.support32Bit = false;
      pulse.enable = true;
      jack.enable = false;
      wireplumber.enable = true;
    };
    xserver = {
      monitorSection = ''
        Section "Monitor"
          Identifier "DP-1"
          Option "Primary" "true"
        EndSection
      '';
      videoDrivers = [ "nvidia" ];
    };
  };
}
