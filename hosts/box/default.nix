{ ... }:
{
  imports = [
    ./boot.nix
    ./filesystems.nix
    ./hardware.nix
    ./networking.nix
    ./secrets.nix
    ./services.nix
    ./swapDevices.nix
    ./system.nix
    ./users.nix
  ];
}
