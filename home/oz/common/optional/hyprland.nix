{ config, lib, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = with pkgs; ([
      hyperpanel
      hyperlock
      hyprpanel
      hyprpaper
    ]);
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };
    xwayland.enable = true;
  };
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.yaru;
    name = "Yaru";
    size = 16;
  };
  gtk = {
    enable = true;
    theme = {
      package = pkgs.yaru;
      name = "Yaru";
    };
    iconTheme =
      {
        package = pkgs.yaru;
        name = "Yaru";
      }
        fonts = {
    name = "0xProto";
    size = 12;
  };
  programs.kitty.enable = true;
}
