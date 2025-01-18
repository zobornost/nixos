{ ... }:
{
  imports = [
    ./boot.nix
    ./filesystems.nix
    ./hardware.nix
    ./networking.nix
    ./secrets.nix
    ./swapDevices.nix
    ./system.nix
    ../../shared
  ];
}
