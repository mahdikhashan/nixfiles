{ nixpkgs }:

let pkgs = nixpkgs.legacyPackages.aarch64-darwin;
in pkgs.mkShell {
  buildInputs = with pkgs; [
    python311
    (python311.withPackages
      (ps: with ps; [ numpy matplotlib pandas scipy jupyter ]))
  ];

  shellHook = ''
    echo "🐍 Python ML environment with NumPy, Matplotlib, Pandas, SciPy, and Jupyter!"
    python --version
  '';
}
