{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
    libsForQt5.qt5.qtwayland
    libsForQt5.qt5ct
    libva
  ];

  files = [
    ./conf
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    WLR_NO_HARDWARE_CURSORS = 1;
  };
}