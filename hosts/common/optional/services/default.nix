{ ... }:

{
  imports = [
    ./cloudflared.nix
    ./openssh.nix
    ./tailscale.nix
  ];
}
