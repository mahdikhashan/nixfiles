my Nixfiles
---

### Setup
```bash
git clone https://github.com/mahdikhashan/nixfiles
cd ./nixfiles
export NIX_CONFIG="experimental-features = nix-command flakes"
```

```bash
pip install pre-commit
pre-commit install

nix-env -iA nixpkgs.nixfmt
```

then before each commit:

```bash
pre-commit run --all-files
```

### Run
```bash
nix develop .
```

### Examples 

#### Python

```nix
{
  description = "Extended ML environment based on main repo's python-ml";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    main-repo.url = "github:mahdikhashan/nixfiles";
  };
  outputs = { self, nixpkgs, main-repo }: {
    devShells.aarch64-darwin.default = 
      let
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        baseMLEnv = main-repo.devShells.aarch64-darwin.python-ml;
      in
      baseMLEnv.overrideAttrs (oldAttrs: {
        buildInputs = oldAttrs.buildInputs ++ (with pkgs.python311Packages; [
          kubeflow-katib
          pytorch
        ]);
        shellHook = oldAttrs.shellHook + ''
          echo "🧠 ML environment activated!"
        '';
      });
  };
}

```