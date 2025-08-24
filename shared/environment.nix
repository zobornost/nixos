{ pkgs, inputs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      adwaita-qt
      inputs.agenix.packages.${system}.default
      bc
      # btop          # moved to HM
      # codex         # moved to HM
      coreutils
      # curl          # moved to HM
      # fd            # moved to HM
      # fuzzel        # moved to HM
      # gnome-extension-manager  # moved to HM
      gnome-remote-desktop
      # gnome-tweaks  # moved to HM
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
      # gparted       # moved to HM
      # home-manager  # optional; removed from system
      # kdePackages.kaccounts-integration
      # kdePackages.kaccounts-providers
      # kdePackages.karousel
      # kdePackages.kdepim-addons
      # kdePackages.kio-gdrive
      # kdePackages.krohnkite
      # kdePackages.signon-kwallet-extension
      # kdePackages.signond
      # lazygit       # moved to HM
      libgnome-keyring
      # micro         # moved to HM
      # nix-index     # moved to HM
      # nixfmt-rfc-style # moved to HM
      nixos-icons
      # nodejs_22     # moved to HM
      # nvd           # moved to HM
      packwiz
      pam_u2f
      # pavucontrol   # moved to HM
      # ripgrep       # moved to HM
      shellcheck
      sops
      swig
      # vim           # moved to HM
      # yaru-theme    # moved to HM
      # yubikey-manager     # moved to HM
      # yubioath-flutter    # moved to HM
    ];
  };
}
