" AUTHOR: Tor Bratsberg

" PLUGINS {{{

call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/AutoComplPop'
Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'dhruvasagar/vim-table-mode'
Plug 'Chiel92/vim-autoformat'
Plug 'pechorin/any-jump.vim'
Plug 'preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'

call plug#end()

" }}}
" MISC {{{

filetype plugin indent on
autocmd FileType html,css EmmetInstall
autocmd FileType scss setl iskeyword+=@-@
set showtabline=0
set autoread
set history=400
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
set lazyredraw
set ttyfast
set nobackup
set nowb
set noswapfile
set splitright
set splitbelow
set showmatch
set completeopt=longest,menuone

" }}}
" LETS {{{

let leader=","
let mapleader=","

let g:rooter_patterns=['themes']
let g:rooter_manual_only=1
let g:table_mode_corner='|'
let g:python3_host_prog="/urs/local/bin/"
let g:fzf_preview_window = [0]
let g:fzf_layout = { 'down': '30%' }
let g:EasyMotion_keys=get(g:,
    \ 'EasyMotion_keys', 'asdghklqwertyuiopzxcvbnmfj@')

" }}}
" APPEARANCE {{{

colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set background=dark
syntax on
set synmaxcol=300
set visualbell
set number
set rnu

" }}}
" KEYMAPPINGS {{{

nmap <Leader>tt :s/\[[ ]\]/\[\+\]/g<Cr>:noh<Cr>
nmap <Leader>td I[<Space>]<Esc>a<Space>

nmap <C-f> :Files<CR>
nmap <C-b> :Buffers<CR>
nmap <C-g> :Rg<CR>
nmap <C-t> :NERDTreeToggle<Cr>
nmap m <Plug>(easymotion-s)

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
imap <C-e> <Esc><plug>(emmet-expand-abbr) <Left>i

map <leader>c :source ~/.vim/vimrc<CR> :echo 'Sourced ~/.vimrc'<CR>
map <leader>f :Autoformat<cr>
map <leader>n :e ~/.vim/notes.md<CR>
map <leader>w :w<CR>
map <C-c> :e ~/.vim/vimrc<CR>
map <C-s> :%s///<Left><Left>
map <C-x> :let @/=''<CR>

" √ = Alt + j && ª == Alt + k
map ª :move-2<CR>
map √ :move+1<CR>
map <Cr> o<Esc>
map <S-cr> O<Esc>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

vmap < < gv
vmap > > gv

imap (<Tab> ()<Left>
imap [<Tab> [+]<Left>
imap {<Tab> {}<Left>
imap '<Tab> ''<Left>
imap "<Tab> ""<Left>
inoremap {<CR> {<CR>}<ESC>O

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>
map <leader>gg :Gpull<CR>
map <leader>gp :Gpush<CR>

" }}}
" ABBREVATIONS {{{

iabbrev iphp <?php ?><Left><Left><Left>
iabbrev icl console.log('');<Left><Left><Left>
iabbrev irc rem-calc();<Left><Left>

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
