# This is not a nixos module :)
let
  users = {
    oz = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILqDLl9df4605OTUYgOZpMbwVeBEC2dBbdYSPEOkBECt";
  };
  hosts = {
    ozpc = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIClbsxWp3A0655uz3NAy2z+WdxEdoEu84wa3orW0Ql2B";
  };

in
{
  "cloudflared.json".publicKeys = (map (key: builtins.getAttr key hosts) (builtins.attrNames hosts)) ++ (map (key: builtins.getAttr key users) (builtins.attrNames users));
}
