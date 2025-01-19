{
  services = {
    caddy.enable = true;
    displayManager.autoLogin = {
      enable = true;
      user = "tv";
    };
    #home-assistant.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    #prowlarr.enable = true;
    #radarr.enable = true;
    #sonarr.enable = true;
    xserver.displayManager.gdm.enable = true;
    xserver.desktopManager.kodi.enable = true;
    zigbee2mqtt.enable = true;
  };
}