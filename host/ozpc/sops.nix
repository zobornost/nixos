{ config, pkgs, lib, secrets, ... }:

let
  secretsPath = builtins.toString secrets;
in
{
  imports = [ <sops-nix/modules/sops> ];

  sops = {
    defaultSopsFile = "${secretsPath}/secrets.yaml";
    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };

    secrets = {
      cloudflared = { };
    };
  };
}
