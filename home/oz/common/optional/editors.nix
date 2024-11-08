{ config, home-manager, pkgs, ... }:
{
  home.packages = (with pkgs; [
    emacs
    lunarvim
    vim
    vscode
  ]);
}
