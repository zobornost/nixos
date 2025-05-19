{ ... }:
{
  networking = {
    defaultGateway = "192.168.0.1";
    hostName = "ozpc";
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        24800
      ];
    };
    interfaces = {
      wlp0s20f3 = {
        ipv4 = {
          addresses = [
            {
              address = "192.168.0.12";
              prefixLength = 24;
            }
          ];
        };
        useDHCP = false;
      };
    };
    nameservers = [ "192.168.0.1" ];
  };
}
