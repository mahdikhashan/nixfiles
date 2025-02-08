{ nixpkgs }:

let pkgs = nixpkgs.legacyPackages.aarch64-darwin;
in pkgs.mkShell {
  buildInputs = with pkgs; [ python311 ];

  shellHook = ''
    export CC=/opt/homebrew/opt/llvm/bin/clang
    export CXX=/opt/homebrew/opt/llvm/bin/clang++
    export CFLAGS="-I/opt/homebrew/opt/llvm/include"
    export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"

    echo `env is set up! let's install atheris...`
    pip install atheris

    python -c "import atheris; print('Atheris installed successfully!')"
  '';
}
