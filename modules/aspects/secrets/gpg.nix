{
  den.aspects.secrets.gpg = { host, ... }: {
    os = {
      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };

    homeManager =
      { pkgs, lib, ... }:
      lib.mkMerge [
        # (lib.mkOptional (host == "darwin") {
        #   home.file.".gnupg/gpg-agent.conf" = {
        #     text = ''
        #       pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
        #       allow-preset-passphrase
        #       default-cache-ttl 600
        #       max-cache-ttl 7200
        #     '';
        #   };
        # })
      ];
  };
}
