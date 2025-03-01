{ pkgs, inputs, ... }: let
  utils = inputs.nixCats.utils;
in {
  imports = [
    inputs.nixCats.homeModule
  ];

  config = {
    nixCats = {
      enable = true;
      nixpkgs_version = inputs.nixpkgs;
      addOverlays = [
        (utils.standardPluginOverlay inputs)
      ];
      packageNames = [ "myCat" ];

      luaPath = "${./.}";

      categoryDefinitions.replace = ({ ... }: {
        startupPlugins = {
          general = with pkgs.vimPlugins; [
            lz-n
            cyberdream-nvim
          ];
        };
      });

      packageDefinitions.replace = {
        myCat = {pkgs , ... }: {
          settings = {
            wrapRc = true;
            aliases = [ "vi" "vim" "nvim" ];
          };
          categories = {
            general = true;
          };
        };
      };
    };
  };

}
