{ den, ... }:
let
  user = "shakhzod";
  name = "Shakhzod Kudratov";
  email = "shakhzodkudratov@gmail.com";
in
{
  den.aspects.shakhzod = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "zsh")
    ];

    homeManager = {
      programs.git = {
        settings.user = { inherit name email; };
        signing = {
          signByDefault = true;
          key = "5A1E1590CA201638ECCF834FD98C2DC59CFA95D4";
        };
      };
    };

    os = {
      nix.settings.trusted-users = [ user ];
    };

    darwin = {
      users = {
        knownUsers = [ user ];
        users.${user} = {
          uid = 501;
          name = user;
          home = "/Users/${user}";
          isHidden = false;
        };
      };
    };

    nixos = {
      users.users.${user} = {
        isNormalUser = true;
        description = "Shakhzod";
        extraGroups = [
          "docker"
        ];
        hashedPassword = "$y$j9T$UKkcMoSeV8AvlKmvbhgvp0$b.qmZctDQ4gHsVpPZwTx6iQ4WO9K5eWn./ZW.7H5PzB";
      };
    };
  };
}
