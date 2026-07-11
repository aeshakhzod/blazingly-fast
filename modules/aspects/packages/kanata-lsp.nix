{
  den.aspects.packages.kanata-lsp = {
    packages = { pkgs, ... }: {
      kanata-lsp = pkgs.rustPlatform.buildRustPackage (finalAttrs: {
        name = "kanata-lsp";
        version = "0.1.3";
        src = pkgs.fetchFromGitHub {
          owner = "willpuckett";
          repo = "zed-kanata";
          rev = "v${finalAttrs.version}";
          hash = "sha256-agqDS85MMTCZDKVhif08bRJ65E/gnK1PzUBai4IBBz0=";
        };
        cargoHash = "sha256-dXbO/cXIeQrhzd2jTzSzk6p+/HNJmyj0HBc2IFihlqE=";
        sourceRoot = "${finalAttrs.src.name}/kanata-lsp";
      });
    };
  };
}
