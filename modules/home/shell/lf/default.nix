{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lf
    poppler_utils
    unzip
    file
    jq
  ];
  files = [ ./conf ];

  programs.zsh.shellAliases.lfcd = ''cd $(lf -print-last-dir)'';
}