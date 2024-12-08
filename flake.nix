{
  description = "oz's nix config";

  inputs =
    {
      nixpkgs.url = "nixpkgs/nixos-unstable";
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      secrets = {
        url = "git+ssh://git@github.com/ozmodeuz/sops.git?shallow=1&ref=main";
        flake = false;
      };
      sops-nix = {
        url = "github:Mic92/sops-nix";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      ags = {
        url = "github:ozmodeuz/ags";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      stylix = {
        url = "github:danth/stylix";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

  outputs = { self, nixpkgs, home-manager, sops-nix, ags, stylix, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
        overlays = [
          (import ./overlays/arcmenu.nix)
          (import ./overlays/displayswitcher.nix)
          (import ./overlays/mcman.nix)
          #niri.overlays.niri
        ];
      };
    in
    {
      nixosConfigurations = {
        ozpc = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs pkgs ags stylix; };
          modules = [
            ./system/hosts/ozpc.nix
            ./system/users/oz.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.extraSpecialArgs = { inherit inputs pkgs; };
              home-manager.users.oz.imports = [
                ./home/oz.nix
              ];
            }
          ];
        };
        book = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs pkgs ags stylix; };
          modules = [
            ./system/hosts/book.nix
            ./system/users/oz.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.extraSpecialArgs = { inherit inputs pkgs; };
              home-manager.users.oz.imports = [
                ./home/oz.nix
              ];
            }
          ];
        };
      };
    };
}
