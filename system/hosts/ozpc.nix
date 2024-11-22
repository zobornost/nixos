{ pkgs, ags, ... }:

{
  imports = [
    ../modules/audio.nix
    ../modules/cloudflared.nix
    ../modules/displaymanager.nix
    ../modules/fonts.nix
    #../modules/hyprland.nix
    ../modules/locale.nix
    ../modules/misc.nix
    ../modules/niri.nix
    ../modules/nix.nix
    ../modules/openssh.nix
    ../modules/plymouth.nix
    ../modules/security.nix
    #../modules/sway.nix
    ../modules/tailscale.nix
    ../modules/wayland.nix
    ../modules/yubikey.nix
    ../modules/ozpc/hardware.nix
    ../modules/ozpc/fancontrol.nix
    ../modules/ozpc/filesystems.nix
    ../modules/ozpc/minecraft.nix
    ../modules/ozpc/secrets.nix
  ];

  networking = {
    hostName = "ozpc";
    networkmanager.enable = true;
    firewall.enable = false;
    enableIPv6 = false;
  };

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
    timeout = 0;
  };

  services.displayManager.defaultSession = "niri";

  services.flatpak.enable = true;

  system.stateVersion = "24.05"; # Don't change :)

  # this needs to be tidied/split up
  environment.systemPackages = (with pkgs; [
    age
    cachix
    linux-firmware
    wget
    ags.packages.${pkgs.system}.default
  ]);

  zramSwap.enable = true;

}
