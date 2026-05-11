{
  inputs,
  glib,
  m,
  isDarwin,
  isLinux,
  pkgs-unstable,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit
        inputs
        glib
        m
        isDarwin
        isLinux
        pkgs-unstable
        ;
    };
    sharedModules = [
      inputs.sops-nix.homeManagerModules.sops
      m.secrets
    ];
  };
}
