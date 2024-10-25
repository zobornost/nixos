{ config, inputs, ... }:

{
  home = {
    username = "oz";
    homeDirectory = "/home/oz";
    sessionVariables = {
      EDITOR = "micro";
    };
    stateVersion = "24.05";
  };
}
