{ config, lib, pkgs, ... }:
let
  mkMinecraftService = name: path: jdk: {
    enable = true;
    description = "Minecraft (${name})";
    path = [
      pkgs.bash
      jdk
    ];
    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash /home/oz/.minecraft/${name}/server/start.sh";
      Restart = "always";
      WorkingDirectory = "/home/oz/.minecraft/${name}/server";
    };
    wantedBy = [ "multi-user.target" ];
  };

  mkMinecraftSocket = name: {
    description = "Minecraft ${name} Socket";
    wantedBy = [ "sockets.target" ];
    listenStreams = [ "/run/minecraft/${name}.sock" ];
  };
in
{

  services = {

    /*     cloudflared = {
      enable = true;
      tunnels = {
        "686bad5d-9c46-48ea-9bab-60ba1eed53d7" = {
          credentialsFile = "/home/oz/.cloudflared/cert.pem";
          default = "http_status:404";
        };
      };
    }; */

    displayManager.defaultSession = "gnome";

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

  systemd.services.mc4eva = mkMinecraftService "mc4eva" "/home/oz/.minecraft/mc4eva/server" pkgs.jdk17;
  systemd.services.skyblock = mkMinecraftService "skyblock" "/home/oz/.minecraft/skyblock/server" pkgs.jdk;

  systemd.sockets.mc4eva = mkMinecraftSocket "mc4eva";
  systemd.sockets.skyblock = mkMinecraftSocket "skyblock";

}
