{ inputs, ... }: {
  den.aspects.editors.lem = {
    homeManager = { config, pkgs, ... }: {
      home.packages = with pkgs; [
        # lem-webview
        lem-ncurses
      ];

      home.file.".lem".source =
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/blazingly-fast/modules/aspects/editors/lem/_config";

      home.file."${config.home.homeDirectory}/.lem-source.lisp".text = ''
        (setf lem-lisp-mode/internal::*file-conversion-map*
              '(("${inputs.lem}/" . "./")))
      '';
    };
  };

  flake-file.inputs.lem = {
    url = "github:lem-project/lem";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}
