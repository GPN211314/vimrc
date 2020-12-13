call plug#begin('~/.config/nvim/site')
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/nerdfont.vim'
Plug 'terryma/vim-expand-region'
Plug 'gfanto/fzf-lsp.nvim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'LumaKernel/fern-mapping-fzf.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'fszymanski/fzf-quickfix', {'on': 'Quickfix'}
Plug 'pbogut/fzf-mru.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'tpope/vim-obsession'
Plug 'RRethy/vim-illuminate'
Plug 'Jorengarenar/vim-MvVis'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/completion-treesitter'
Plug 'aca/completion-tabnine', { 'do': './install.sh' }
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/echodoc.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'wellle/targets.vim'
Plug '907th/vim-auto-save'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine', { 'rtp': 'after' }
Plug 'yuttie/comfortable-motion.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'romgrk/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/suda.vim'
Plug 'voldikss/vim-floaterm'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rbgrouleff/bclose.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-abolish'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/fzf-floaterm'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'luochen1990/rainbow'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
call plug#end()

autocmd BufEnter * lua require'completion'.on_attach()
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let g:auto_save = 1
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = "virtual"

hi Comment cterm=italic
let g:indentLine_enabled = 1
let g:floaterm_height=0.9
let g:floaterm_width=0.9
let g:floaterm_winblend=0
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#obsession#indicator_text = '$'
let g:airline_left_sep=''
let g:airline_left_alt_sep=' '
let g:airline_right_sep=''
let g:airline_right_alt_sep=' '
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep='  '
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'
let g:airline#extensions#nvimlsp#enabled = 1
let airline#extensions#nvimlsp#error_symbol = 'E:'
let airline#extensions#nvimlsp#warning_symbol = 'W:'
let g:rainbow_active = 1
let g:rainbow_conf = {
    \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \	'operators': '_,_',
    \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \	'separately': {
    \		'*': {},
    \		'tex': {
    \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \		},
    \		'lisp': {
    \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \		},
    \		'vim': {
    \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \		},
    \		'html': {
    \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \		},
    \		'css': 0,
    \	}
    \}

let g:clipboard = {
      \   'name': 'ssh-sync',
      \   'copy': {
      \      '+': ['ssh', 'macbook', 'pbcopy'],
      \      '*': ['ssh', 'macbook', 'pbcopy'],
      \    },
      \   'paste': {
      \      '+': ['ssh', 'macbook', 'pbpaste'],
      \      '*': ['ssh', 'macbook', 'pbpaste'],
      \    },
      \   'cache_enabled': 1,
      \ }


let g:airline_theme='onedark'

syntax on
set scrolloff=10
" set undofile
set guifont=FiraCode\ Nerd\ Font\ Mono:h14
set relativenumber
set noshowmode
set number
set tabstop=4
"set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set signcolumn=yes
set inccommand=nosplit
set mouse=a
set clipboard=unnamedplus
set wrap
set linebreak
set breakindent
set breakindentopt=sbr,shift:4
set showbreak=↪
set timeout timeoutlen=1000 ttimeoutlen=100
set matchtime=2
"set updatecount=400
set updatetime=300
set helplang=cn
set ignorecase smartcase
set smartindent
set sm
set autoread
set autowrite
set expandtab
set showcmd
set cmdheight=1
set showmatch
set nobackup
set nowritebackup
set hidden
set encoding=utf-8
set shortmess+=c
set cursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline
autocmd TermEnter * :IlluminationDisable
autocmd TermLeave * :IlluminationEnable

autocmd Filetype json :IndentLinesDisable

