{ ... }:
let
  disco = builtins.getFlake "github:KaitlynEthylia/disco/...?dir=nix";
in
{
  imports = [ disco.nixosModules.default ];
  services.disco = {
    enable = true;
  };
}