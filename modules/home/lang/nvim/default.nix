{ pkgs, ... }:

{
  home.packages = with pkgs;[
    neovim
    clang
    ripgrep
  ];
  files = [ ./conf ];
}