{
  den.aspects.editors.emacs = {
    homeManager = {pkgs,...}:{
      home.packages = [
        pkgs.emacs-gtk
      ];
    };
  };
}
