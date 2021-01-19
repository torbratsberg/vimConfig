" AUTHOR: Tor Bratsberg

" PLUGINS {{{

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'


call plug#end()

" }}}
" MISC {{{

filetype plugin indent on
autocmd FileType scss setl iskeyword+=@-@
set guioptions=
set colorcolumn=80
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
set ai
set si
set smarttab
set encoding=utf-8
set hlsearch
set incsearch
set noshowcmd
set noesckeys
set nocompatible
set so=5
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

" }}}
" LETS {{{

let leader=" "
let mapleader=" "

let g:EasyMotion_do_mapping = 0
let g:rooter_patterns=['themes']
let g:rooter_manual_only=1
let g:table_mode_corner='|'
let g:python3_host_prog="/urs/local/bin/"
let g:coc_global_extensions = [ 'coc-tsserver' ]
let g:fzf_preview_window = [0]
let g:fzf_layout = { 'down': '30%' }
let $FZF_DEFAULT_OPTS='--reverse'

" }}}
" APPEARANCE {{{

colorscheme gruvbox
syntax on
let g:gruvbox_contrast_dark='hard'
set background=dark
set synmaxcol=300
set visualbell
set number
set rnu

" }}}
" KEYMAPPINGS {{{

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cd <Plug>(coc-definition)
nmap <leader>cr <Plug>(coc-references)
nmap <leader>cp  :<C-u>CocList diagnostics<cr>
nmap <leader>co  :<C-u>CocList outline<cr>
nmap <leader>qd ciw""<esc>P
nmap <leader>qs ciw''<esc>P
map <Leader>c :source ~/.vim/vimrc<cr>
map <Leader>n :e ~/.vim/notes.md<cr>
map <Leader>w :w<cr>
map <Leader>gs :Gstatus<cr>
map <Leader>gc :Gcommit<cr>
map <Leader>gg :Gpull<cr>
map <Leader>gp :Gpush<cr>
map <Leader>gl :Commits<cr>

nmap <C-f> :Files<cr>
nmap <C-b> :Buffers<cr>
nmap <C-g> :Rg<cr>

map <C-c> :e ~/.vim/vimrc<cr>
map <C-s> :%s///<Left><Left>
map <C-z> :noh<cr>

" √ = Alt + j && ª == Alt + k
map ª :move-2<cr>
map √ :move+1<cr>
map <cr> o<Esc>
map <S-cr> O<Esc>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <tab><tab> <C-6>

vmap < < gv
vmap > > gv

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
set statusline+=%#Title#
set statusline+=[%M%R]
set statusline+=\ \|\ %f
set statusline+=\ %#Status#
set statusline+=%=
set statusline+=%#Title#
set statusline+=\ %l:%c
set statusline+=\ \|\ %L
set statusline+=\ 

 " }}}
