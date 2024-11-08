{ config, home-manager, ... }:

{
  programs.git = {
    enable = true;
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
    userName = "Oz Browning";
    userEmail = "56755170+ozmodeuz@users.noreply.github.com";
  };
}
