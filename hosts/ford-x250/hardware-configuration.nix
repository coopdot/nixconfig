# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices."disk".device = "/dev/disk/by-uuid/c6db7bdd-2020-4a77-b4fb-d087bd6f4907";

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/be3adf2a-bb84-433d-bee7-cb221a2879d8";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/1E8D-9DCD";
    fsType = "vfat";
    options = [ "noauto" "x-systemd.automount" ];
  };

  swapDevices = [ ];

  nix.maxJobs = lib.mkDefault 4;
}
