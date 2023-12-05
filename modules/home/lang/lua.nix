{ config, pkgs, nv, ... }:
let
  addon-dir = "${config.xdg.dataHome}/luals/addons";
  addons = {
    luafilesystem = pkgs.fetchFromGitHub {
      owner = "LuaCATS";
      repo = "luafilesystem";
      rev = "9b5cfc15be744c829c66519cb11e49669ae7e39b";
      hash = "sha256-j18RCaExXTUSpoCb7eROlSQo0yd7wxj8uFo0UkS8ORI=";
    };
    luasocket = pkgs.fetchFromGitHub {
      owner = "LuaCATS";
      repo = "luasocket";
      rev = "9a26f89986735762e806df2d85cef44a28cc70cc";
      hash = "sha256-orZ8CW7C7SzOBveZ+2UIYDlNAADva0Qj5v+tqgKL5UU=";
    };
    argparse = pkgs.fetchFromGitHub {
      owner = "goldenstein64";
      repo = "argparse-definitions";
      rev = "de6679ca499973a1ea73bae794d82facd0999f9f";
      hash = "sha256-jfMlA8ofxoeb+mHbKM+2Hkl0k/6xMohP60hp04vBqrQ=";
    };
  };
in
{
  home.packages = with pkgs; [
    lua-language-server
    (lua54Packages.lua.withPackages
      (ps: map (e: ps.${e})
        (builtins.attrNames addons)))
  ];
  xdg.dataFile = builtins.listToAttrs (map (e: {
    name = "luals/addons/${e}";
    value = { source = addons.${e}; };
  }) (builtins.attrNames addons));

  xdg.configFile.${nv "lua"} = {
    text = ''
      return {
        {
          'folke/neodev.nvim',
          config = function()
            if os.execute('which lua-language-server >/dev/null 2>&1') == 0 then
              local status, neodev = pcall(require, 'neodev')
              if status then neodev.setup {} end
              require('lspconfig').lua_ls.setup {
                settings = { Lua = {
                  workspace = {
                    checkThirdParty = false,
                    library = {
                      ${builtins.concatStringsSep "\n                "
                      (map (e: ''"${addon-dir}/${e}/library",'') (builtins.attrNames addons))}
                    },
                  },
                }}
              }
            end
          end,
        },
        {
          'KaitlynEthylia/Evalua',
          cmd = 'Evalua',
          keys = {{
            "<C-x><C-e>",
            "<CMD>Evalua<CR>",
            desc = "Evaluate lua expression under cursor"
          }},
        },
      }
    '';
  };
}