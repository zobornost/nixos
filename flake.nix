{
  description = "ozflake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
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
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, sops-nix, ... }@inputs:

    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
        overlays = [
          (import ./common/overlays/arcmenu.nix)
          (import ./common/overlays/displayswitcher.nix)
          (import ./common/overlays/mcman.nix)
        ];
      };
      unstable-pkgs = import nixpkgs-unstable {
        inherit system;
        config = { allowUnfree = true; };
        overlays = [ ];
      };
    in
    {
      nixosConfigurations = {
        ozpc = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs pkgs unstable-pkgs; };
          modules = [
            ./common/nix-settings.nix
            ./hosts/ozpc/configuration.nix
            ./hosts/ozpc/hardware.nix
            ./hosts/ozpc/secrets.nix
            ./hosts/ozpc/services.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.extraSpecialArgs = { inherit inputs pkgs unstable-pkgs; };
              home-manager.users.oz.imports = [
                ./users/oz/home.nix
                ./users/oz/packages.nix
                ./users/oz/programs.nix
                ./users/oz/desktops/gnome.nix
              ];
            }
          ];
        };
      };
    };
}
