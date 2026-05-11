{
  inputs,
  config,
  ...
}:
{

  # home.packages = with pkgs; [
  #   # lem-webview
  #   lem-ncurses
  # ];

  home.file."${config.home.homeDirectory}/.lem".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/blazingly-fast/lem";

  home.file."${config.home.homeDirectory}/.lem-source.lisp".text = ''
    (setf lem-lisp-mode/internal::*file-conversion-map*
          '(("${inputs.lem}/" . "./")))
  '';
}
