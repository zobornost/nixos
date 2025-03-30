{
  inputs = {
    agenix.url = "github:ryantm/agenix";
    lix = {
      url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
      flake = false;
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix";
    };
    nixpkgs.url = "nixpkgs/nixos-unstable";
    secrets = {
      url = "git+ssh://git@github.com/ozmodeuz/sops.git?shallow=1&ref=main";
      flake = false;
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, agenix, lix, lix-module, nixpkgs, secrets, sops-nix, stylix, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          overlays = [
            (import ./overlays/mcman.nix)
          ];
        };
      };
    in
    {
      nixosConfigurations = {
        book = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/book
            ./shared
            agenix.nixosModules.default
          ];
        };
        box = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/box
          ];
        };
        ozpc = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/ozpc
            ./shared
            agenix.nixosModules.default
          ];
        };
        think = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/think
            ./shared
          ];
        };
      };
    };
}
