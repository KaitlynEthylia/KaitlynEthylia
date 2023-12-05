{ pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./theming.nix
    ./hypr
    ./eww
  ];

  home.packages = with pkgs; [
    bemenu
    wl-clipboard
  ];

  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = "#89B4FA";
        seperator_colour = "frame";
      };
      urgency_low = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
      };
      urgency_normal = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
      };
      urgency_critical = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
        frame_color = "#FAB387";
      };
    };
  };

  home.sessionVariables = {
    NIXOS_OXONE_WL = "1";
  };
}