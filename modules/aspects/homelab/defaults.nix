{
  den.aspects.homelab.defaults.nixos = { lib, ... }: {
    networking.firewall.enable = true;
    networking.firewall.allowedTCPPorts = [
      80
      443
    ];
    services.avahi.enable = lib.mkForce false;
    services.nginx.enable = true;
    security.acme = {
      acceptTerms = true;
      defaults.email = "shakhzodkudratov@gmail.com";
    };
  };
}
