{ pkgs, ... }:
{
  fonts.packages = (with pkgs; [
    fira
    ibm-plex
    nerd-fonts._0xproto
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ]);
}
