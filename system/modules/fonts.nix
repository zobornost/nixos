{ pkgs, ... }:
{
  fonts.packages = (with pkgs; [
    fira
    nerd-fonts._0xproto
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ]);
}