{ pkgs, nv, nvConf, ... }:

{
  home.packages = with pkgs;[
    nil
    nixpkgs-fmt
  ];

  xdg.configFile.${nv "nix"} = nvConf {
    cmd = "nil";
    lsp = "nil_ls";
    settings = ''
      ['nil'] = {
        formatting = {
          command = { 'nixpkgs-fmt' }
        },
      }
    '';
  };
}

