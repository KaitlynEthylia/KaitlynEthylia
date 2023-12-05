{ pkgs }:

{
  enable = true;
  enableCompletion = true;
  dotDir = ".config/zsh";
  defaultKeymap = "emacs";
  cdpath = [ "~" ];
  history.path = "$XDG_DATA_HOME/zsh/.zsh_history";
  syntaxHighlighting.enable = true;
  plugins = [
    {
      name = "zsh-nix-shell";
      file = "nix-shell.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "chisui";
        repo = "zsh-nix-shell";
        rev = "v0.7.0";
        sha256 = "149zh2rm59blr2q458a5irkfh82y3dwdich60s9670kl3cl5h2m1";
      };
    }
    {
      name = "zsh-autocomplete";
      src = pkgs.fetchFromGitHub {
        owner = "marlonrichert";
        repo = "zsh-autocomplete";
        rev = "6d059a3634c4880e8c9bb30ae565465601fb5bd2";
        sha256 = "0NW0TI//qFpUA2Hdx6NaYdQIIUpRSd0Y4NhwBbdssCs=";
      };
    }
  ];
  shellAliases = {
    ls = "eza -la --group-directories-first";
    lg = "ls --git";
    tree = "ls --tree";

    v = "nvim";

    rb = "reboot";
    sd = "shutdown now";

    "d!" = "doas $(fc -lrn | head -1)";
  };
  initExtra = ''
    set globdots

    bindkey ^S fzf-cd-widget
    bindkey "''${key[Up]}" up-line-or-search
  '';
  profileExtra = ''
    function nixrb {
      dir=$(pwd)
      cd ~/KaitlynEthylia
      git add .
      if [ -f $TEMPEDIT_LIST ]; then
        while read line; do
          real=''${line::-7}
          rm $real
          mv $line $real
        done < $TEMPEDIT_LIST
        rm $TEMPEDIT_LIST
      fi
      doas nixos-rebuild switch --flake ~/KaitlynEthylia/#''${1:=nix}
      cd $dir
      unset dir
    }
  '';
}