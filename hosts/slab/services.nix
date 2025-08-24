{ config, pkgs, ... }:
{
  services = {
    fprintd = {
      enable = true;
      tod = {
        enable = true;
        driver = pkgs.libfprint-2-tod1-goodix-550a;
      };
    };
    fwupd.enable = true;
    hardware.bolt.enable = true;
    xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      desktopManager.gnome.enable = true;
      videoDrivers = [ "nvidia" ];
      xkb = {
        layout = "gb";
        variant = "";
      };
    };
    gnome.gnome-keyring.enable = true;
  };
}
