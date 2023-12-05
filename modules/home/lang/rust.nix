{ pkgs, nv, nvConf, ... }:

{
  programs.bat.themes.rose-pine = {
    src = pkgs.fetchFromGitHub {
      owner = "rose-pine";
      repo = "sublime-text";
      rev = "79dfbdac3bf42788e4ba6cf5ad8564aa13f2f7d5";
      hash = "sha256-zQ/H7W6ToRy6J0vVtHDqV6rbyUdG1EpGb07HsV+2R24=";
    };
    file = "rose-pine.tmTheme";
  };

  xdg.configFile.${nv "rust"} = nvConf {
    cmd = "rust-analyzer";
    lsp = "rust_analyzer";
    plugins = ''
      {
        'rose-pine/neovim',
        name = 'rose-pine',
      }
    '';
  };
  xdg.configFile."nvim/ftplugin/rust/colours.lua".text = "Transify 'rose-pine'";

  home.sessionVariables.CARGO_HOME = "$XDG_DATA_HOME/cargo";
}