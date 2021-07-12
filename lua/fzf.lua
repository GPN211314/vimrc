vim.env.FZF_DEFAULT_OPTS = '--layout=reverse-list --no-info'
vim.g.fzf_preview_window = {'right:50%:hidden', 'ctrl-/'}
vim.g.fzf_layout = { ['down'] = '25%' }
vim.g.fzf_colors =  {
    ['fg'] =      { 'fg', 'Normal' },
    ['bg'] =      { 'bg', 'Normal' },
    ['hl'] =      { 'fg', 'Comment' },
    ['fg+'] =     { 'fg', 'Search', 'CursorColumn', 'Normal' },
    ['bg+'] =     { 'bg', 'Search', 'CursorColumn' },
    ['hl+'] =     { 'fg', 'Statement' },
    ['info'] =    { 'fg', 'PreProc' },
    ['border'] =  { 'fg', 'Ignore' },
    ['prompt'] =  { 'fg', 'Conditional' },
    ['pointer'] = { 'fg', 'Exception' },
    ['marker'] =  { 'fg', 'Keyword' },
    ['spinner'] = { 'fg', 'Label' },
    ['header'] =  { 'fg', 'Comment' }
}

vim.cmd 'autocmd FileType fzf setlocal nornu nonu'
vim.api.nvim_set_keymap('n', '<space>f', ':FZF<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>z', ':Zi<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>m', ':History<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>o', ':DocumentSymbols<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>b', ':Buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>r', ':Rg<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>g', ':Diagnostics<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>a', ':CodeActions<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', ':References<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gd', ':Definitions<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>q', ':Quickfix<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':Quickfix!<CR>', { noremap = true, silent = true })
require'fzf_lsp'.setup()
