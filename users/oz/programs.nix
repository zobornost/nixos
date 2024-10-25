{ config, home-manager, ... }:

{
  programs = {

    bash = {
      enable = true;
    };

    chromium = {
      enable = true;
      extensions = [
        #"aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
        "nngceckbapebfimnlniiiahkandclblb" # bitwarden
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
