{ inputs, den, ... }: {
  den.aspects.qoravoy.includes = [ (den.batteries.tty-autologin "shakhzod") ];

  perSystem = { pkgs, ... }: {
    packages.vm = pkgs.writeShellApplication {
      name = "vm";
      text =
        let
          host = inputs.self.nixosConfigurations.qoravoy.config;
        in
        ''
          ${host.system.build.vm}/bin/run-${host.networking.hostName}-vm "$@"
        '';
    };
  };
}
