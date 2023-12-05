{ lib, ... }:

{
  services.openssh = {
    enable = true;
    authorizedKeysFiles = lib.mkForce [
      "/etc/ssh/authorized_keys.d/%u"
      "%h/.local/share/ssh/authorized_keys"
    ];
  };

  environment.etc."ssh/ssh_config".text = lib.mkForce
    ''
      Host *
        GlobalKnownHostsFile /etc/ssh/ssh_known_hosts
        AddressFamily inet
        ForwardX11 no
        IdentityFile ~/.local/share/ssh/id_rsa
        IdentityFile ~/.local/share/ssh/id_dsa
        IdentityFile ~/.local/share/ssh/id_ecdsa
        IdentityFile ~/.local/share/ssh/id_ed25519
        UserKnownHostsFile ~/.local/share/ssh/known_hosts.d/%k
    '';
}
