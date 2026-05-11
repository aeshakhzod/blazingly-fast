{ pkgs, ... }:
let
  gsd-sdk-source = pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
    name = "gsd-sdk-source";
    version = "1.41.0";

    src = pkgs.fetchFromGitHub {
      owner = "gsd-build";
      repo = "get-shit-done";
      rev = "v${finalAttrs.version}";
      sha256 = "sha256-akne0soS/n5Kff/W4CXBpRfu+VzoQHYMH0w5NOZNag8=";
    };

    buildPhase = ''
      mkdir -p $out
      cp -r $src/sdk/. $out
    '';
  });

  gsd-sdk = pkgs.buildNpmPackage {
    pname = "gsd-sdk";
    version = gsd-sdk-source.version;

    src = gsd-sdk-source;

    npmDepsHash = "sha256-J1q7AnLMYRoKFgijBopRwaRU5gHhzXp64UDR8feGd8Y=";
  };
in
{
  home.packages = [ gsd-sdk ];
}
