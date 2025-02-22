{ ... }:
{
  services = {
    pipewire = {
      enable = true;
      alsa.enable = false;
      alsa.support32Bit = false;
      pulse.enable = true;
      jack.enable = false;
      wireplumber.enable = true;
    };
    xserver = {
      videoDrivers = [ "nvidia" ];
    };
  };
}
