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
        #DEVPATH=/sys/devices/platform/coretemp.0/hwmon/hwmon[[:print:]]*=devices/platform/coretemp.0 /sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*=devices/platform/nct6775.656
        #DEVNAME=/sys/devices/platform/coretemp.0/hwmon/hwmon[[:print:]]*=coretemp /sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*=nct6798
        FCTEMPS=/sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm1=/sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/temp1_input /sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm2=/sys/devices/platform/coretemp.0/hwmon/hwmon[[:print:]]*/temp1_input /sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm6=/sys/devices/platform/coretemp.0/hwmon/hwmon[[:print:]]*/temp1_input
        FCFANS=/sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm1=/sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/fan1_input /sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm2=/sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/fan2_input /sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm6=/sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/fan6_input
        MINTEMP=/sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm1=40 /sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm2=40 hwmon6/pwm1=40
        MAXTEMP=/sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm1=70 /sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm2=70 hwmon6/pwm1=40
        MINSTART=/sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm1=150 /sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm2=150 /sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm6=150
        MINSTOP=/sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm1=0 /sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm2=0 /sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm6=190
        MINPWM=/sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm1=0 /sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm2=0 /sys/devices/platform/nct6775.656/hwmon/hwmon[[:print:]]*/pwm6=190
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
