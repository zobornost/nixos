{ config, inputs, pkgs, unstable-pkgs, ... }:
{
  home.packages = (with pkgs; [
    bc
    bitwarden-desktop
    blesh
    btop
    coolercontrol.coolercontrol-gui
    coolercontrol.coolercontrol-liqctld
    coolercontrol.coolercontrol-ui-data
    coolercontrol.coolercontrold
    curl
    discord
    eyedropper
    firefox
    git
    graphviz
    inkscape
    mcman
    microsoft-edge
    (nerdfonts.override {
      fonts = [
        "0xProto"
      ];
    })
    nil
    nixpkgs-fmt
    nuclear
    nvd
    packwiz
    pika-backup
    prismlauncher
    rio
    scribus
    vim
    yaru-theme
  ])
  ++
  (with unstable-pkgs; [
    _1password
    _1password-gui
    vscode
    waveterm
  ]);
}
