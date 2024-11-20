{ config, home-manager, pkgs, ... }:
{
  home.packages = (with pkgs; [
    alacritty
    darktile
    kitty
    waveterm
  ]);
}
