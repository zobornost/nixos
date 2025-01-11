{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.pavucontrol ];
  services.pipewire.audio.enable = true;
  services.pipewire.wireplumber.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = false;
  # };
}
