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
        3131
        3389
        24800
      ];
      allowedUDPPorts = [
        3389
      ];
    };
  };
}
