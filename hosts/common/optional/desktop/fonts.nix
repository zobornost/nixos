{ config, lib, pkgs, ... }:
{
  fonts.packages = (with pkgs; [
    fira
    ibm-plex
    (nerdfonts.override {
      fonts = [
        "0xProto"
        "JetBrainsMono"
        "NerdFontsSymbolsOnly"
      ];
    })
  ]);
}
