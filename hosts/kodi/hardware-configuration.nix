# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/dca1c92d-cedb-4bc2-810c-43320a1025a7";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3C6A-C5A8";
    fsType = "vfat";
    options = [ "noauto" "x-systemd.automount" ];
  };

  fileSystems."/mnt/hactar" = {
    device = "10.3.0.2:/media/files";
    fsType = "nfs4";
    noCheck = true;
    options = [ "ro" "noauto" "x-systemd.automount" ];
  };

  # Ensure that we have network before trying to do NFS
  systemd.automounts = [{
    after = [ "network-online.target" ];
    wants = [ "network-online.target" "network-pre.target" ];
    wantedBy = [ "display-manager.service" ];
    where = "/mnt/hactar";
  }];

  swapDevices = [ ];

  nix.maxJobs = lib.mkDefault 8;
  powerManagement.cpuFreqGovernor = "ondemand";
}
