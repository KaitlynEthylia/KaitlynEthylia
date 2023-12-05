{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
    roboto
    roboto-mono
    raleway
    open-sans
    noto-fonts
  ];
}