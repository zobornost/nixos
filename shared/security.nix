{
  config,
  lib,
  pkgs,
  ...
}:
{
  security = {
    pam = {
      services = {
        login = {
          enableGnomeKeyring = true;
          kwallet.enable = true;
          kwallet.forceRun = true;
          # rules = {
          #   auth = {
          #     pam_u2f = {
          #       enable = true;
          #       control = "sufficient";
          #       modulePath = "${pkgs.pam_u2f}/lib/security/pam_u2f.so";
          #       order = config.security.pam.services.sudo.rules.auth.unix.order - 10;
          #       settings = {
          #         cue = true;
          #         cue_prompt = "Touch!";
          #         pinverification = 1;
          #         userpresence = 1;
          #       };
          #     };
          #   };
          # };
        };
        sudo = {
          rules = {
            auth = {
              pam_u2f = {
                enable = true;
                control = "sufficient";
                modulePath = "${pkgs.pam_u2f}/lib/security/pam_u2f.so";
                order = config.security.pam.services.sudo.rules.auth.ssh_agent_auth.order - 10;
                settings = {
                  cue = true;
                  cue_prompt = "Touch!";
                  pinverification = 0;
                  userpresence = 1;
                };
              };
            };
          };
        };
      };
      sshAgentAuth.enable = true;
    };
    #polkit.enable = true;
    sudo.extraConfig = ''
      Defaults lecture = never
      Defaults pwfeedback
      Defaults timestamp_timeout=120
      Defaults env_keep+=SSH_AUTH_SOCK
    '';
  };
}
