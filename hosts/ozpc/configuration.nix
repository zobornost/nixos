{ config, lib, pkgs, ... }:

{
  boot = {
    initrd = {
      availableKernelModules = [ "vmd" "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "uas" "sd_mod" ];
      kernelModules = [ ];
    };
    extraModulePackages = [ ];
    kernelModules = [ "kvm-intel" "coretemp" "nct6775" ];
    kernelParams = [ "quiet" "splash" "boot.shell_on_fail" "nvidia.NVreg_PreserveVideoMemoryAllocations=1" "nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
    plymouth = {
      enable = true;
      theme = "breeze";
    };
  };
  console.keyMap = "uk";
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      age
      home-manager
      jdk
      jdk17
      linux-firmware
      lm_sensors
      pavucontrol
      plymouth
      tailscale
      vim
      wget
    ];
  };
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/1e0c6334-641f-4ba9-b7af-97b755d8443a";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" ];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/1e0c6334-641f-4ba9-b7af-97b755d8443a";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" ];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/1e0c6334-641f-4ba9-b7af-97b755d8443a";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/20C4-4E2C";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
  };
  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };
  networking = {
    networkmanager.enable = true;
    hostName = "ozpc";
    firewall.enable = false;
  };
  programs.bash.blesh.enable = true;
  system.stateVersion = "24.05"; # Don't change :)
  time.timeZone = "Europe/London";
  users = {
    users = {
      oz = {
        description = "Oz Browning";
        extraGroups = [ "networkmanager" "wheel" "mc" ];
        home = "/home/oz";
        isNormalUser = true;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK6iKmnjRIMjVGYgN5SG8gVIqGT8r6DXpszo8P1FZk6j"
        ];
        uid = 1000;
      };
    };
    groups = {
      mc = { gid = 10001; };
    };
  };
  zramSwap = {
    enable = true;
    memoryMax = 8192;
  };
}
