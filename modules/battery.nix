{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.libnotify ];
  services.udev.extraRules = ''
    SUBSYSTEM=="power_supply", \
    ENV{POWER_SUPPLY_STATUS}=="Discharging", \
    RUN+="${pkgs.libnotify}/bin/notify-send 'Battery Warning' 'Unplugged... ENV{POWER_SUPPLY_CAPACITY}'"
    SUBSYSTEM=="power_supply", \
    ENV{POWER_SUPPLY_STATUS}=="Charging", \
    RUN+="${pkgs.su} kaitlyn -c \"DBUS_SESSION_BUS_ADDRESS='unix:path=/run/user/$UID/bus' ${pkgs.libnotify}/bin/notify-send 'Battery Warning' Charging...\""
  '';

  systemd.timers.battery = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "5m";
      Unit = "battery.service";
    };
  };

  systemd.services.battery = {
    script = ''
      export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$UID/bus"
      if [ -d /sys/class/power_supply/BAT1 -a $(cat /sys/class/power_supply/BAT1/capacity) -lt 10 -a $(cat /sys/class/power_supply/BAT1/status) = "Discharging" ]; then
        ${pkgs.libnotify}/bin/notify-send -u critical "Battery Warning" "Low Battery. $(cat /sys/class/power_supply/BAT1/capacity)%"
      fi
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "kaitlyn";
    };
  };
}