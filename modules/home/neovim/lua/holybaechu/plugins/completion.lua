return {
    {
        "nvim-cmp",
        event = { "DeferredUIEnter" },
        on_require = { "cmp" },
        after = function (_)
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
        
            cmp.setup({
                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                },
                
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                }
            })
        end
    },
    {
        "cmp-nvim-lsp",
        on_plugin = { "nvim-cmp" },
        dep_of = { "nvim-lspconfig" }
    },
    {
        "cmp-buffer",
        on_plugin = { "nvim-cmp" }
    },
    {
        "cmp-path",
        on_plugin = { "nvim-cmp" }
    },
}
