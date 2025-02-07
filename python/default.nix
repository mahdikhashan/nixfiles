{ nixpkgs }:

with nixpkgs.legacyPackages.x86_64-darwin;

mkShell {
  buildInputs = [
    python311
  ];

  shellHook = ''
    echo "🐍 Base Python environment activated!"
    python --version
  '';
}
