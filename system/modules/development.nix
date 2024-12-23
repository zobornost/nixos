{ pkgs, ... }:

{
  environment.systemPackages=  with pkgs; [ 
    blesh
    devenv
  ];
  programs.direnv.enable = true;
}