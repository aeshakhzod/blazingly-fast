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
          "kvm"
        ];
        openssh.authorizedKeys.keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDGU7pRKuTWfzRy8+Hb6vKz4+FNKfDzKA0HCLw+cxDCVXqsCBJPZXTfUZV1fxfBhfgn2IBOw99DbnmRaYeSm48ZB7V0xwqgM8Ucy2m4MJytvPbyjoEcfV434J3Xm+1R5P4tn5BvFPPseBBFrahsKXvakT07hiEJe6S28KuC3zvMN/cORfGuViGuZRslRuT3ozd8pJtDcWSod5f3ek59qwYrC8KS8ljR7kBJWgdJvAOyifuDd9POh4TcbXOykcDqYKlZlWLnFoZcCE3QUcOAELyBffEtMFRd/4N+Mgwdf6Y4YjspHNDfnSKRgNQVH/zYBnIV9jt/umdAyN9Kby0v/EGv9HI0Kb5t2/eCLPCDSyb4AQChb25xMTkGXcXcqIrLCWl6oR1/QfqUfuC8KJRp5Nj9saoi9pxtzAqU4/EXXL1EwYHaICK4LOYW+2la05Pv8wzX4ne9Xpoo0jJNCHioYacvJC1noWrDSmRU6oEhQqHKGBQU0drC/pYLmZhjAhi0JQE="
        ];
      };
    };
  };
}
