{
    description = "my nix setup";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        darwin = {
            url = "github:LnL7/nix-darwin";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { self, nixpkgs }: {
        devShells.x86_64-darwin = {
            python = import ./python { inherit nixpkgs; };
            python-ml = import ./python/ml { inherit nixpkgs; };
        };
    };
}