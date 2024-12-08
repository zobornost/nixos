{ config, pkgs, lib, ... }:

{
    environment.sessionVariables = {
        KDEWM = "niri";
    };
    environment.systemPackages = (with pkgs; [
        #eww
        fuzzel
        ironbar
        kdePackages.karousel
        kdePackages.krohnkite
        #mako
        nixos-icons
        wallust
        waybar
        xwayland-satellite
        #yambar
    ]);
    programs.niri.enable = true;
    #programs.river.enable = true;
    services.desktopManager.plasma6.enable = true;
    services.displayManager.defaultSession = "plasma";
    #services.xserver.desktopManager.gnome.enable = true;
    #services.xserver.desktopManager.budgie.enable = true;
    
}
