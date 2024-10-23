{ config, pkgs, unstable-pkgs, home-manager, ... }:

{

  home = {
    username = "oz";
    homeDirectory = "/home/oz";
    packages =
      (with pkgs; [
        _1password
        _1password-gui
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
        waveterm
      ]);
    sessionVariables = {
      EDITOR = "micro";
    };
    stateVersion = "24.05";
  };

  programs = {

    bash = {
      enable = true;
    };

    chromium = {
      enable = true;
      extensions = [
        "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      ];
    };

    firefox.enable = true;

    git = {
      enable = true;
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
      userName = "Oz Browning";
      userEmail = "56755170+ozmodeuz@users.noreply.github.com";
    };

    home-manager.enable = true;

    micro.enable = true;
  };

}
