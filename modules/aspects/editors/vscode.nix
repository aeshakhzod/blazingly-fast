{
  den.aspects.editors.vscode = {
    homeManager = { pkgs, ... }: {
      programs.vscode = {
        enable = true;
        package = pkgs.vscode;

        profiles.default = {
          extensions =
            let
              # fromNixpkgs = with pkgs.vscode-extensions; [ ];
              fromNixpkgs = [ ];
              fromVscodeMarketplace = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
                {
                  name = "wit-idl";
                  publisher = "bytecodealliance";
                  version = "0.3.33";
                  sha256 = "sha256-+zmf8wODLAI3zSHtzBFB4xTNPJkkvvOUPtkPxfLo7rI=";
                }
              ];
            in
            fromNixpkgs ++ fromVscodeMarketplace;
        };
      };
    };

    darwin.homebrew.casks = [ "visual-studio-code" ];
  };
}
