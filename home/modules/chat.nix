{ config, home-manager, pkgs, ... }:
{
  home.packages = (with pkgs; [
    discord
  ]);
}
