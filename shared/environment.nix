{ pkgs, inputs, ... }:
{
  environment = {
    sessionVariables = {
      EDITOR = "micro";
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
    systemPackages = with pkgs; [
      adwaita-qt
      inputs.agenix.packages.${system}.default
      bc
      btop
      codex
      coreutils
      curl
      fd
      fuzzel
      gnome-extension-manager
      gnome-remote-desktop
      gnome-tweaks
      gnomeExtensions.appindicator
      gnomeExtensions.arcmenu
      gnomeExtensions.blur-my-shell
      gnomeExtensions.dash-to-panel
      gnomeExtensions.focus
      gnomeExtensions.forge
      gnomeExtensions.gsconnect
      gnomeExtensions.just-perfection
      gnomeExtensions.paperwm
      gnomeExtensions.rounded-corners
      gnomeExtensions.rounded-window-corners-reborn
      gnomeExtensions.tailscale-qs
      gnomeExtensions.tiling-shell
      gnomeExtensions.user-themes-x
      gnomeExtensions.window-is-ready-remover
      gparted
      home-manager
      # kdePackages.kaccounts-integration
      # kdePackages.kaccounts-providers
      # kdePackages.karousel
      # kdePackages.kdepim-addons
      # kdePackages.kio-gdrive
      # kdePackages.krohnkite
      # kdePackages.signon-kwallet-extension
      # kdePackages.signond
      lazygit
      libgnome-keyring
      micro
      nix-index
      nixfmt-rfc-style
      nixos-icons
      nodejs_22
      nvd
      packwiz
      pam_u2f
      pavucontrol
      ripgrep
      shellcheck
      sops
      swig
      vim
      yaru-theme
      yubikey-manager
      yubioath-flutter
    ];
  };
}
