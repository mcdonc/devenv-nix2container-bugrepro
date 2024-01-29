{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [ ];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";

  enterShell = ''
    hello
  '';

  devcontainer = {
    enable = true;
    settings = {
      updateContentCommand =
        "cachix use devenv;cachix use apex;cachix use nixpkgs-python;devenv ci";
      image = "ghcr.io/mcdonc/devenv:nonroot-containers";
      customizations.vscode.extensions = [
        "ms-python.python"
        "ms-python.vscode-pylance"
        "visualstudioexptteam.vscodeintellicode"
        "jnoortheen.nix-ide"
      ];
    };
  };

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
