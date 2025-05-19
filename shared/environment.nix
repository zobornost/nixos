{ pkgs, inputs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      adwaita-qt
      inputs.agenix.packages.${pkgs.system}.default
      bc
      btop
      coreutils
      curl
      fd
      gparted
      home-manager
      kdePackages.karousel
      kdePackages.krohnkite
      lazygit
      libgnome-keyring
      micro
      nix-index
      nixfmt-rfc-style
      nixos-icons
      nvd
      packwiz
      pam_u2f
      pavucontrol
      pika-backup
      ripgrep
      shellcheck
      sops
      xwayland-satellite
      yaru-theme
      yubikey-manager
      yubioath-flutter
    ];
  };
}
