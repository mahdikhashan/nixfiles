{ nixpkgs }:

with nixpkgs.legacyPackages.x86_64-darwin;

mkShell {
  buildInputs = [
    python311
    python311Packages.numpy
    python311Packages.matplotlib
    python311Packages.pandas
    python311Packages.scipy
    python311Packages.jupyter
  ];

  shellHook = ''
    echo "🐍 Python ML environment with NumPy, Matplotlib, Pandas, SciPy, and Jupyter!"
    python --version
  '';
}
