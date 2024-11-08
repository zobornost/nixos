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
    mcman
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
  programs.bash.enable = true;
  programs.bash.initExtra = ''
    export PATH="$PATH:$HOME/.config/emacs/bin:$HOME/.npm-packages"
    export EDITOR="micro"
  '';

  programs.home-manager.enable = true;
  programs.micro.enable = true;
}
