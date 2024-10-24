{ config, pkgs, unstable-pkgs, home-manager, ... }:

{
  home.packages =
    (with pkgs; [
      bitwarden-desktop
      blesh
      coolercontrol.coolercontrol-gui
      coolercontrol.coolercontrol-liqctld
      coolercontrol.coolercontrol-ui-data
      coolercontrol.coolercontrold
      discord
      eyedropper
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
      packwiz
      pika-backup
      prismlauncher
      rio
      scribus
      vscode
      yaru-theme
    ])
    ++
    (with unstable-pkgs; [
      _1password
      _1password-gui
      waveterm
    ]);
}
