{ pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    settings = { };
    style = builtins.readFile
      (pkgs.fetchFromGitHub {
        owner = "quantumfate";
        repo = "wofi";
        rev = "6c37e0f65b9af45ebe680e3e0f5131f452747c6f";
        hash = "sha256-zQGiF/8WZ15ZlQVVgxuQq4qatinxMx2Y6Xl5Zcuhp7Y=";
      } + /src/mocha/style.css) + ''
        window {
          border-radius: 1em;
          border: 1px solid @pink;
        }

        #entry:selected #text {
          color: @yellow;
        }
      '';
  };
}
