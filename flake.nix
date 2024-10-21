{
  description = "ozflake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:

    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
        overlays = [
          (import ./overlays/arcmenu.nix)
          (import ./overlays/displayswitcher.nix)
          (import ./overlays/deskflow.nix)
          (import ./overlays/libportal.nix)
          (import ./overlays/mcman.nix)
        ];

      };
    in
    {
      nixosConfigurations = {
        ozpc = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs pkgs; };
          modules = [
            { nixpkgs.config.allowUnfree = true; }
            ./hosts/ozpc/environment.nix
            ./hosts/ozpc/hardware.nix
            ./hosts/ozpc/minecraft.nix
            ./hosts/ozpc/users.nix
            ./hosts/ozpc/services.nix
            ./hosts/ozpc/system.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.extraSpecialArgs = {
                inherit inputs pkgs;
              };
              home-manager.users.oz.imports = [
                ./oz/home.nix
                ./oz/gnome.nix
              ];
            }
          ];
        };
      };
    };
}
