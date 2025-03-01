{ inputs, ... }:
{
  flake.nixosConfigurations =
    let
      mkHost =
        hostname:
        inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs.inputs = inputs;
          modules = [
	    ../modules/core
            ./${hostname}
          ];
        };
    in
    {
      framework = mkHost "framework";
    };
}
