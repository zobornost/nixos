{ config, lib, pkgs, ... }:


  let
  cloudflared-bin = pkgs.stdenv.mkDerivation rec {
    pname = "cloudflared-bin";
    version = "2025.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/cloudflare/cloudflared/releases/download/${version}/cloudflared-linux-amd64";
      sha256 = "df13e7e0a027f648c410b5cc701fbcff028724d0e93209796cdbb79ec38695d4";
    };
    nativeBuildInputs = [ pkgs.autoPatchelfHook pkgs.patchelf pkgs.binutils ];
    dontUnpack = true;
    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/bin/cloudflared
      chmod +x $out/bin/cloudflared
    '';
  };
in
{
  environment.systemPackages = [
    cloudflared-bin
  ];
  services.cloudflared = {
    enable = true;
    package = cloudflared-bin;
    tunnels = {
      "ea690d15-f297-43bf-8f7d-0f6d11ee1f42" = {
        credentialsFile = "/etc/cloudflared/credentials.json";
        default = "http_status:404";
        ingress = {
          "mc.mrld.city" = "tcp://localhost:25565";
          "skyblock.mrld.city" = "tcp://localhost:25566";
        };
      };
    };
  };  
}