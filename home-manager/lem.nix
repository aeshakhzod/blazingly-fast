{
  inputs,
  config,
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
    # lem-webview
    lem-ncurses
  ];

  my-dotfiles.".lem" = "lem";

  home.file."${config.home.homeDirectory}/.lem-source.lisp".text = ''
    (setf lem-lisp-mode/internal::*file-conversion-map*
          '(("${inputs.lem}/" . "./")))
  '';
}
