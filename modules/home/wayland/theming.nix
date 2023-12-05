{ pkgs, config, ... }:

{
  home.pointerCursor = {
    name = "Catppuccin-Mocha-Pink-Cursors";
    package = pkgs.catppuccin-cursors.mochaPink;
    gtk.enable = true;
  };

  home.file.".icons/default/index.theme".enable = false;
  home.file.".icons/${config.home.pointerCursor.name}".enable = false;

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Pink";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "pink" ];
      };
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };
}