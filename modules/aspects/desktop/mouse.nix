{
  # https://github.com/MithicSpirit/nixos/blob/main/host/logitech/default.nix
  den.aspects.desktop.mouse.nixos =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    let
      logiops = pkgs.logiops;
    in
    {
      # TODO: fix scrolling with bolt
      # - hiresscroll.hires: true
      # - remove quirks and hwdb if possible
      # see https://gitlab.freedesktop.org/libinput/libinput/-/issues/1021

      # TODO: wait for proper support to be merged (#287399, #167388)

      environment.systemPackages = [ logiops ];

      systemd = {
        packages = [ logiops ];
        services.logid = {
          wantedBy = [ "multi-user.target" ];
          preStart = "${lib.getExe' pkgs.kmod "modprobe"} hid_logitech_hidpp";
          restartTriggers = [ config.environment.etc."logid.cfg".source ];
        };
      };

      # https://loguiops.vercel.app/
      environment.etc."logid.cfg".text = ''
        devices: ({
          name: "MX Master 3S";

          smartshift: { on: true; threshold: 30; torque: 50; };
          hiresscroll: { hires: false; invert: false; target: false; };

          thumbwheel: { divert: false; invert: false; };

          dpi: 1000;

          buttons: (
            { cid: 0xc4; action = { type: "ToggleSmartShift"; }; },
            { cid: 0xc3; action = { type: "Gestures"; gestures: (
              { direction: "None"; mode: "OnRelease"; action = { type: "Keypress"; keys: ["KEY_LEFTMETA"]; }; },
              { direction: "Up"; mode: "OnRelease"; action = { type: "Keypress"; keys: ["KEY_UP"]; }; },
              { direction: "Down"; mode: "OnRelease"; action = { type: "Keypress"; keys: ["KEY_DOWN"]; }; },
              { direction: "Left"; mode: "OnRelease"; action = { type: "Keypress"; keys: ["KEY_LEFTCTRL", "KEY_LEFTALT", "KEY_RIGHT"]; }; },
              { direction: "Right"; mode: "OnRelease"; action = { type: "Keypress"; keys: ["KEY_LEFTCTRL", "KEY_LEFTALT", "KEY_LEFT"]; }; }
            ); }; },
            { cid: 0x56; action = { type: "Keypress"; keys: ["KEY_FORWARD"]; }; },
            { cid: 0x53; action = { type: "Keypress"; keys: ["KEY_BACK"]; }; }
          );
        });
      '';

      environment.etc."libinput/local-overrides.quirks".text = ''
        [Logitech MX Master 3S]
        MatchVendor=0x046D
        MatchProduct=0xB034
        ModelInvertHorizontalScrolling=1
        ModelLogitechMXMaster3=1
        AttrEventCode=-REL_WHEEL_HI_RES;-REL_HWHEEL_HI_RES;

        [Logitech MX Master 3S USB Receiver]
        MatchVendor=0x046D
        MatchProduct=0xC548
        ModelInvertHorizontalScrolling=1
        ModelLogitechMXMaster3=1
        AttrEventCode=+REL_WHEEL_HI_RES;+REL_HWHEEL_HI_RES;
      '';
    };
}
