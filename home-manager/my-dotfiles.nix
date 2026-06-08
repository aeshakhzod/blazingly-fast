{ lib, config, ... }:
{
  options.my-dotfiles = lib.mkOption {
    type = lib.types.attrsOf lib.types.str;
    default = { };
  };

  config.home.file = lib.mapAttrs (
    _: relative:
    let
      path' = "${config.blazingly-fast}/dotfiles/${relative}";
      source =
        if builtins.pathExists path' then
          path'
        else
          builtins.throw "Error: Required source file '${toString path'}' does not exist.";
    in
    {
      source = config.lib.file.mkOutOfStoreSymlink source;
    }
  ) config.my-dotfiles;
}
