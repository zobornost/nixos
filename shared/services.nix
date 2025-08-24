{ pkgs, ... }:
{
  services = {
    flatpak.enable = true;
    gnome = {
      gnome-keyring = {
        enable = true;
      };
      gnome-remote-desktop.enable = true;
    };
    openssh.enable = true;
    pcscd.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    tailscale = {
      enable = true;
      extraUpFlags = [ "--operator=oz" ];
    };
    udev.packages = [ pkgs.yubikey-personalization ];
    xserver = {
      enable = true;
      desktopManager = {
        #budgie.enable = true;
        #cinnamon.enable = true;
        #deepin.enable = true;
        #enlightenment.enable = true;
        gnome = {
          enable = true;
          extraGSettingsOverridePackages = [ pkgs.mutter ];
          extraGSettingsOverrides = ''
            [org.gnome.mutter]
            experimental-features=['scale-monitor-framebuffer']
          '';
        };
        #mate.enable = true;
        #pantheon.enable = true;
      };
      displayManager.gdm = {
        enable = true;
        autoSuspend = false;
        wayland = true;
      };
      xkb = {
        layout = "gb";
      };
    };
    yubikey-agent.enable = true;
  };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gnome ];
}
