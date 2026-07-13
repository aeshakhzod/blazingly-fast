{
  den.aspects.env.ssh = {
    homeManager.services.ssh-agent.enable = true;
    nixos.environment.sessionVariables = {
      # Forces SSH to prioritize the graphical askpass prompt even inside a TTY/Terminal
      SSH_ASKPASS_REQUIRE = "prefer";
    };
  };
}
