{ lib, config, ... }:
{
  age.secrets = lib.mkIf config.services.cloudflared.enable {
    cloudflared = {
      file = ../secrets/cloudflared.json;
      mode = "0400";
      owner = "cloudflared";
      group = "cloudflared";
      path = "/etc/cloudflared/credentials.json";
    };
  };
}
