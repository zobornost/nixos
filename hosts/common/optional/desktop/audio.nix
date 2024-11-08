{ config, lib, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.pavucontrol ];
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  hardware.pulseaudio.enable = false; # FIXME: is this a conlict?
}
