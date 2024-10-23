{ config, lib, pkgs, ... }:

{
  boot = {
    initrd = {
      availableKernelModules = [ "vmd" "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "uas" "sd_mod" ];
      kernelModules = [ ];
    };
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 5;
    };
    kernelModules = [ "kvm-intel" "coretemp" "nct6775" ];
    kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" "nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" ];
    extraModulePackages = [ ];
  };

  console.keyMap = "uk";

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

  hardware = {

    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    enableRedistributableFirmware = true;

    fancontrol = {
      enable = true;
      config = ''
        INTERVAL=10
        DEVPATH=hwmon2=devices/platform/coretemp.0 hwmon7=devices/platform/nct6775.656
        DEVNAME=hwmon2=coretemp hwmon7=nct6798
        FCTEMPS=hwmon7/pwm1=hwmon7/temp1_input hwmon7/pwm2=hwmon2/temp1_input hwmon7/pwm6=hwmon2/temp1_input
        FCFANS=hwmon7/pwm1=hwmon7/fan1_input hwmon7/pwm2=hwmon7/fan2_input hwmon7/pwm6=hwmon7/fan6_input
        MINTEMP=hwmon7/pwm1=40 hwmon7/pwm2=40 hwmon6/pwm1=40
        MAXTEMP=hwmon7/pwm1=70 hwmon7/pwm2=70 hwmon6/pwm1=40
        MINSTART=hwmon7/pwm1=150 hwmon7/pwm2=150 hwmon7/pwm6=150
        MINSTOP=hwmon7/pwm1=0 hwmon7/pwm2=0 hwmon7/pwm6=190
        MINPWM=hwmon7/pwm1=0 hwmon7/pwm2=0 hwmon7/pwm6=190
      '';
    };

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    opengl.enable = true;

    pulseaudio.enable = false;

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

  swapDevices = [ ];

  time.timeZone = "Europe/London";

}
