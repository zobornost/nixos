{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      timeout = 0;
    };
    plymouth = {
      enable = true;
      theme = "breeze";
    };
  };
}
