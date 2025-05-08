{ pkgs, ... }:
{
  fonts.packages = [
    pkgs.fira
    pkgs.inter-nerdfont
    pkgs.nerd-fonts._0xproto
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.symbols-only
  ];
}
