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
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      agenix,
      lix-module,
      ...
    }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
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

        ozpc = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/ozpc
            ./shared
            agenix.nixosModules.default
            lix-module.nixosModules.default
          ];
        };
	
	slab = lib.nixosSystem {
	  inherit system;
	  specialArgs = { inherit inputs; };
	  modules = [
	    ./hosts/slab
	    ./shared
	    agenix.nixosModules.default
	    lix-module.nixosModules.default
	  ];
	};	

        think = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/think
            ./shared
            agenix.nixosModules.default
          ];
        };
      };
    };
}
