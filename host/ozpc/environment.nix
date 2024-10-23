{ config, lib, pkgs, ... }:

{
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      autorandr
      bc
      btop
      cloudflared
      curl
      firefox
      flatpak
      git
      home-manager
      jdk
      jdk17
      linux-firmware
      nvd
      pavucontrol
      plymouth
      tailscale
      vim
      wget
      xorg.xrandr
    ];
  };

  programs.bash.blesh.enable = true;

}
