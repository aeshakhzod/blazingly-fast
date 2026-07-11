{
  den.aspects.zed-editor.homeManager.programs.zed-editor = {
    mutableUserKeymaps = true;
    userKeymaps = [
      {
        context = "(VimControl && !menu) || (!Editor && !Terminal)";
        bindings = {
          alt-left = "vim::GoToPreviousTab";
          alt-right = "vim::GoToTab";
          ctrl-j = "terminal_panel::ToggleFocus";
          ctrl-w = "pane::CloseActiveItem";
        };
      }
      {
        context = "Terminal";
        bindings = {
          alt-left = "pane::ActivatePreviousItem";
          alt-right = "pane::ActivateNextItem";
          ctrl-n = "workspace::NewTerminal";
          ctrl-w = "pane::CloseActiveItem";
        };
      }
      {
        bindings = {
          alt-shift-right = "window::ShowNextWindowTab";
          alt-shift-left = "window::ShowPreviousWindowTab";
        };
      }
      {
        context = "Terminal";
        unbind = {
          cmd-k = "terminal::Clear";
        };
      }
      {
        context = "Editor && vim_mode == insert";
        bindings = {
          ctrl-s = [
            "workspace::SendKeystrokes"
            "escape ctrl-s"
          ];
        };
      }
    ];
  };
}
