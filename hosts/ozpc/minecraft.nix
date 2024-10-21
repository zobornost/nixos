{ config, pkgs, ... }:

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
  systemd.services.mc4eva = mkMinecraftService "mc4eva" "/home/oz/.minecraft/mc4eva/server" pkgs.jdk17;
  systemd.services.skyblock = mkMinecraftService "skyblock" "/home/oz/.minecraft/skyblock/server" pkgs.jdk;

  systemd.sockets.mc4eva = mkMinecraftSocket "mc4eva";
  systemd.sockets.skyblock = mkMinecraftSocket "skyblock";
}
