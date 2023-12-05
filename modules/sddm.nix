{ pkgs, ... }:
let
  catppuccin-sddm = { pkgs }: pkgs.stdenv.mkDerivation {
    name = "catppuccin-sddm";
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "sddm";
      rev = "7fc67d1027cdb7f4d833c5d23a8c34a0029b0661";
      sha256 = "SjYwyUvvx/ageqVH5MmYmHNRKNvvnF3DYMJ/f2/L+Go=";
    };
    installPhase = ''
      mkdir -p $out
      cp -R ./src/catppuccin-mocha/* $out/
      sed -e '2cFont="CaskaydiaCove Nerd Font Mono"' -e '3cFontSize=16' -i $out/theme.conf
    '';
  };
in
{
  fonts.packages = [ (pkgs.nerdfonts.override { fonts = [ "CascadiaCode" ]; }) ];

  programs.hyprland.enable = true;

  services.xserver.enable = true;
  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "${catppuccin-sddm { inherit pkgs; }}";
  };
}