{ config, ... }:

{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "ea690d15-f297-43bf-8f7d-0f6d11ee1f42" = {
        credentialsFile = config.sops.templates."cloudflared.json".path;
        default = "http_status:404";
        ingress = {
          "mc4eva.mrld.city" = "tcp://localhost:25565";
          "skyblock.mrld.city" = "tcp://localhost:25566";
        };
      };
    };
  };
}
