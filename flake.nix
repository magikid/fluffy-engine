{
  description = "Home Manager configuration of chrisj";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations = {
        "chrisj" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            # Specify your home configuration modules here, for example,
            # the path to your home.nix.
            modules = [
              ./home.nix
            ];

            # Optionally use extraSpecialArgs
            # to pass through arguments to home.nix
        };
        "chrisj@IRV-ITT-LAP-976" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            # Specify your home configuration modules here, for example,
            # the path to your home.nix.
            modules = [
              ./home.nix
              ./laptop.nix
            ];

            # Optionally use extraSpecialArgs
            # to pass through arguments to home.nix
        };
        "chrisj@Chriss-Mac-mini" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            # Specify your home configuration modules here, for example,
            # the path to your home.nix.
            modules = [
              ./home.nix
              ./laptop.nix
              ./mac-only.nix
            ];

            # Optionally use extraSpecialArgs
            # to pass through arguments to home.nix
        };
      };
    };
}
