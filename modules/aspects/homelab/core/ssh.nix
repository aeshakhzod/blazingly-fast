{
  den.aspects.homelab.core.ssh.nixos = { lib, ... }: {
    networking.firewall.allowedTCPPorts = [
      16667
    ];

    services.openssh = {
      enable = true;
      allowSFTP = false;
      ports = [ 16667 ];

      settings = {
        LogLevel = "VERBOSE";
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PubkeyAuthentication = true;
        MaxAuthTries = 3;
        LoginGraceTime = 30;
        DisableForwarding = true;
        MaxSessions = 2;
        ClientAliveInterval = 300;
        ClientAliveCountMax = 2;
        TCPKeepAlive = false;

        KexAlgorithms = lib.mkForce [
          "mlkem768x25519-sha256"
          "sntrup761x25519-sha512"
          "sntrup761x25519-sha512@openssh.com"
        ];

        Ciphers = lib.mkForce [
          "chacha20-poly1305@openssh.com"
          "aes256-gcm@openssh.com"
          "aes128-gcm@openssh.com"
        ];

        Macs = lib.mkForce [
          "hmac-sha2-512-etm@openssh.com"
          "hmac-sha2-256-etm@openssh.com"
          "umac-128-etm@openssh.com"
        ];
      };
    };
  };
}
