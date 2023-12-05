{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    pulseaudio
    pamixer
    playerctl
    python3
    jq
    socat
    eww-wayland
  ];

  files = [
    ./conf
  ];

  services.playerctld.enable = true;
}
