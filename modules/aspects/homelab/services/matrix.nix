{
  den.aspects.homelab.services.matrix.nixos = {
    services.nginx.virtualHosts."aes.uz" = {
      locations."/.well-known/matrix/server".extraConfig = ''
        return 200 '{"m.server": "matrix.aes.uz:443"}';
        default_type application/json;
        add_header Access-Control-Allow-Origin *;
      '';

      locations."/.well-known/matrix/client".extraConfig = ''
        return 200 '{"m.homeserver": {"base_url": "https://matrix.aes.uz"}}';
        default_type application/json;
        add_header Access-Control-Allow-Origin *;
      '';
    };
  };
}
