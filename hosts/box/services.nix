{
  services = {
    caddy.enable = true;
    home-assistant.enable = true;
    pipwire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    prowlarr.enable = true;
    radarr.enable = true;
    sonarr.enable = true;
    xserver.dipslayManager.gdm.enable = true;
    xserver.desktopManager.kodi.enable = true;
    zigbee2mqtt.enable = true;
  };
}