{ pkgs, ... }:
{
  fonts.packages = (with pkgs; [
    fira
    fira-code
    ibm-plex
    nerd-fonts._0xproto
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ]);
}