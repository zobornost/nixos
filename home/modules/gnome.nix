{ config, pkgs, lib, ... }:

{

  dconf = {
    enable = true;
    settings = with lib.hm.gvariant; {

      "org/gnome/desktop/background" = {
        color-shading-type = "solid";
        picture-options = "zoom";
        picture-uri = "file:///home/oz/.local/share/backgrounds/trans_wallpaper_1.png";
        picture-uri-dark = "file:///home/oz/.local/share/backgrounds/trans_wallpaper_1.png";
        primary-color = "#000000000000";
        secondary-color = "#000000000000";
      };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-light";
        cursor-size = 24;
        cursor-theme = "Yaru";
        enable-animations = true;
        font-name = "Noto Sans,  10";
        gtk-theme = "Yaru-magenta";
        icon-theme = "Yaru-magenta";
        scaling-factor = mkUint32 1;
        text-scaling-factor = 1.5;
        toolbar-style = "text";
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = ":minimize,maximize,close";
      };

      "org/gnome/mutter" = {
        center-new-windows = true;
        #experimental-features = [ "scale-monitor-framebuffer" ];
        overlay-key = "Super_L";
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        favorite-apps = [ "org.gnome.Nautilus.desktop" "chromium-browser.desktop" "microsoft-edge.desktop" "code.desktop" "1password.desktop" ];
        remember-mount-password = false;
        welcome-dialog-last-shown-version = "46.2";
      };

      "org/gnome/shell/extensions/arcmenu" = {
        all-apps-button-action = "All_Programs";
        application-shortcuts = "[{'id': 'org.gnome.Settings.desktop'}, {'id': 'ArcMenu_Software', 'name': 'Software'}, {'id': 'org.gnome.tweaks.desktop'}, {'id': 'com.mattjakeman.ExtensionManager.desktop', 'name': 'Extensions'}, {'id': 'ArcMenu_ActivitiesOverview', 'name': 'Overview', 'icon': 'view-fullscreen-symbolic'}]";
        arc-menu-icon = 71;
        arcmenu-hotkey = [ ];
        button-padding = 5;
        context-menu-items = "[{'id': 'ArcMenu_Settings', 'name': 'ArcMenu Settings', 'icon': 'ArcMenu_ArcMenuIcon'}, {'id': 'ArcMenu_PanelExtensionSettings', 'name': 'Panel Extension Settings', 'icon': 'application-x-addon-symbolic'}, {'id': 'com.mattjakeman.ExtensionManager.desktop'}, {'id': 'ArcMenu_Separator', 'name': 'Separator', 'icon': 'list-remove-symbolic'}, {'id': 'ArcMenu_PowerOptions', 'name': 'Power Options', 'icon': 'system-shutdown-symbolic'}, {'id': 'ArcMenu_ActivitiesOverview', 'name': 'Activities Overview', 'icon': 'view-fullscreen-symbolic'}, {'id': 'ArcMenu_ShowDesktop', 'name': 'Show Desktop', 'icon': 'computer-symbolic'}]";
        custom-menu-button-icon-size = 20.0;
        default-menu-view = "Frequent_Apps";
        distro-icon = 22;
        hide-overview-on-startup = true;
        menu-button-appearance = "Icon_Text";
        menu-button-icon = "Distro_Icon";
        menu-layout = "Default";
        menu-position-alignment = 50;
        multi-monitor = true;
        override-menu-theme = false;
        position-in-panel = "Center";
        power-options = [ (mkTuple [ 0 true ]) (mkTuple [ 1 true ]) (mkTuple [ 4 true ]) (mkTuple [ 2 true ]) (mkTuple [ 3 true ]) (mkTuple [ 5 false ]) (mkTuple [ 6 false ]) (mkTuple [ 7 false ]) ];
        prefs-visible-page = 0;
        runner-hotkey = [ "Super_L" ];
        runner-position = "Centered";
        runner-search-display-style = "Grid";
        runner-show-frequent-apps = true;
        search-entry-border-radius = mkTuple [ true 25 ];
        show-activities-button = true;
        vert-separator = true;
      };

      /* "org/gnome/shell/extensions/dash-to-panel" = {
        animate-appicon-hover = false;
        appicon-margin = 3;
        appicon-padding = 6;
        appicon-style = "NORMAL";
        available-monitors = [ 0 1 ];
        dot-color-1 = "#976ea0";
        dot-color-2 = "#976ea0";
        dot-color-3 = "#976ea0";
        dot-color-4 = "#976ea0";
        dot-color-dominant = false;
        dot-color-override = true;
        dot-color-unfocused-different = false;
        dot-position = "BOTTOM";
        dot-size = 4;
        dot-style-focused = "DOTS";
        dot-style-unfocused = "DOTS";
        focus-highlight = true;
        focus-highlight-color = "#ffffff";
        focus-highlight-dominant = false;
        focus-highlight-opacity = 20;
        group-apps = true;
        group-apps-underline-unfocused = false;
        group-apps-use-fixed-width = true;
        group-apps-use-launchers = false;
        hide-overview-on-startup = true;
        hotkeys-overlay-combo = "TEMPORARILY";
        isolate-workspaces = false;
        leftbox-padding = -1;
        middle-click-action = "LAUNCH";
        multi-monitors = false;
        panel-anchors = ''
          {"0":"MIDDLE","1":"MIDDLE"}
        '';
        panel-element-positions = ''
          {"0":[{"element":"centerBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":false,"position":"stackedTL"},{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"centerMonitor"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}],"1":[{"element":"centerBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":false,"position":"stackedTL"},{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"centerMonitor"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}]}\n
        '';
        panel-element-positions-monitors-sync = false;
        panel-lengths = ''
          {"0":100,"1":100}
        '';
        panel-positions = ''
          {"0":"TOP","1":"TOP"}\n
        '';
        panel-sizes = ''
          {"0":32,"1":32}
        '';
        primary-monitor = 0;
        progress-show-count = true;
        shift-click-action = "LAUNCH";
        shift-middle-click-action = "LAUNCH";
        show-apps-icon-file = "";
        show-favorites = false;
        show-running-apps = true;
        status-icon-padding = -1;
        stockgs-keep-top-panel = false;
        trans-bg-color = "#e5b8d9";
        trans-gradient-bottom-opacity = 0.1;
        trans-gradient-top-color = "#ffffff";
        trans-gradient-top-opacity = 0.1;
        trans-panel-opacity = 0.0;
        trans-use-custom-bg = false;
        trans-use-custom-gradient = false;
        trans-use-custom-opacity = true;
        trans-use-dynamic-opacity = false;
        tray-padding = -1;
        window-preview-title-position = "TOP";
      }; */

      "org/gnome/shell/extensions/display-configuration-switcher" = {
        configs = ''
          [('Personal', uint32 2612640683, [(0, 0, 1.5, uint32 0, true, [('DP-1', '3840x2160@59.997', @a{sv} {})]), (2560, 0, 1.25, 0, false, [('HDMI-1', '2560x1440@59.951', {})])], {'layout-mode': <uint32 1>}, [('DP-1', 'DEL', 'DELL G3223Q', '6BX70P3'), ('HDMI-1', 'DEL', 'DELL U2520D', 'H4MM923')]), ('Work', 3974777912, [(0, 0, 1.5, 0, true, [('DP-1', '3840x2160@59.997', {})])], {'layout-mode': <uint32 1>}, [('DP-1', 'DEL', 'DELL G3223Q', '6BX70P3'), ('HDMI-1', 'DEL', 'DELL U2520D', 'H4MM923')])]
        '';
      };

      "org/gnome/shell/extensions/mediacontrols" = {
        colored-player-icon = true;
        elements-order = [ "ICON" "CONTROLS" "LABEL" ];
        extension-position = "Left";
        label-width = "mkUint32 0";
        labels-order = [ "TITLE" "-" "ARTIST" ];
        scroll-labels = false;
        show-control-icons-seek-backward = false;
        show-control-icons-seek-forward = false;
      };

      "org/gnome/shell/extensions/user-theme-x" = {
        name = "Yaru-magenta";
        x-color = "prefer-light";
        x-color-night = "prefer-dark";
        x-cursor = "Yaru";
        x-cursor-night = "Yaru";
        x-gtk = "Yaru-magenta";
        x-gtk-night = "Yaru-magenta-dark";
        x-icons = "Yaru-magenta";
        x-icons-night = "Yaru-magenta-dark";
        x-shell = "Yaru-magenta";
        x-shell-night = "Yaru-magenta-dark";
        x-stylesheet = true;
      };

      "org/gnome/shell/extensions/window-title-is-back" = {
        colored-icon = true;
        fixed-width = false;
        show-app = true;
        show-icon = true;
      };
    };
  };

  home = {

    file = {
      #"${config.home.homeDirectory}/.config/gnome-shell/gnome-shell-light.css".source = ../themes/gnome-shell-light.css;
      "${config.home.homeDirectory}/.local/share/backgrounds/trans_wallpaper_1.png".source = ../../resources/trans_wallpaper_1.png;
    };

    packages = with pkgs; [
      dconf2nix
      gnome.gnome-software
      gnome.gnome-terminal
      gnome-extension-manager
    ];
  };

  programs = {
    gnome-shell = {
      enable = true;
      extensions = (with pkgs; [
        { package = gnomeExtensions.arcmenu; }
        { package = gnomeExtensions.display-configuration-switcher; }
        { package = gnomeExtensions.appindicator; }
        { package = gnomeExtensions.dash-to-panel; }
        { package = gnomeExtensions.forge; }
        { package = gnomeExtensions.gsconnect; }
        { package = gnomeExtensions.media-controls; }
        #{ package = gnomeExtensions.paperwm; }
        { package = gnomeExtensions.rounded-window-corners-reborn; }
        { package = gnomeExtensions.tailscale-qs; }
        { package = gnomeExtensions.user-themes-x; }
        { package = gnomeExtensions.window-title-is-back; }
      ]);
    };
  };

}
