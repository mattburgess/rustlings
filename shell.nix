let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    rustc
    cargo
    rustfmt
    rustlings
    gcc
  ];

  shellHook = ''
    export TMP="/tmp";
    export TMPDIR="$TMP";
    export PATH="$PATH:$HOME/.cargo/bin";
    export RUST_SRC_PATH="${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  '';
}
