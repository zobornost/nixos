{ config, inputs, ... }:

let
  sopsPath = builtins.toString inputs.sops;
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

    defaultSopsFile = "${sopsPath}/secrets/cloudflared.json";
    defaultSopsFormat = "json";

    secrets = {
      AccountTag = { };
      TunnelSecret = { };
      TunnelID = { };
    };

    templates."cloudflared.json".content = ''
      {"AccountTag":"${config.sops.placeholder.AccountTag}","TunnelSecret":"${config.sops.placeholder.TunnelSecret}","TunnelID":"${config.sops.placeholder.TunnelID}"}
    '';
    templates."cloudflared.json".owner = "cloudflared";
  };
}
