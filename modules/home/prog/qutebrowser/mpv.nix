{ pkgs, ... }:

{
  home.packages = [
    pkgs.yt-dlp
  ];

  programs.mpv = {
    enable = true;
    scriptOpts = {
      ytdl_hook = {
        ytdl_path = "${pkgs.yt-dlp}/bin/yt-dlp";
      };
    };
  };
}
