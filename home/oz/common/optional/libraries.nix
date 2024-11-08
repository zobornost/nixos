{ config, lib, home-manager, pkgs, ... }:

{
  home.packages = (with pkgs; [
    jdk
    libgnome-keyring
    nodejs_22
    yubioath-flutter
  ]);
}
