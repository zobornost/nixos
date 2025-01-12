{ config, home-manager, lib, pkgs, ... }:
{
  home.packages = (with pkgs; [
    alacritty
    blesh
    darktile
    ghostty
    hyfetch
  ]);
  home.sessionVariables = {
    EDITOR = "code";
    TERMINAL = "nu";
  };
  programs = {
    bash.enable = true;
    nushell = {
      enable = true;
      configFile.text = ''
        $env.config.show_banner = false
        use ~/.cache/starship/init.nu
      '';
      envFile.text = ''
        mkdir ~/.cache/starship
        starship init nu | save -f ~/.cache/starship/init.nu
      '';
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
      settings = {
        character = {
          success_symbol = "[](green)";
          error_symbol = "[](red)";
        };
      };
    };
  };
}

