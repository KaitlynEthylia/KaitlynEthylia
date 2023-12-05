{ nv, nvConf, ... }:

{
  xdg.configFile.${nv "c"} = nvConf {
    cmd = "clangd";
  };

  home.file."Projects/C/.clang-format".text = ''
    PointerAlignment: Left
  '';

  home.file."Projects/C/shell.nix".text = ''
    { pkgs ? import <nixpkgs> { } }:

    pkgs.mkShell {
      packages = with pkgs; [
        clang
        clang-tools
        llvmPackages_16.bintools
        gnumake
      ];
    }
  '';
}