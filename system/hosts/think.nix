{ lib, pkgs, ags, ... }:

{
  imports = [
    #../modules/audio.nix
    #../modules/cloudflared.nix
    #../modules/development.nix
    ../modules/displaymanager.nix
    ../modules/fonts.nix
    #../modules/hyprland.nix
    ../modules/locale.nix
    ../modules/desktops.nix
    ../modules/nix.nix
    ../modules/openssh.nix
    #../modules/plymouth.nix
    #../modules/security.nix
    #../modules/sway.nix
    #../modules/tailscale.nix
    #../modules/wayland.nix
    #../modules/yubikey.nix
    ../modules/think/hardware.nix
    ../modules/think/filesystems.nix
    #../modules/think/secrets.nix
  ];

  networking = {
    hostName = "think";
    networkmanager.enable = true;
    firewall.enable = false;
    enableIPv6 = false;
    useDHCP = lib.mkDefault true;
  };

  services.flatpak.enable = true;

  services.fprintd.enable = true;

  system.stateVersion = "24.11"; # Don't change :)

  # this needs to be tidied/split up

}
