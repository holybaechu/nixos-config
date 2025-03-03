{
    description = "My NixOS configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
        flake-parts = {
            url = "github:hercules-ci/flake-parts";
            inputs.nixpkgs-lib.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        rust-overlay = {
            url = "github:oxalica/rust-overlay";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # Neovim
        nixCats.url = "github:BirdeeHub/nixCats-nvim";
        codeium.url = "github:Exafunction/codeium.nvim";
    };

    outputs =
    {
        self,
        flake-parts,
        nixpkgs,
        ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
        systems = nixpkgs.lib.systems.flakeExposed;

        imports = [ ./hosts ];
    };
}
