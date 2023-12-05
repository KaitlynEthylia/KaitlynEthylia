{ config, lib, pkgs, ... }:
with lib;
{
  config.xdg.userDirs = {
    enable = true;
    desktop = "${config.xdg.dataHome}/applications";
    documents = "${config.home.homeDirectory}/Documents";
    download = "${config.home.homeDirectory}/Files";
    music = "${config.home.homeDirectory}/Media";
    pictures = "${config.home.homeDirectory}/Media";
    videos = "${config.home.homeDirectory}/Media";
    templates = null;
    publicShare = null;
    createDirectories = true;
  };

  options.files = mkOption {
    type = types.listOf types.path;
    default = [ ];
  };

  config.home.file =
    let
      path = pkgs.symlinkJoin {
        name = "home";
        paths = config.files;
      };
    in
    builtins.mapAttrs
      (k: _: {
        source = "${path}/${k}";
        recursive = true;
      })
      (builtins.readDir path);
}