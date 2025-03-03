return {
    {
        "nvim-lspconfig",
        on_require = { "lspconfig" },
        lsp = function(plugin)
            require("lspconfig")[plugin.name].setup(vim.tbl_extend("force", {
                capabilities = vim.tbl_deep_extend(
                    "force",
                    {},
                    vim.lsp.protocol.make_client_capabilities(),
                    require("cmp_nvim_lsp").default_capabilities()
                )
            }, plugin.lsp or {}))
        end
    },
    {
        "lua_ls",
        lsp = { filetypes = { "lua" } }
    }
}
