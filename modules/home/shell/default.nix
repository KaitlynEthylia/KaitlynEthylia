{ config, pkgs, ... }:

{
  imports = [
    ./lf
    ./hyfetch
  ];

  home.packages = with pkgs; [
    eza
  ];

  home.sessionVariables = {
    STARSHIP_CACHE = "${config.xdg.cacheHome}";
    BAT_CACHE_PATH = "${config.xdg.cacheHome}/bat";
    _ZL_DATA = "${config.xdg.dataHome}/zlua";
    GNUPGHOME = "${config.xdg.dataHome}/gnupg";
  };

  programs.fzf.enable = true;

  programs.zsh = import ./zsh.nix { inherit pkgs; };
  programs.starship = import ./starship.nix;

  programs.z-lua = {
    enable = true;
    enableZshIntegration = true;
    enableAliases = true;
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "catppuccin";
      style = [
        "numbers"
        "grid"
      ];
    };
    themes = {
      catppuccin = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
          hash = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
        };
        file = "Catppuccin-mocha.tmTheme";
      };
    };
  };
}
