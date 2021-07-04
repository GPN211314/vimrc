require'telescope'.load_extension('zoxide')
require'telescope'.load_extension('project')
require"telescope".load_extension("frecency")

vim.api.nvim_set_keymap("n", "<space>z", ":Telescope zoxide list<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>f", ":Telescope find_files<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>m", ":Telescope frecency<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>p", ":Telescope project<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>b", ":Telescope buffers<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>r", ":Telescope live_grep<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gd", ":Telescope lsp_definitions<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gr", ":Telescope lsp_references<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>a", ":Telescope lsp_code_actions<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>s", ":Telescope lsp_workspace_symbols<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>g", ":Telescope lsp_document_diagnostics<CR>", {noremap = true, silent = true})


vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope file_browser<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>q", ":Telescope quickfix<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>l", ":Telescope loclist<CR>", {noremap = true, silent = true})

require('telescope').setup({
    defaults = {
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = 'top',
            height = 0.5,
            width = 0.8
        },
        border = true,
    }
})
