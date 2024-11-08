{ config, lib, pkgs, ... }:
{
  services.tailscale = {
    enable = true;
    extraUpFlags = [ "--operator=oz" ];
  };
}
