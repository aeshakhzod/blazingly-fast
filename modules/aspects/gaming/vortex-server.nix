{
  den.aspects.gaming.vortex-server ={
    darwin = { pkgs, ... }: let
      workdir = "/opt/vortex-server";
      vortex-server = pkgs.stdenv.mkDerivation {
        name = "vortex-server-src";
        version = "1.1";

        src = builtins.fetchurl {
          url = "https://vrtx.su/download/server";
          sha256 = "sha256:1rg5mqsnn9g2r8xy1sjad6skjjsg5j75lbp9m9i4lvzqq2dhah7g";
        };

        nativeBuildInputs = with pkgs; [
          unzip
        ];

        unpackPhase = ''
          mkdir -p $out
          unzip $src -d $out
        '';
      };
    in {
      launchd.daemons.vortex-server = {
        path = with pkgs; [
          coreutils
          bash
          openjdk17
        ];
        script = ''
        if [ ! -d "${workdir}" ]; then
            mkdir -p ${workdir}
            cp -r ${vortex-server}/. ${workdir}
        fi

        cd ${workdir}
        chmod +x ./run.sh
        ./run.sh
        '';
        serviceConfig = {
          KeepAlive = true;
          RunAtLoad = true;
          StandardOutPath = "/var/log/vortex-server.log";
          StandardErrorPath = "/var/log/vortex-server.log";
        };
      };
    };
  };
}
