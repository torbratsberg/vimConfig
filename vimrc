" AUTHOR: Tor Bratsberg

" PLUGINS {{{

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'dhruvasagar/vim-table-mode'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'mxw/vim-jsx'
Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'

call plug#end()

" }}}
" MISC {{{

filetype plugin indent on
autocmd FileType scss setl iskeyword+=@-@
set colorcolumn=80
set guioptions=
set showtabline=0
set autoread
set history=400
set updatetime=300
set foldmethod=marker
set hidden
set guicursor+=a:blinkon0
set path+=**
set wildmenu
set wildignore+=**/node_modules/**,*.o,*.pyc
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set smarttab
set encoding=UTF-8
set hlsearch
set incsearch
set noshowcmd
set noesckeys
set nocompatible
set scrolloff=5
set shortmess+=c
set signcolumn=yes
set lazyredraw
set ttyfast
set nobackup
set nowb
set noswapfile
set splitright
set splitbelow
set showmatch
set completeopt=longest,menuone,noinsert
set langmap=øæ;{}

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
let g:fzf_layout={ 'down': '30%' }
let $FZF_DEFAULT_OPTS='--reverse'
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=13
let g:netrw_browse_split=0

" }}}
" APPEARANCE {{{

colorscheme gruvbox
syntax on
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='hard'
set background=dark
set synmaxcol=300
set visualbell
set number
set rnu
set guifont=Menlo:h16

" }}}
" KEYMAPPINGS {{{

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>cr <Plug>(coc-references)
nmap <leader>cn  <Plug>(coc-rename)
nmap <leader>cp  :<C-u>CocList diagnostics<cr>
nmap <leader>co  :<C-u>CocList outline<cr>

nmap <leader>qd ciw""<esc>P
nmap <leader>qs ciw''<esc>P
nmap <leader>; A;<esc>
nmap <leader>, A,<esc>

map <Leader>c :source ~/.vim/vimrc<cr>:noh<cr>
map <Leader>nn :e ~/.vim/notes<cr>
map <leader>tt 5<c-w>h:Vexplore<cr>
map <Leader>w :w<cr>

map <Leader>gs :Gstatus<cr>
map <Leader>gc :Gcommit<cr>
map <Leader>gg :Gpull<cr>
map <Leader>gp :Gpush<cr>
map <Leader>gl :Commits<cr>
map <Leader>gb :Gblame<cr>

nmap <Leader>z :noh<cr>
nmap <Leader>f :Files<cr>
nmap <Leader>b :Buffers<cr>
nmap <Leader>l :BLines<cr>
nmap <Leader>r :Rg<cr>

map <C-c> :e ~/.vim/vimrc<cr>
map <C-s> :%s///<Left><Left>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <tab><tab> <C-6>
nmap <Leader><Right> :bnext<cr>
nmap <Leader><Left> :bprevious<cr>

" √ = Alt + j & ª = Alt + k
map ª :move-2<cr>
map √ :move+1<cr>
vmap < < gv
vmap > > gv
vmap <esc> <C-c>
nnoremap <silent> , @=(foldlevel('.')?'za':"\<Space>")<cr>
vnoremap , zf

nmap <tab> '
nmap t <Plug>(easymotion-overwin-f)

imap (<Tab> ()<Left>
imap [<Tab> []<Left>
imap {<Tab> {}<Left>
imap '<Tab> ''<Left>
imap "<Tab> ""<Left>
inoremap {<cr> {<CR>}<ESC>O

" }}}
" ABBREVATIONS {{{

iabbrev iphp <?php ?><Left><Left><Left>
iabbrev icl console.log();<Left><Left>
iabbrev irc rem-calc()<Left>

" }}}
" STATUSLINE {{{

set laststatus=2
set statusline=
set statusline+=\ [%M%R]
set statusline+=\ \|\ %f
set statusline+=%=
set statusline+=\%l:%c
set statusline+=\ \|\ %L
set statusline+=\ "

" }}}
