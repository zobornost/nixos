{ config, pkgs, unstable-pkgs, home-manager, ... }:

{
  home = {
    username = "oz";
    homeDirectory = "/home/oz";
    sessionVariables = {
      EDITOR = "micro";
    };
    stateVersion = "24.05";
  };
}
