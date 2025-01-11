{ config, home-manager, pkgs, ... }:

{
  home.packages = (with pkgs; [
    adwaita-qt
    imagemagick
    pywal16
    wallust
    yaru-theme
  ]);
}
