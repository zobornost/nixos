{
  description = "ozflake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:

    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
        overlays = [
          (import ./overlay/arcmenu.nix)
          (import ./overlay/displayswitcher.nix)
          (import ./overlay/mcman.nix)
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
            ./host/ozpc/environment.nix
            ./host/ozpc/hardware.nix
            ./host/ozpc/minecraft.nix
            ./host/ozpc/nix.nix
            ./host/ozpc/users.nix
            ./host/ozpc/services.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.extraSpecialArgs = {
                inherit inputs pkgs;
              };
              home-manager.users.oz.imports = [
                ./home/oz/home.nix
                ./home/oz/gnome.nix
              ];
            }
          ];
        };
      };
    };
}
