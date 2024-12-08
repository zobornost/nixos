{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.cargo pkgs.rustc ];
}
