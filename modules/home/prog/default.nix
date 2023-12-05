{ pkgs, ... }:
let
  jail = pkg: pkgs.writeShellScriptBin pkg ''
    jail ${pkgs.${pkg}}/bin/${pkg} $@
  '';
in
{
  imports = [
    ./qutebrowser
    ./wofi.nix
  ];

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    wezterm
    zathura

    bluez
    grim
    slurp

    asciinema

    htop

    imhex

    (writeShellScriptBin "jail" ''
      export HOME="$XDG_DATA_HOME/$(basename $1)"
      $@
    '')
    (jail "discord")
    (jail "spotify")
  ];

  xdg.mimeApps.enable = true;

  services.udiskie.enable = true;

  files = [ ./conf ];
}