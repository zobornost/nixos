{ config, lib, pkgs, ... }:

{

  services = {

    displayManager.defaultSession = "gnome-xorg";

    flatpak.enable = true;
    openssh.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    printing.enable = true;

    tailscale = {
      enable = true;
      extraUpFlags = [ "--operator=oz" ];
    };

    xserver = {
      enable = true;
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
      displayManager = {
        gdm = {
          enable = true;
          autoSuspend = false;
        };
      };
      videoDrivers = [ "nvidia" ];
      xkb = {
        layout = "gb";
        variant = "";
      };
    };

  };
}
