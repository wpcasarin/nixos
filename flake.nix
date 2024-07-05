{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    gBar = {
      url = "github:scorpion-26/gBar";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, catppuccin, firefox-addons, home-manager, nix-vscode-extensions, gBar, ... }@inputs:
    let
      username = "welly";
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfreePredicate = pkg:
          builtins.elem (lib.getName pkg) [
            "datagrip"
            "steam"
            "steam-original"
            "steam-run"
          ];
      };
      vscode-extensions = nix-vscode-extensions.extensions.${system};
      firefox-extensions = firefox-addons.packages.${system};
    in
    {
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs username pkgs;
          };
          modules = [
            ./hosts/default/configuration.nix
            catppuccin.nixosModules.catppuccin
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit username firefox-extensions vscode-extensions pkgs; };
              home-manager.users.${username} = {
                imports = [
                  gBar.homeManagerModules.${system}.default
                  catppuccin.homeManagerModules.catppuccin
                  ./hosts/default/home.nix
                ];
              };
            }
          ];
        };
      };
    };
}
