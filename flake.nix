{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { 
        system = system;
      };
      in {

        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.python311
            pkgs.python311Packages.pip
          ];

          shellHook = "source .env";
        };
      });
}

