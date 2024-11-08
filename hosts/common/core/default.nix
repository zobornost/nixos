{ config, lib, pkgs, ... }:

{

  imports = [
    ./locale.nix
    ./nix.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  programs.bash.blesh.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  security.polkit.enable = true;

  security.sudo.extraConfig = ''
    Defaults lecture = never
    Defaults pwfeedback
    Defaults timestamp_timeout=120
    Defaults env_keep+=SSH_AUTH_SOCK
  '';

}
