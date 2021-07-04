local lspconfig = require('lspconfig')
-- require'lspconfig'.pyls.setup{}
-- require'lspconfig'.hls.setup{}

-- Note that via the `manager` from `server_per_root_dir_manager`, we'll get a separate instance
-- of `clangd` as we switch between files, or even projects, inside of the right container
--
-- Finally, we've formed the "basename of a project" to pass to our `cclangd` script, which will
-- then look for a matching container, or run `clangd` normally if no matching container is found
--    /path/to/my/project
-- would look for a container named `project`, and `docker exec` a `clangd` instance there, etc.
lspconfig.clangd.setup{
    cmd = { 'cclangd', 'builder' },
    init_options = {
        clangdFileStatus = true
    },
    on_attach = function(client)
    end,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = false,
    update_in_insert = false,
  }
)

vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = 'right',
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = false,
    keymaps = {
        close = "<Esc>",
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
}

vim.api.nvim_set_keymap("n", "<space>o", ":SymbolsOutline<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '[g', ':lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ']g', ':lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true})