cmap w!! w suda://%
map <silent> <space>x :Bclose<CR>:wincmd w<CR>:wincmd W<CR>
tnoremap <silent> <leader>x <C-\><C-n>:call <SID>close_floaterm()<CR>
nnoremap <silent> <leader>x :call <SID>close_floaterm()<CR>
function! s:close_floaterm()
    if(len(floaterm#buflist#gather())==1)
        FloatermKill
    else
        FloatermKill
        FloatermToggle
    endif
endfunction
let g:floaterm_keymap_new = '<C-x>'
let g:floaterm_keymap_toggle = '<C-p>'
let g:floaterm_keymap_next = '<C-l>'
" let g:floaterm_keymap_first = '<C-j>'
" let g:floaterm_keymap_last = '<C-k>'
let g:floaterm_keymap_prev = '<C-h>'
nnoremap <silent> <space>d :Fern . -drawer -toggle<CR>

""FZF
"" 让输入上方，搜索列表在下方
" let $FZF_DEFAULT_OPTS = '--layout=reverse'
let $FZF_DEFAULT_OPTS = '--layout=reverse-list --info=inline --color=dark
            \ --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
            \ --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef'

autocmd! FileType fzf set laststatus=0 showmode noruler nornu nonu
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

let g:fzf_mru_no_sort = 0
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_layout = { 'down': '25%' }
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

nnoremap <silent> <Tab> <C-^>
nnoremap <silent> gd    :Definitions<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gt    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    :References<CR>
nnoremap <silent> <space>s :DocumentSymbols<CR>
nnoremap <silent> gs :WorkspaceSymbols<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> [g    <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g    <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <space>rn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <space>k <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> <space>a :CodeActions<CR>
vnoremap <silent> <space>a :RangeCodeActions<CR>

let gitgutter_sign_added            = "\u00a0│"
let gitgutter_sign_removed          = "\u00a0│"
let gitgutter_sign_modified         = "\u00a0│"
let gitgutter_sign_modified_removed = "\u00a0│"
autocmd BufEnter * if  &buftype ==# "terminal"| set nornu | set nonu | set nobuflisted |endif
autocmd Filetype fern set nornu nonu
noremap <space>f :FZF<CR>
noremap <space>m :FZFMru<CR>
noremap <space>o :BTags<CR>
noremap <space>l :BLines<CR>
noremap <space>b :Buffers<CR>
noremap <leader>f :Floaterms<CR>
nnoremap <Leader>q :Quickfix<CR>
nnoremap <Leader>l :Quickfix!<CR>
noremap <space>e :Diagnostics<CR>
noremap <space>rg :Rg<CR>

autocmd ColorScheme * hi! LspDiagnosticsDefaultWarning guifg=orange
        \    |hi! LspDiagnosticsDefaultError guifg=red
        \    |hi! LspDiagnosticsDefaultInformation guifg=darkcyan
        \    |hi! LspDiagnosticsDefaultHint guifg=green
        \
        \    |hi! LspDiagnosticsUnderlineWarning cterm=underline gui=underline
        \    |hi! LspDiagnosticsUnderlineError cterm=underline gui=underline
        \    |hi! LspDiagnosticsUnderlineInformation cterm=underline gui=underline
        \    |hi! LspDiagnosticsUnderlineHint cterm=underline gui=underline
        \
        \    |hi! LspDiagnosticsFloatingWarning guifg=orange
        \    |hi! LspDiagnosticsFloatingError guifg=red
        \    |hi! LspDiagnosticsFloatingInformation guifg=darkcyan
        \    |hi! LspDiagnosticsFloatingHint guifg=green

sign define LspDiagnosticsSignError text=✘ texthl=LspDiagnosticsSignError linehl= numhl=LspDiagnosticsSignError
sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=LspDiagnosticsSignWarning
sign define LspDiagnosticsSignInformation  text= texthl=LspDiagnosticsSignInformation linehl= numhl=LspDiagnosticsSignInformation
sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=LspDiagnosticsSignHint

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

set completeopt=menuone,noinsert,noselect
let g:completion_trigger_keyword_length = 3 " default = 1
let g:completion_trigger_on_delete = 0
" let g:completion_timer_cycle=200
let g:completion_matching_ignore_case = 0
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_auto_popup=1
let g:completion_enable_auto_signature = 0
let g:completion_enable_auto_hover = 0
let g:completion_enable_auto_paren = 1
set pw=15
set ph=10
set pb=15
let g:completion_auto_change_source = 1
let g:completion_chain_complete_list = {
        \'default' : {
        \	'default' : [
        \		{'complete_items' : ['lsp', 'tabnine', 'ts']},
        \		{'mode' : 'file'}
        \	],
        \	'comment' : [],
        \	'string' : []
        \	},
        \'vim' : [
        \	{'complete_items': ['tabnine']},
        \	{'mode' : 'cmd'}
        \	]
        \}

let g:VM_theme = 'nord'
let g:VM_maps = {}
let g:VM_maps["Select All"]        = '<leader>a'
let g:VM_maps["Visual All"]        = '<leader>a'

let g:VM_maps["Align"]             = '<leader>A'
let g:VM_maps["Add Cursor Down"]   = '<S-Down>'
let g:VM_maps["Add Cursor Up"]     = '<S-Up>'
let g:VM_mouse_mappings = 1

let g:AutoPairsShortcutToggle = ''
let g:AutoPairsCenterLine = 0
let g:UltiSnipsExpandTrigger="<C-Tab>"
colorscheme onedark
hi NonText guifg=cyan
hi EndOfBuffer guifg=bg
autocmd VimEnter * hi illuminatedWord guibg=#3e4556
nnoremap <silent> U :UndotreeToggle<CR>
hi Visual guibg=#C678DD guifg=bg
function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  silent! nunmap <buffer> <C-L>
  silent! nunmap <buffer> <C-H>
  nmap <buffer> <BS> <Plug>(fern-action-leave)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-action-open-or-enter)
endfunction

autocmd FileType fern call s:init_fern()
let g:fern#renderer = "nerdfont"
" let g:fern#smart_cursor = "hide"
let g:startify_change_to_dir = 0
let g:asyncrun_open = 10
noremap <silent><leader>r :AsyncTask file-run<CR>
noremap <silent><leader>b :AsyncTask file-build<CR>
noremap <silent><space>h :ClangdSwitchSourceHeader<CR>

lua <<EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)
local custom_lsp_attach = function(client)
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end
require'lspconfig'.clangd.setup{
    flags = {
        allow_incremental_sync = true
    },
    on_attach = custom_lsp_attach
}
require'lspconfig'.pyls.setup{}
require'lspconfig'.hls.setup{}

require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = {
    move = {
      enable = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}
EOF

