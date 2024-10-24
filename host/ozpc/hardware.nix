{ config, lib, pkgs, ... }:

{
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
}
