{ config, home-manager, pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    extensions = [
      "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    ];
  };
  programs.firefox.enable = true;
  home.packages = (with pkgs; [
    google-chrome
    #microsoft-edge
  ]);
}
