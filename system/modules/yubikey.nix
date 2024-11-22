{ pkgs, ... }:
{
  environment.systemPackages = (with pkgs; [
    #yubioath-flutter
    #yubikey-manager
    pam_u2f
  ]);
  services.pcscd.enable = true;
  services.udev.packages = [ pkgs.yubikey-personalization ];
  services.yubikey-agent.enable = true;

  security.pam = {
    sshAgentAuth.enable = true;
    u2f = {
      enable = true;
      cue = true;
      #debug = true;
    };
    services = {
      login = {
        u2fAuth = true;
        enableGnomeKeyring = true;
      };
      sudo = {
        u2fAuth = true;
        sshAgentAuth = true;
      };
    };
  };
}
