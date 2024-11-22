{ config, inputs, ... }:

let
  secretsPath = builtins.toString inputs.secrets;
in
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  sops = {
    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };

    defaultSopsFile = "${secretsPath}/secrets.yaml";

    secrets = {
      "cloudflared/accountTag" = { };
      "cloudflared/tunnelSecret" = { };
      "cloudflared/tunnelID" = { };
    };

    templates."cloudflared.json" = {
      content = ''
        {
          "AccountTag":"${config.sops.placeholder."cloudflared/accountTag"}",
          "TunnelSecret":"${config.sops.placeholder."cloudflared/tunnelSecret"}",
          "TunnelID":"${config.sops.placeholder."cloudflared/tunnelID"}"
        }
      '';
      owner = "cloudflared";
    };
  };
}
