{ nixpkgs }:

let
  pkgs = nixpkgs.legacyPackages.aarch64-darwin;
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    python311
  ];

  shellHook = ''
    echo "🐍 Base Python environment activated!"
    python --version
  '';
}
