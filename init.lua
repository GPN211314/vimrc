function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

vim.opt.updatetime = 100
vim.opt.scrolloff = 10
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.signcolumn = 'auto'
vim.opt.inccommand = 'nosplit'
vim.opt.mouse = 'a'
vim.opt.hlsearch = false
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.incsearch = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.linebreak = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.cscopetag = true
vim.opt.number = true
vim.opt.breakindentopt = 'sbr,shift:4'
vim.opt.clipboard = 'unnamedplus'
vim.opt.cscopeprg = 'gtags-cscope'
vim.opt.cscopequickfix = 's-,c-,d-,i-,t-,e-,g-,f-,a-'
vim.opt.guifont = 'FiraCode Nerd Font Mono:h14'
vim.opt.showbreak = '↪'
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.grepprg = 'rg --vimgrep --no-heading'
vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
vim.opt.makeprg = [[docker run --rm -t -v /Users/bjhl/shared:/home/carl/shared ubuntu zsh -c "cd ~/shared/source/build_system && source env.linux.sh && cd $(print -P \%~) && eval ${1:-b} |sed 's|/home/carl|~|g'"]]

vim.g.clipboard = {
    ['name'] = 'ssh-sync',
    ['copy'] = {
        ['+'] = { 'ssh', 'host.docker.internal', 'pbcopy' },
        ['*'] = { 'ssh', 'host.docker.internal', 'pbcopy' },
    },
    ['paste'] = {
        ['+'] = { 'ssh', 'host.docker.internal', 'pbpaste' },
        ['*'] = { 'ssh', 'host.docker.internal', 'pbpaste' },
    },
    ['cache_enabled'] = 1,
}

require('pluginlist')

vim.cmd 'colorscheme gruvbox'
vim.cmd 'autocmd TermOpen * setlocal nornu nonu signcolumn=no noruler'
vim.api.nvim_set_keymap('n', '<space>d', ':!sdcv <cword><CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', [[:<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'k'<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', [[:<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'j'<CR>]], { noremap = true, silent = true })
