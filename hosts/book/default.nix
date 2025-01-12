{ ... }:
{
  imports = [
    ./boot.nix
    ./filesystems.nix
    ./hardware.nix
    ./networking.nix
    ./swapDevices.nix
    ./system.nix
  ];
}
