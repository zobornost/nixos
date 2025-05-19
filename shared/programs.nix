{ lib, ... }:
{
  programs = {
    _1password.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = ["oz"];
    };
    direnv.enable = true;
    firefox.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    niri.enable = true;
    nix-ld.enable = true;
    virt-manager.enable = true;
    xwayland.enable = lib.mkForce true;
  };
}
