{ den, ...}: {
    den.hosts.aarch64-darwin.ark = {
        users.shakhzod = { };
    };

    den.aspects.ark = {
        includes = [
            den.aspects.profiles.workhorse
            den.aspects.profiles.gaming

            den.aspects.desktop.darwin

            den.aspects.packages.darwin-packages
            den.aspects.packages.global-packages
        ];
    };
}
