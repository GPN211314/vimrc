call plug#begin('~/.config/nvim/site')
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['plantuml', 'markdown', 'vim-plug']}
" Plug 'scrooloose/vim-slumlord'
Plug 'vim-scripts/DrawIt'
" Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
" Plug 'rafaqz/ranger.vim'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'inkarkat/vim-ingo-library'
" Plug 'inkarkat/vim-EnhancedJumps'
Plug 'gruvbox-community/gruvbox'
Plug 'derekwyatt/vim-fswitch'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 't9md/vim-choosewin'
Plug 'wellle/context.vim'
" Plug 'preservim/nerdtree'
" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'kristijanhusak/defx-git'
" Plug 'kristijanhusak/defx-icons'
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
" Plug 'CoatiSoftware/vim-sourcetrail'
Plug 'brooth/far.vim'
" Plug 'equalsraf/neovim-gui-shim'
" Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
" Plug 'subnut/visualstar.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'romgrk/nvim-treesitter-context'
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/nerdfont.vim'
Plug 'terryma/vim-expand-region'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'fszymanski/fzf-quickfix', {'on': 'Quickfix'}
" Plug 'pbogut/fzf-mru.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'tpope/vim-obsession'
Plug 'RRethy/vim-illuminate'
Plug 'jiangmiao/auto-pairs'
" Plug 'Shougo/echodoc.vim'
Plug 'wellle/targets.vim'
Plug '907th/vim-auto-save'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine', { 'rtp': 'after' }
" Plug 'yuttie/comfortable-motion.vim'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/suda.vim'
" Plug 'voldikss/vim-floaterm'
Plug 'joshdick/onedark.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-abolish'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'voldikss/fzf-floaterm'
Plug 'mbbill/undotree'
Plug 'luochen1990/rainbow'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
call plug#end()

command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let g:auto_save = 1
let g:auto_save_silent = 1  " do not display the auto-save notification
" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = "virtual"

hi Comment cterm=italic
let g:indentLine_enabled = 0
let g:floaterm_height=0.6
let g:floaterm_width=0.9
let g:floaterm_winblend=0
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#whitespace#enabled = 0
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


let g:airline_stl_path_style = 'short'
let g:airline_theme='onedark'
syntax on
" set stl=%!airline#check_mode(winnr())
set incsearch
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
set nohls
set linebreak
set breakindent
set breakindentopt=sbr,shift:4
set showbreak=↪
" set wrapmargin=2
" set textwidth=80
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
set noshowmode
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline


cmap w!! w suda://%
cabbrev ls !ls
cabbrev tree !tree
nnoremap <silent> <space>x :Bclose!<CR>
" nnoremap <silent> - :Lfcd<CR>
nnoremap <silent> <space>w :ChooseWin<CR>
nnoremap <silent> <space>d :!sdcv <cword><CR>
nnoremap <silent> <space>p <Plug>MarkdownPreviewToggle

""FZF
"" 让输入上方，搜索列表在下方
" let $FZF_DEFAULT_OPTS = '--layout=reverse'
let $FZF_DEFAULT_OPTS = '--layout=reverse --color=dark
            \ --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
            \ --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef'

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

" let g:fzf_mru_no_sort = 0
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
" let g:fzf_layout = { 'down': '25%' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

colorscheme onedark
let gitgutter_sign_added            = "\u00a0│"
let gitgutter_sign_removed          = "\u00a0│"
let gitgutter_sign_modified         = "\u00a0│"
let gitgutter_sign_modified_removed = "\u00a0│"
hi link GitGutterAddLineNr          GitGutterAdd
hi link GitGutterChangeLineNr       GitGutterChange
hi link GitGutterDeleteLineNr       GitGutterDelete
hi link GitGutterChangeDeleteLineNr GitGutterChangeDelete
let g:gitgutter_highlight_linenrs = 0
autocmd  TermOpen * setlocal nornu nonu signcolumn=no laststatus=0 noruler
            \| autocmd BufEnter <buffer> setlocal nornu nonu signcolumn=no laststatus=0 noruler | call feedkeys("\<C-\>\<C-N>\<Esc>")
autocmd BufLeave * if &buftype==#'terminal' | set laststatus=2 |endif
autocmd Filetype fzf setlocal laststatus=2
autocmd Filetype \(^fzf\)\@<! if &buftype ==# 'terminal' | setlocal buflisted | endif
noremap <space>f :FZF<CR>
noremap <space>m :History<CR>
noremap <space>o :BTags<CR>
noremap <space>t :Tags<CR>
noremap <space>l :BLines<CR>
noremap <space>b :Buffers<CR>
nnoremap <Leader>q :Quickfix<CR>
nnoremap <Leader>l :Quickfix!<CR>
noremap <space>r :Rg<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menuone,noinsert,noselect

let g:VM_theme = 'nord'
let g:VM_maps = {}
let g:VM_maps["Select All"]        = '<leader>a'
let g:VM_maps["Visual All"]        = '<leader>a'

let g:VM_maps["Align"]             = '<leader>A'
let g:VM_maps["Add Cursor Down"]   = '<S-Down>'
let g:VM_maps["Add Cursor Up"]     = '<S-Up>'
let g:VM_mouse_mappings = 1
let g:VM_silent_exit = 1

let g:AutoPairsShortcutToggle = ''
let g:AutoPairsCenterLine = 0
hi NonText guifg=cyan
hi EndOfBuffer guifg=bg
" hi CursorLineNr guifg=#61AFEF
" autocmd VimEnter *
hi illuminatedWord guibg=#3e4556
nnoremap <silent> <space>u :UndotreeToggle<CR>
hi Visual guibg=#C678DD guifg=bg
let g:startify_change_to_dir = 0
let g:asyncrun_open = 10
noremap <silent><leader>r :AsyncTask file-run<CR>
noremap <silent><leader>b :AsyncTask file-build<CR>
noremap <silent><space>h :FSHere<CR>:setlocal buflisted<CR>

let g:far#source='rg'
let g:Illuminate_ftwhitelist = ['python', 'sh', 'cpp', 'c', 'bash', 'zsh', 'vim']
let g:indent_blankline_enabled = v:true
let g:indentLine_fileType = ['python', 'sh', 'cpp', 'c', 'bash', 'zsh', 'vim']
let g:indent_blankline_char_list = ['¦']
let g:indentLine_char_list = ['¦']
let g:loaded_netrwPlugin = 1

let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()
let g:python3_host_prog = '/home/carl/.pyenv/shims/python3'
let g:choosewin_blink_on_land = 0
let g:choosewin_color_label = { 'gui': ['#98c379', '#282c34'] }
let g:choosewin_color_label_current = { 'gui': ['#98c379', '#282c34'] }
let g:choosewin_color_other = { 'gui': ['#3e4452', '#abb2bf'] }

let g:context_nvim_no_redraw = 1
augroup mycppfiles
    au!
    au BufEnter *.h let b:fswitchdst  = 'cpp,cc,c'
    au BufEnter *.cc let b:fswitchdst  = 'h'
augroup END

autocmd Filetype python,sh,cpp,c,bash,zsh,vim IndentLinesEnable

let g:mkdp_command_for_global = 1
let g:mkdp_refresh_slow = 1
let g:mkdp_auto_close = 0
let g:mkdp_open_to_the_world = 1
let g:mkdp_open_ip = '192.168.56.2'
function! g:Open_browser(url)
    silent exe '!ssh macbook open 'a:url
endfunction
let g:mkdp_browserfunc = 'g:Open_browser'
