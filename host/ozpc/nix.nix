{ config, lib, pkgs, ... }:

{
  system.stateVersion = "24.05"; # Don't change :)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
