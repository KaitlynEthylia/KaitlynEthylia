{ config, nv, nvConf, ... }:

{
  home.sessionVariables.PYTHONSTARTUP = "${config.xdg.configHome}/pythonrc";

  xdg.configFile."pythonrc".text = ''
    import readline
    readline.write_history_file = lambda *args: None
  '';

  xdg.configFile.${nv "python"} = nvConf {
    cmd = "pylsp";
  };
}