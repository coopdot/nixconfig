{ ... }:

{
  environment.etc."machine-id".source = "/persistent/etc/machine-id";

  environment.etc."ssh/ssh_host_rsa_key".source = "/persistent/etc/ssh/ssh_host_rsa_key";
  environment.etc."ssh/ssh_host_rsa_key.pub".source = "/persistent/etc/ssh/ssh_host_rsa_key.pub";
  environment.etc."ssh/ssh_host_ed25519_key".source = "/persistent/etc/ssh/ssh_host_ed25519_key";
  environment.etc."ssh/ssh_host_ed25519_key.pub".source = "/persistent/etc/ssh/ssh_host_ed25519_key.pub";

  # Avoid the need to have a moved config and help muscle memory of location
  fileSystems."/etc/nixos" = {
    device = "/persistent/etc/nixos";
    options = [ "bind" "noauto" "x-systemd.automount" ];
  };

  # Persistence of NetworkManager network connections.
  fileSystems."/etc/NetworkManager/system-connections/" = {
    device = "/persistent/etc/NetworkManager/system-connections/";
    options = [ "bind" "noauto" "x-systemd.automount" ];
  };

  # Persistence of my home directory
  fileSystems."/home/etu" = {
    device = "/persistent/home/etu";
    options = [ "bind" "noauto" "x-systemd.automount" ];
  };

  # Persistence of roots dotfiles between boots
  fileSystems."/root" = {
    device = "/persistent/home/root";
    options = [ "bind" "noauto" "x-systemd.automount" ];
  };
}
