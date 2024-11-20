{ config, lib, ... }:

let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
  pubKeys = lib.filesystem.listFilesRecursive ./keys;
in
{
  users = {
    users = {
      oz = {
        home = "/home/oz";
        isNormalUser = true;
        description = "Oz Browning";
        extraGroups =
          [ "wheel" ]
          ++ ifTheyExist [
            "mc"
            "networkmanager"
          ];
        openssh.authorizedKeys.keys = lib.lists.forEach pubKeys (key: builtins.readFile key)
          ++ [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK6iKmnjRIMjVGYgN5SG8gVIqGT8r6DXpszo8P1FZk6j"
        ];
      };
    };
  };
}
