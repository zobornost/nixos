{ config, pkgs, lib, ... }:

{
    environment.systemPackages = (with pkgs; [
        cosmic-panel
        eww
        fuzzel
        ironbar
        kdePackages.krohnkite
        mako
        nixos-icons
        wallust
        waybar
        xwayland-satellite
        yambar
    ]);
    programs.niri.enable = true;
    #programs.river.enable = true;
    services.desktopManager.plasma6.enable = true;
    services.displayManager.defaultSession = "plasma";
    #services.xserver.desktopManager.gnome.enable = true;
    services.xserver.desktopManager.budgie.enable = true;
    
}
