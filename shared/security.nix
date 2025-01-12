{
  security = {
    pam = {
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
    polkit.enable = true;
    sudo.extraConfig = ''
      Defaults lecture = never
      Defaults pwfeedback
      Defaults timestamp_timeout=120
      Defaults env_keep+=SSH_AUTH_SOCK
    '';
  };
}

