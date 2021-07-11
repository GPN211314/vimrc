vim.g['airline#extensions#disable_rtp_load']          = 1
vim.g['airline#extensions#tabline#enabled']           = 1
vim.g['airline#extensions#tabline#buffer_nr_show']    = 1
vim.g['airline#extensions#tabline#formatter']         = 'unique_tail'
vim.g['airline#extensions#whitespace#enabled']        = 0
vim.g['airline#extensions#obsession#enabled']         = 1
vim.g['airline#extensions#fzf#enabled']               = 1
vim.g['airline#extensions#obsession#indicator_text']  = '$'
vim.g['airline_left_sep']                             = ''
vim.g['airline_left_alt_sep']                         = ' '
vim.g['airline_right_sep']                            = ''
vim.g['airline_right_alt_sep']                        = ' '
vim.g['airline#extensions#tabline#left_sep']          = ''
vim.g['airline#extensions#tabline#left_alt_sep']      = '  '
vim.g['airline#extensions#tabline#ignore_bufadd_pat'] = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler|neoterm'
vim.g['airline_stl_path_style']                       = 'short'
vim.g['airline_theme']                                = 'gruvbox8'

vim.api.nvim_set_keymap('n', '[b', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']b', ':bn<CR>', { noremap = true, silent = true })
