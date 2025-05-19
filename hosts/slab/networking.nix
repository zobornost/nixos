{ ... }:
{
  networking = {
    hostName = "slab";
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        24800
      ];
    };
  };
}
