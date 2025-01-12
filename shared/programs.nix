{ lib, ... }:
{
  programs = {
    chromium.enable = true;
    direnv.enable = true;
    firefox.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    niri.enable = true;
    virt-manager.enable = true;
    xwayland.enable = lib.mkForce true;
  };
}
