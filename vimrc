" AUTHOR: Tor Bratsberg

" PLUGINS {{{

call plug#begin('~/.vim/plugged')

" Fuzzy finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Functionality
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-fugitive'

" Themes and syntax
Plug 'mxw/vim-jsx'
Plug 'morhetz/gruvbox'
Plug 'ntk148v/vim-horizon'

Plug 'justinmk/vim-sneak'

call plug#end()

" }}}
" MISC {{{

filetype plugin indent on
autocmd FileType scss setl iskeyword+=@-@
highlight Comment cterm=italic
set colorcolumn=80
set guioptions=
set showtabline=0
set autoread
set history=400
set updatetime=200
set foldmethod=marker
set hidden
set guicursor+=a:blinkon0
set path+=**
set wildmenu
set wildignore+=**/node_modules/**,*.o,*.pyc,**/venv/**
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set smarttab
set encoding=UTF-8
set nohlsearch
set incsearch
set noshowcmd
set noesckeys
set nocompatible
set scrolloff=8
set shortmess+=c
set signcolumn=yes
set lazyredraw
set ttyfast
set nobackup
set nowritebackup
set noswapfile
set splitright
set splitbelow
set showmatch
set completeopt=longest,menuone,noinsert
set langmap=æø;{}

" }}}
" LETS {{{

let leader=" "
let mapleader=" "

let g:EasyMotion_do_mapping = 0
let g:rooter_patterns=['themes']
let g:rooter_manual_only=1
let g:table_mode_corner='+'
let g:python3_host_prog="/urs/local/bin/"
let g:coc_global_extensions = [ 'coc-tsserver' ]
let g:fzf_preview_window = [0]
let g:fzf_layout={ 'down': '25%' }
let $FZF_DEFAULT_OPTS='--reverse'
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=13
let g:netrw_altv=1

" Use @ instead of ; in EasyMotion search for ISO layout convenience
let g:EasyMotion_keys               = get(g:,
    \ 'EasyMotion_keys', 'asdghklqwertyuiopzxcvbnmfj@')

" }}}
" APPEARANCE {{{

syntax on
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='hard'
set background=dark
set synmaxcol=300
set visualbell
set number
set rnu
set guifont=Menlo:h14
set guicursor=n-v-c-i:block-Cursor
set guicursor+=n-v-c:blinkon0

" Horizon does not look too good without gui, but gruvbox does
if has("gui_running")
    colorscheme horizon
    highlight Pmenu guibg=#6c6f93
    highlight Cursor guifg=#000000 guibg=#e95678
    highlight htmlTagName guifg=#21bfc2
    highlight Statement cterm=italic gui=italic ctermfg=171 guifg=#b877db
    highlight Visual gui=bold guibg=#2b2e3b guifg=#09f7a0
    highlight Delimiter guifg=#a95678
else
    colorscheme gruvbox
endif

" }}}
" KEYMAPPINGS {{{

" Enter to select first or selected from completion menu
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Coc commands
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>cr <Plug>(coc-references)
nmap <leader>cn  <Plug>(coc-rename)
nmap <leader>cp  :<C-u>CocList diagnostics<cr>
nmap <leader>co  :<C-u>CocList outline<cr>

" Add characters
nmap <leader>qd ciw""<esc>P
nmap <leader>qs ciw''<esc>P
nmap <leader>; A;<esc>
nmap <leader>, A,<esc>

" Leader misc commands
map <Leader>c :source ~/.vim/vimrc<cr>
map <Leader>nn :e ~/.vim/notes<cr>
map <Leader>w :w<cr>

" Git commands
map <Leader>gs :G<cr>
map <Leader>gc :Git commit<cr>
map <Leader>gg :Git pull<cr>
map <Leader>gp :Git push<cr>
map <Leader>gl :Commits<cr>
map <Leader>gbl :Git blame<cr>
map <Leader>gbr :Git branch<cr>
map <Leader>gr :Git remote<cr>
map <Leader>gd :Gdiffsplit<cr>
map <Leader>g<Left> :diffget //2<cr>
map <Leader>g<Right> :diffget //3<cr>

" Looking up stuff commands
nmap <Leader>z :noh<cr>
nmap <Leader>f :Files<cr>
nmap <Leader>b :Buffers<cr>
nmap <Leader>r :Rg<cr>

" Easier movement between splits
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Control misc commands
" √ = Alt + j & ª = Alt + k
map ª :move-2<cr>
map √ :move+1<cr>
vmap < < gv
vmap > > gv
vmap <esc> <C-c>
nnoremap <silent> , @=(foldlevel('.')?'za':"\<Space>")<cr>
vnoremap , zf
nmap <cr> o<esc>
nmap <tab><tab> <C-6>
map <C-c> :e ~/.vim/vimrc<cr>
map <C-s> :%s///<Left><Left>

" Character completion
imap (<Tab> ()<Left>
imap [<Tab> []<Left>
imap {<Tab> {}<Left>
imap '<Tab> ''<Left>
imap "<Tab> ""<Left>
imap `<Tab> ``<Left>
inoremap {<cr> {<cr>}<ESC>O

" Quickfix
nmap <Leader>h :cnext<cr>
nmap <Leader>l :cprev<cr>
nmap <Leader>qf :copen<cr>

" Fix for a problem I had
map gx <nop>

" }}}
" ABBREVATIONS {{{

iabbrev iphp <?php ?><Left><Left><Left>
iabbrev icl console.log();<Left><Left>
iabbrev irc rem-calc()<Left>
iabbrev iff function

" }}}
" STATUSLINE {{{

set laststatus=2
set statusline=
set statusline+=%#Character#
set statusline+=\ [%M%R]
set statusline+=\ \|\ %f
set statusline+=\ \|\ %{FugitiveHead()}
set statusline+=%=
set statusline+=%#Character#
set statusline+=\ %l:%c
set statusline+=\ \|\ %L
set statusline+=\ %#LineNr#
set statusline+=\ "

" }}}

