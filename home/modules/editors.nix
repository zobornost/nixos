{ config, home-manager, pkgs, ... }:
{
  home.packages = (with pkgs; [
    apostrophe
    emacs
    lapce
    vim
    vscode
    zed-editor
  ]);
}
