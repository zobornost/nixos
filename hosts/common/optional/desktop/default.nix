{ config, lib, ... }:

{
  imports = [
    ./audio.nix
    ./displaymanager.nix
    ./fonts.nix
    ./plymouth.nix
    ./sway.nix
    ./wayland.nix
    ./yubikey.nix
  ];
}
