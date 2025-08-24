{ lib, ... }:
{
  programs = {
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    nix-ld.enable = true;
    virt-manager.enable = true;
    xwayland.enable = false;
  };
}
