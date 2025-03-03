{ inputs, ... }: let
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

            categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkNvimPlugin, ... }@packageDef: {
                startupPlugins = with pkgs.vimPlugins; {
                    general = [
                        lze
                        lzextras
                        cyberdream-nvim
                    ];

                    treesitter = [
                        nvim-treesitter.withAllGrammars
                    ];
                };

                optionalPlugins = {
                    general = with pkgs.vimPlugins; {
                        always = [
                            nvim-lspconfig
                        ];

                        cmp = [
                            nvim-cmp
                            cmp-nvim-lsp
                            cmp-buffer
                            cmp-path
                        ];

                        discord = [
                            cord-nvim
                        ];
                    };
                };

                lspsAndRuntimeDeps = with pkgs; {
                    general = [
                        lua-language-server
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
                        treesitter = true;
                    };
                };
            };
        };
    };
}
