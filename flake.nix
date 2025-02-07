{
  description = "my nix setup";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }: {
    devShells.aarch64-darwin = {
      default = import ./python { inherit nixpkgs; };
      python-ml = import ./python/ml { inherit nixpkgs; };
    };
  };
}
