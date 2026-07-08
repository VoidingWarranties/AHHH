No root access: `apk add` will not work. Get missing tools and language
toolchains from nixpkgs. Shell state does not persist between commands, so
always use the `-c` form rather than a bare `nix shell`:

    nix shell nixpkgs#nodejs nixpkgs#pnpm -c pnpm test

Find attribute names with `nix search nixpkgs <term>`. If the repo has a
flake.nix, use `nix develop -c <cmd>`.
