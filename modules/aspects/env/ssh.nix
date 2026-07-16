{
  den.aspects.env.ssh = {
    nixos = {
      programs.ssh = {
        # startAgent = true;
        enableAskPassword = true;
      };
      environment.sessionVariables = {
        # Forces SSH to prioritize the graphical askpass prompt even inside a TTY/Terminal
        SSH_ASKPASS_REQUIRE = "prefer";
      };
    };
  };
}
