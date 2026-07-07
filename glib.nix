inputs:
let
  m = {
    configurations = {
      common = loadDir ./configurations/common;
      nixos = loadDir ./configurations/nixos;
      darwin = loadDir ./configurations/darwin;
    };
    home-manager = loadDir ./home-manager;
    modules = loadDir ./modules;
    packages = loadDir ./packages;
    secrets = ./secrets/default.nix;
    users = loadDir ./users;
  };

  replaceContents =
    string: set:
    builtins.replaceStrings (map (k: "{${k}}") (builtins.attrNames set)) (map toString (
      builtins.attrValues set
    )) string;

  loadModules =
    src:
    inputs.haumea.lib.load {
      inherit src;
      loader = inputs.haumea.lib.loaders.path;
    };

  collectPaths =
    attrs:
    builtins.concatMap (
      v:
      if builtins.isAttrs v then
        collectPaths (builtins.attrValues v)
      else if builtins.isPath v then
        [ v ]
      else
        [ ]
    ) (if builtins.isList attrs then attrs else builtins.attrValues attrs);

  loadDir =
    src:
    let
      mods = loadModules src;
    in
    mods
    // {
      __all = collectPaths mods;
      __without = exclude: collectPaths (removeAttrs mods exclude);
    };

  supportedSystems = [
    "aarch64-darwin"
    "x86_64-linux"
  ];

  forEachSupportedSystem =
    f:
    inputs.nixpkgs.lib.genAttrs supportedSystems (
      system:
      f {
        inherit system;
        pkgs = import inputs.nixpkgs {
          inherit system;
        };
      }
    );
in
{
  inherit
    replaceContents
    loadModules
    loadDir
    supportedSystems
    forEachSupportedSystem
    m
    ;
}
