{ pkgs, ... }:
{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.defaultSession = "niri";
    flatpak.enable = true;
    fprintd.enable = true;
    openssh.enable = true;
    pcscd.enable = true;
    pipewire.audio.enable = true;
    pipewire.wireplumber.enable = true;
    tailscale = {
      enable = true;
      extraUpFlags = [ "--operator=oz" ];
    };
    udev.packages = [ pkgs.yubikey-personalization ];
    xserver = {
      enable = true;
      displayManager = {
        sddm.enable = true;
      };
      xkb = {
        layout = "gb";
      };
    };
    yubikey-agent.enable = true;
  };
}
