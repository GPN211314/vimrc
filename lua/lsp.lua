local lspconfig = require('lspconfig')
-- require'lspconfig'.hls.setup{}

local attach_setting = function(client)
    require'aerial'.on_attach(client)
    vim.api.nvim_buf_set_keymap(0, 'n', '<space>l', ':AerialToggle!<CR>', {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, 'n', ']m', ':AerialNext<CR>', {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '[m', ':AerialPrev<CR>', {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, 'n', 'K', ':lua vim.lsp.diagnostic.show_line_diagnostics({focusable = false})<CR>', {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '[g', ':lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, 'n', ']g', ':lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(0, 'n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', {noremap = true, silent = true})
end
lspconfig.pylsp.setup { on_attach = attach_setting }
lspconfig.ccls.setup { on_attach = attach_setting }

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = false,
    signs = false,
    update_in_insert = false,
  }
)

local sumneko_root_path = vim.fn.stdpath('cache')..'/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"
require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  on_attach = attach_setting
}
