local function faster_get_path(name)
  local path = vim.tbl_get(package.loaded, "nixCats", "pawsible", "allPlugins", "opt", name)
  if path then
    vim.cmd.packadd(name)
    return path
  end
  return nil -- nil will make it default to normal behavior
end

---packadd + after/plugin
---@type fun(names: string[]|string)
local load_w_after_plugin = require('lzextras').make_load_with_afters({ "plugin" }, faster_get_path)

return {
    {
        "cmp-nvim-lsp",
        on_plugin = { "nvim-cmp" },
        dep_of = { "nvim-lspconfig" },
        load = load_w_after_plugin,
    },
    {
        "cmp-buffer",
        on_plugin = { "nvim-cmp" },
        load = load_w_after_plugin,
    },
    {
        "cmp-path",
        on_plugin = { "nvim-cmp" },
        load = load_w_after_plugin,
    },
    {
        "nvim-cmp",
        event = { "DeferredUIEnter" },
        on_require = { "cmp" },
        dep_of = { "codeium.nvim" },
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
                    { name = 'codeium' },
                }
            })
        end
    }
}
