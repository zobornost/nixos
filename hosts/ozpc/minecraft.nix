{ pkgs, ... }:
let
  mkMinecraftService = name: jdkPackage: {
    #enable = true;
    description = "Minecraft (${name})";
    path = [
      pkgs.bash
      jdkPackage
    ];
    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash /home/oz/.minecraft/${name}/server/start.sh";
      Restart = "on-failure";
      WorkingDirectory = "/home/oz/.minecraft/${name}/server";
      StandardInput = "socket";
      StandardOutput = "journal";
    };
    wantedBy = [ "multi-user.target" ];
  };

  mkMinecraftSocket = name: {
    description = "Minecraft ${name} Socket";
    wantedBy = [ "sockets.target" ];
    socketConfig.ListenFIFO = [ "/run/minecraft/${name}" ];
  };

in
{
  users.groups = {
    mc = {
      gid = 10001;
    };
  };
  systemd.services.createnco2 = mkMinecraftService "createnco2" pkgs.jdk;
  systemd.sockets.createnco2 = mkMinecraftSocket "createnco2";
  # systemd.services.mc4eva = mkMinecraftService "mc4eva" pkgs.jdk;
  # systemd.sockets.mc4eva = mkMinecraftSocket "mc4eva";
  systemd.services.skyblock = mkMinecraftService "skyblock" pkgs.jdk;
  systemd.sockets.skyblock = mkMinecraftSocket "skyblock";
  environment.systemPackages = [ pkgs.mcman ];
}
