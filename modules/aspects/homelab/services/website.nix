{
  den.aspects.homelab.services.website.nixos = { inputs', ... }: {
    services.nginx.virtualHosts."aes.uz" = {
      addSSL = true;
      enableACME = true;
      root = "${inputs'.shakhzod-me.packages.default}/public";
    };
  };

  flake-file.inputs.shakhzod-me = {
    url = "git+https://codeberg.org/aeshakhzod/shakhzod.me?shallow=1";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}
