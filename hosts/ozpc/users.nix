{ config, pkgs, ... }:
{
  users = {
    users = {
      oz = {
        description = "Oz Browning";
        extraGroups = [ "networkmanager" "wheel" "mc" ];
        home = "/home/oz";
        isNormalUser = true;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK6iKmnjRIMjVGYgN5SG8gVIqGT8r6DXpszo8P1FZk6j"
        ];
        uid = 1000;
      };
    };
    groups = {
      mc = { gid = 10001; };
    };
  };
}
