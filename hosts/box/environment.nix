{ pkgs, ... }:
{
  environment = {
    sessionVariables = {};
    systemPackages = [
      pkgs.curl
      pkgs.git
      pkgs.micro
    ];
  };
}