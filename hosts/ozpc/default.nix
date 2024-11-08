{ config, lib, pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ./fancontrol.nix
    ./filesystems.nix
    ./minecraft.nix
    ./secrets.nix
    ../common/core
    ../common/optional/desktop
    ../common/optional/services
    ../common/users/oz
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

  services.displayManager.defaultSession = "sway";

  services.flatpak.enable = true;

  system.stateVersion = "24.05"; # Don't change :)

  # this needs to be tidied/split up
  environment.systemPackages = (with pkgs; [
    age
    cachix
    linux-firmware
    wget
  ]);

  zramSwap.enable = true;

}
