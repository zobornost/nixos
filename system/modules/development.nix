{ pkgs, ... }:

{
  environment.systemPackages=  with pkgs; [ 
    blesh
    devenv
    nushell
    starship
  ];
  programs.direnv.enable = true;
}