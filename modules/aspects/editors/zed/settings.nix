{
  den.aspects.zed-editor.homeManager.programs.zed-editor = {
    mutableUserSettings = true;
    userSettings = {
      code_lens = "on";
      inlay_hints = {
        show_background = false;
        enabled = false;
      };
      base_keymap = "VSCode";
      edit_predictions = {
        allow_data_collection = "no";
      };
      agent = {
        sidebar_side = "left";
        favorite_models = [
        ];
        model_parameters = [
        ];
      };
      auto_update = false;
      tab_bar = {
        show_pinned_tabs_in_separate_row = false;
      };
      cli_default_open_behavior = "new_window";
      disable_ai = true;
      use_system_window_tabs = true;
      tabs = {
        close_position = "right";
        file_icons = true;
        git_status = true;
      };
      title_bar = {
        show_branch_status_icon = true;
      };
      terminal = {
        bell = "system";
      };
      project_panel = {
        hide_hidden = false;
        hide_root = true;
        git_status_indicator = false;
        diagnostic_badges = false;
        bold_folder_labels = false;
        entry_spacing = "standard";
        dock = "right";
      };
      autosave = "off";
      which_key = {
        enabled = true;
      };
      vim_mode = true;
      vim = {
        toggle_relative_line_numbers = false;
      };
      buffer_line_height = "comfortable";
      buffer_font_size = 14;
      buffer_font_family = "JetBrainsMono Nerd Font Mono";
      buffer_font_features = {
        calt = true;
      };
      icon_theme = {
        mode = "dark";
        light = "Zed (Default)";
        dark = "Zed (Default)";
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      theme = {
        mode = "dark";
        light = "Gruvbox Light Hard";
        dark = "Gruvbox Dark Hard";
      };
      load_direnv = "direct";
      languages = {
        Nix = {
          language_servers = [
            "!nil"
            "nixd"
          ];
        };
        TypeScript = {
          inlay_hints = {
            enabled = false;
          };
        };
        TSX = {
          inlay_hints = {
            enabled = false;
          };
        };
      };
      lsp = {
        typescript-language-server = {
          initialization_options = {
            preferences = {
              includeInlayVariableTypeHints = true;
              includeInlayParameterNameHints = "all";
              includeInlayParameterNameHintsWhenArgumentMatchesName = true;
              includeInlayFunctionParameterTypeHints = true;
              includeInlayVariableTypeHintsWhenTypeMatchesName = false;
            };
          };
        };
        rust-analyzer = {
          binary = {
            ignore_system_version = true;
          };
        };
      };
    };
  };
}
