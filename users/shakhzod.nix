{
  pkgs,
  lib,
  m,
  isLinux,
  isDarwin,
  ...
}:
let
  user = "shakhzod";
  name = "Shakhzod Kudratov";
  email = "shakhzodkudratov@gmail.com";
in
{
  config = lib.mkMerge [
    {
      nix.settings.trusted-users = [ user ];
      home-manager.users.${user} = {
        imports = m.home-manager.__all;

        programs.git = {
          settings.user = { inherit name email; };
          signing = {
            signByDefault = true;
            key = "5A1E1590CA201638ECCF834FD98C2DC59CFA95D4";
          };
        };
      };
    }

    (lib.optionalAttrs isDarwin {
      users = {
        knownUsers = [ user ];
        users.${user} = {
          uid = 501;
          name = user;
          home = "/Users/${user}";
          isHidden = false;
          shell = pkgs.zsh;
        };
      };
    })

    (lib.optionalAttrs isLinux {
      users.users.${user} = {
        isNormalUser = true;
        description = "Shakhzod";
        extraGroups = [
          "networkmanager"
          "wheel"
          "docker"
        ];
        hashedPassword = "$y$j9T$UKkcMoSeV8AvlKmvbhgvp0$b.qmZctDQ4gHsVpPZwTx6iQ4WO9K5eWn./ZW.7H5PzB";
        shell = lib.getExe pkgs.zsh;
      };
    })
  ];
}
