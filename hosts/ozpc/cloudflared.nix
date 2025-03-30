{ config, ... }:

{
  services.cloudflared = {
    enable = true;
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
