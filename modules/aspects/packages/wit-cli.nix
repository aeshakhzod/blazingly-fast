{
  den.aspects.packages.wit-cli = {
    packages = { pkgs, ... }: {
      kanata-lsp = pkgs.rustPlatform.buildRustPackage (finalAttrs: {
        name = "wit-cli";
        version = "0.2.0";

        src = pkgs.fetchFromGitHub {
          owner = "Michael-F-Bryan";
          repo = "wit-lsp";
          rev = "c90addb21d37f2bd62a9474adca1dd8f6320d437";
          sha256 = "sha256-Gy/6C1ckNo1Xv3xDHcz+zqnnJBIkkjEcegLY5RZy9D4=";
        };

        cargoHash = "sha256-sb/uPdz14z0jjKf3tTrqpGK/FE4xbTq0Q2qtlEBOqRU=";

        cargoFlags = [
          "-p"
          "wit-cli"
        ];
        doCheck = false;
      });
    };
  };
}
