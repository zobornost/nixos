{
  networking = {
    defaultGateway4 = {
      address = "192.168.1.1";
      interface = "enp2s0";
    };
    hostname = "box";
    interfaces = {
      enp2s0.ipv4.addresses = [{
        address = "192.168.1.10";
        prefixLength = 24;
      }];
    };
    nameservers = ["192.168.1.1"];
  }
}