{ config, home-manager, pkgs, ... }:
{
  imports = [
    ./common/core
    ./common/optional
  ];
  home = {
    username = "oz";
    homeDirectory = "/home/oz";
    stateVersion = "24.05";
  };
}
