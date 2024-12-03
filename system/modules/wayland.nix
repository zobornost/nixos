{ lib, pkgs, ... }:
{
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
    systemPackages = (with pkgs; [
      #deskflow
      libei
      libportal
    ]);
  };
  programs.xwayland.enable = lib.mkForce true;
}
