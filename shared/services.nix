{ pkgs, ... }:
{
  services = {
<<<<<<< HEAD
    desktopManager = {
      plasma6.enable = true;
    };
    displayManager = {
      defaultSession = "plasma";
      sddm.enable = true;
    };
=======
    desktopManager.plasma6.enable = true;
    displayManager.defaultSession = "niri";
>>>>>>> 361eb05db7ff7cc532dfb79c4932397382ce1f13
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
      xkb = {
        layout = "gb";
      };
    };
    yubikey-agent.enable = true;
  };
}
