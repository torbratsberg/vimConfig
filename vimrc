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
autocmd FileType html,css,scss EmmetInstall
autocmd FileType scss setl iskeyword+=@-@
autocmd VimEnter * NERDTree | wincmd p
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

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:EasyMotion_do_mapping = 0
let g:rooter_patterns=['themes']
let g:rooter_manual_only=1
let g:table_mode_corner='|'
let g:python3_host_prog="/urs/local/bin/"
let g:fzf_preview_window = [0]
let g:fzf_layout = { 'down': '40%' }
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

map <leader>m <C-]>

nmap <Leader>tt :s/\[[ ]\]/\[\+\]/g<cr>:noh<Cr>
nmap <Leader>td I[<Space>]<Esc>a<Space>

nmap <C-f> :Files<cr>
nmap <C-b> :Buffers<cr>
nmap <C-g> :Rg<cr>
nmap <C-t> :NERDTreeToggle<cr>
nmap m <Plug>(easymotion-overwin-f)

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
imap <C-e> <Esc><plug>(emmet-expand-abbr) <Left>i

map <Leader>c :source ~/.vim/vimrc<cr> :echo 'Sourced ~/.vimrc'<CR>
map <Leader>f :Autoformat<cr>
map <Leader>n :e ~/.vim/notes.md<cr>
map <Leader>w :w<cr>
map <C-c> :e ~/.vim/vimrc<cr>
map <C-s> :%s///<Left><Left>
map <C-x> :let @/=''<cr>

" √ = Alt + j && ª == Alt + k
map ª :move-2<cr>
map √ :move+1<cr>
map <cr> o<Esc>
map <S-cr> O<Esc>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

vmap < < gv
vmap > > gv

imap (<Tab> ()<Left>
imap [<Tab> []<Left>
imap {<Tab> {}<Left>
imap '<Tab> ''<Left>
imap "<Tab> ""<Left>
inoremap {<cr> {<CR>}<ESC>O

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<cr>
vnoremap <Space> zf

map <Leader>gs :Gstatus<cr>
map <Leader>gc :Gcommit<cr>
map <Leader>gg :Gpull<cr>
map <Leader>gp :Gpush<cr>
map <Leader>gl :Commits<cr>

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

