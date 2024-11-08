{ config, home-manager, pkgs, ... }:

{
  home.packages = (with pkgs; [
    imagemagick
    yaru-theme
    pywal16
    wallust
  ]);
}
