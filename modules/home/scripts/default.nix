{ pkgs, ... }:

{
  files = [ ./conf ];

  home.file."Scripts/wofi-bluetooth.sh" = {
    source = pkgs.fetchFromGitHub {
      owner = "arpn";
      repo = "wofi-bluetooth";
      rev = "722dc554c7a9515bca1cc646d226f65883f9343f";
      hash = "sha256-g8Zg8TCqHFDIjHU/0lJ9qLdEFHeWvohzgyBPHvG7Sng=";
    } + /wofi-bluetooth;
    executable = true;
  };
}