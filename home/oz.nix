{ config, lib, home-manager, ... }:
{
  imports = [
    ./modules/browsers.nix
    ./modules/chat.nix
    ./modules/editors.nix
    ./modules/git.nix
    ./modules/gnome.nix
    ./modules/libraries.nix
    ./modules/ssh.nix
    ./modules/terminals.nix
    ./modules/themes.nix
    ./modules/tools.nix
  ];
  home = {
    username = "oz";
    homeDirectory = "/home/oz";
    stateVersion = "24.05";
  };
}
