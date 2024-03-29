let
  # Pratically, the only needed dependency is the plutus repository.
  sources = import ./sources.nix { inherit pkgs; };

  # We're going to get everything from the main plutus repository. This ensures
  # we're using the same version of multiple dependencies such as nipxkgs,
  # haskell-nix, cabal-install, compiler-nix-name, etc.
  plutus = import sources.plutus-apps {};
  pkgs = plutus.pkgs;

  haskell-nix = pkgs.haskell-nix;

  cardano-datum-keeper = import ./pkgs {
    inherit pkgs haskell-nix sources plutus ;
  };

in
{
  inherit pkgs cardano-datum-keeper;
}
