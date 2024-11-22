{ config, home-manager, pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    extensions = [
      #"aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    ];
  };
  programs.firefox.enable = true;
  home.packages = (with pkgs; [
    google-chrome
    #microsoft-edge
  ]);
}
