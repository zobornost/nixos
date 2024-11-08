{ config, pkgs, lib, ... }:
{
  programs.sway = {
    enable = true;
    package = pkgs.sway;
    extraPackages = with pkgs; [
      autotiling
      swayidle
      swaylock
      swaynotificationcenter
    ];
    extraOptions = [
      "--unsupported-gpu"
    ];
    wrapperFeatures.base = true;
    wrapperFeatures.gtk = true;
  };
}
