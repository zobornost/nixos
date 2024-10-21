{ config, lib, pkgs, ... }:

{

  environment = {
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
      libei # for deskflow overlay
      libportal # for desflow overlay
      nvd
      pavucontrol
      plymouth
      tailscale
      vim
      wget
      xorg.xrandr
    ];
  };

}
