{
  description = "ozflake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    secrets.url = "git+ssh://git@github.com/ozmodeuz/secrets.git?shallow=1&ref=main";
    secrets.flake = false;
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, sops-nix, ... }@inputs:

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
            { nixpkgs.config.allowUnfree = true; }
            ./host/ozpc/boot.nix
            ./host/ozpc/environment.nix
            ./host/ozpc/filesystems.nix
            ./host/ozpc/hardware.nix
            ./host/ozpc/localisation.nix
            ./host/ozpc/networking.nix
            ./host/ozpc/nix.nix
            ./host/ozpc/packages.nix
            ./host/ozpc/programs.nix
            ./host/ozpc/sops.nix
            ./host/ozpc/services.nix
            ./host/ozpc/users.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.extraSpecialArgs = {
                inherit inputs pkgs unstable-pkgs;
              };
              home-manager.users.oz.imports = [
                ./home/oz/home.nix
                ./home/oz/packages.nix
                ./home/oz/programs.nix
                ./home/oz/desktops/gnome.nix
              ];
            }
          ];
        };
      };
    };
}
