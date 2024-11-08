{ config, lib, ... }:

{
  imports = [
    ./cloudflared.nix
    ./openssh.nix
    ./tailscale.nix
  ];
}
