{ self, ... }: {
  den.aspects.work.kerio = { host, ... }: {
    homeManager =
      { lib, ... }:
      break {
        home.packages = lib.mkMerge [
          (lib.mkIf (host == "linux") self.packages.kerio-control-vpnclient)
        ];
      };

    packages = { pkgs, ... }: {
      kerio-control-vpnclient = pkgs.stdenv.mkDerivation (finalAttrs: {
        pname = "kerio-control-vpnclient";
        version = "9.4.5-8629";

        src = pkgs.fetchurl {
          url = "https://cdn.kerio.com/dwn/control/control-${finalAttrs.version}/${finalAttrs.pname}-${finalAttrs.version}-linux-amd64.deb";
          hash = "sha256-rU5tinj1FN2z8u7w7GEV9oa21v+eeo8OQXXWnyZw9ys=";
        };

        nativeBuildInputs = with pkgs; [
          dpkg
          glibc
          patchelf
          autoPatchelfHook
        ];

        unpackPhase = ''
          # Unpack .deb
          mkdir -p $out $out/bin
          dpkg -x $src $out

          # Follow nix way
          cp -r $out/usr/lib/* $out/lib/
          cp -r $out/usr/sbin/* $out/bin/

          # Deleting garbages
          rm -rf $out/usr
          rm -rf $out/etc
          rm -rf $out/lib/systemd
        '';

        buildInputs = with pkgs; [
          libgcc
          stdenv.cc.cc.lib
          curl
          procps
          dialog
          util-linux
          libxcrypt-legacy
          openssl
        ];

        installPhase = ''
          echo $unpackPhase
          runHook preInstall
          runHook postInstall
        '';
      });
    };
  };
}
