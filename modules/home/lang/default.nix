{ pkgs, config, ... }:
let
  nv = lang: "nvim/lua/plugins/${lang}.lua";
  nvConf = args: {
    text = ''
      if os.execute 'which ${args.cmd} >/dev/null 2>&1' == 0 then
        ${args.setup or ""}
        require('lspconfig').${args.lsp or args.cmd}.setup {
          ${args.settings or ""}
        }
      end

      return {${args.plugins or ""}}
    '';
  };
  lang = path: import path { inherit nv nvConf pkgs config; };
in
{
  imports = [ ./nvim ]
    ++ map lang [
    ./nix.nix
    ./python.nix
    ./c.nix
    ./rust.nix
    ./lua.nix
    ./zig.nix
  ];
}