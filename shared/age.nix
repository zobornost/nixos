{
  age.secrets.cloudflared = {
    file = ../secrets/cloudflared.json;
    mode = "0400";
    owner = "cloudflared";
    group = "cloudflared";
    path = "/etc/cloudflared/credentials.json";
  };
}
