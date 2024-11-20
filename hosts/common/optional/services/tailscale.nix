{ ... }:
{
  services.tailscale = {
    enable = true;
    extraUpFlags = [ "--operator=oz" ];
  };
}
