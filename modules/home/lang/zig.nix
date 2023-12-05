{ nv, nvConf, ... }:

{
  xdg.configFile.${nv "zig"} = nvConf {
    setup = "vim.g.zig_fmt_autosave = 0";
    cmd = "zls";
  };
}