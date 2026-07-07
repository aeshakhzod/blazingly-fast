let
  hasFlake = builtins.pathExists ../flake.nix;
  flake = if hasFlake then builtins.getFlake (toString ../.) else null;
  hasInputs = flake != null && flake ? inputs.nixpkgs;

  nixpkgs = if hasInputs then import flake.inputs.nixpkgs { } else import <nixpkgs> { };

  # --- Helpers ---
  first = set: if set == { } then null else set.${builtins.head (builtins.attrNames set)};

  safeHmOptions =
    opts: if opts ? home-manager.users then opts.home-manager.users.type.getSubOptions [ ] else null;

  # --- Auto-discovery from flake outputs ---
  nixosOpts = builtins.mapAttrs (_: cfg: cfg.options) (flake.nixosConfigurations or { });

  darwinOpts = builtins.mapAttrs (_: cfg: cfg.options) (flake.darwinConfigurations or { });

  hmOpts =
    let
      fromNixos = builtins.mapAttrs (_: safeHmOptions) nixosOpts;
      fromDarwin = builtins.mapAttrs (_: safeHmOptions) darwinOpts;
      merged = fromNixos // fromDarwin;
    in
    builtins.removeAttrs (builtins.listToAttrs (
      builtins.filter (x: x.value != null) (
        builtins.map (name: {
          inherit name;
          value = merged.${name};
        }) (builtins.attrNames merged)
      )
    )) [ ];

  # --- Resolved options: explicit outputs.nixd wins, else auto-discover ---
  options = {
    nixos = first nixosOpts;
    nix-darwin = first darwinOpts;
    home-manager = first hmOpts;
  };
in
{
  inherit nixpkgs options flake;
}
