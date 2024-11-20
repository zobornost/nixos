{ pkgs, ... }:
{
  programs.niri.enable = true;
  environment.systemPackages = (with pkgs; [
    fuzzel
    mako
    wallust
    xwayland-satellite
  ]);
}
