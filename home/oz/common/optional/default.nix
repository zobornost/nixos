{ config, lib, ... }:

{
  imports = [
    ./browsers.nix
    ./chat.nix
    ./editors.nix
    ./git.nix
    ./gnome.nix
    ./libraries.nix
    ./terminals.nix
    ./themes.nix
    ./tools.nix
  ];
}
