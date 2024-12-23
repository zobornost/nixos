{ config, home-manager, pkgs, ... }:
{
  home.packages = (with pkgs; [
    _1password
    _1password-gui
    bc
    bitwarden-desktop
    btop
    clang
    coreutils
    curl
    eyedropper
    fd
    graphviz
    inkscape
    lazygit
    mcman
    nix-index
    nixpkgs-fmt
    nuclear
    nvd
    packwiz
    pika-backup
    prismlauncher
    ripgrep
    scribus
    shellcheck
    swig
  ]);
  programs.home-manager.enable = true;
  programs.micro.enable = true;
}
