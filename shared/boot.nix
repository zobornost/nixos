{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      # grub = {
      #   enable = true;
      #   efiSupport = true;
      #   device = "nodev";
      # };
      timeout = 0;
    };
    plymouth = {
      enable = true;
      theme = "breeze";
    };
  };
}
