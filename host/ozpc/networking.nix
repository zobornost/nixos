{ config, lib, pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
    hostName = "ozpc";
    firewall.enable = false;
  };
}
