{
  den.aspects.packages.json-tool-lsp = {
    packages = { pkgs, ... }: {
      json-tool-lsp = pkgs.rustPlatform.buildRustPackage (finalAttrs: {
        name = "json-tool-lsp";
        version = "0.0.3";

        src = pkgs.fetchFromGitHub {
          owner = "xgfone";
          repo = "zed-json-tool";
          rev = "v${finalAttrs.version}";
          sha256 = "sha256-qc8LMco2bN5t/IOwAn4cIVegtm1DrjdJwpCmJDo9d3g=";
        };

        cargoHash = "sha256-jayjEG0zFStqExt5CL86FN2KWST2p3knU14i/1n1BX4=";
        sourceRoot = "${finalAttrs.src.name}/server";
      });
    };
  };
}
