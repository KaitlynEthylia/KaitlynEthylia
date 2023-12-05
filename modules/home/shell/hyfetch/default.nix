{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyfetch
    playerctl
  ];
  files = [ ./conf ];

  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "genderfae";
      mode = "rgb";
      color_align = {
        mode = "horizontal";
      };
    };
  };

}