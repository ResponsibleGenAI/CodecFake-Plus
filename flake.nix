{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-25.05";
  };

  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import (inputs.nixpkgs) { inherit system; });
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            nodejs
            yarn
            nodePackages.typescript
            nodePackages.typescript-language-server
          ];
        };
      }
    );
}
