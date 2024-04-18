{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-23.11";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix/release-23.11";
  };

  outputs = inputs @ {self, ...}: let
    lib = inputs.nixpkgs.lib;
    system = "x86_64-linux";
    # pkgs = nixpkgs.legacyPackages.${system};
    # pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    pkgs = import inputs.nixpkgs {
      system = system;
      config = {
        allowUnfree = true;
      };
    };
    pkgs-unstable = import inputs.nixpkgs-unstable {
      system = system;
      config = {
        allowUnfree = true;
      };
    };
    home-manager = inputs.home-manager;
    nixvim = inputs.nixvim;
    stylix = inputs.stylix;
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          ./system
        ];

        specialArgs = {
          inherit pkgs-unstable;
        };
      };
    };
    homeConfigurations = {
      adrian = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./user/home.nix

          nixvim.homeManagerModules.nixvim
          stylix.homeManagerModules.stylix
        ];

        extraSpecialArgs = {
          inherit pkgs-unstable;
        };
      };
    };
  };
}
