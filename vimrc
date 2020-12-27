" AUTHOR: Tor Bratsberg

" PLUGINS {{{

call plug#begin('~/.vim/plugged')

Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'dhruvasagar/vim-table-mode'
Plug 'Chiel92/vim-autoformat'
Plug 'mhinz/vim-startify'

call plug#end()

" }}}
" MISC {{{

set history=400                                 " Remember 400 changes
set foldmethod=marker                           " Fold on marker
set hidden                                      " Enable unsaved files in buffer
set guicursor+=a:blinkon0                       " Stop cursor blinking
set path+=**                                    " Set path
set wildmenu                                    " Enable wildmenu
set wildignore+=**/node_modules/**,*.o,*.pyc    " Make wildmenu ignore certain files and folders
set nowrap                                      " Don't wrap lines
filetype plugin indent on                       " Don't know what this does
autocmd FileType  html,css EmmetInstall         " Only use emmet for HTML and CSS
set tabstop=4                                   " show existing tab with 4 spaces width
set shiftwidth=4                                " when indenting with '>', use 4 spaces width
set expandtab                                   " On pressing tab, insert 4 spaces
set ai                                          " Auto indent
set si                                          " Smart indent
set smarttab                                    " Smart tabbing
set encoding=utf-8                              " Encoding
set hlsearch                                    " Highlight search matches
set incsearch                                   " Incremental search ( Live preview of search I think )
set ignorecase                                  " Case insensitive search
set smartcase                                   " Do smart case matching
set showcmd                                     " Show partial commands in the last line of the screen set noesckeys
set noesckeys                                   " Set escape to be recognized straight away
set nocompatible                                " Not completely sure what this does
set foldcolumn=1                                " Show fold columns, width: 2
set so=5                                        " 5 Lines to cursor
set lazyredraw                                  " Don't't redraw when executin macros ( for performance )
set ttyfast                                     " Performance thingy
set nobackup                                    " Don't take backups
set nowb                                        " Don't do wb stuff ???
set noswapfile                                  " Don't make swap files ???
set splitright                                  " New v-split is made to the right
set splitbelow                                  " New split is made under current
set showmatch                                   " Highlight matching bracket
let g:rooter_patterns=['themes']                " Make themes the root dir for FZF
let g:rooter_manual_only=1                      " Prevent FZF from changing directory
let g:table_mode_corner='|'                     " Make table mode markdown compatible
let g:python3_host_prog="/urs/local/bin/"       " Path to python dir
let g:fzf_preview_window = []                   " Set FZF preview window to be 50% on the bottom
let g:fzf_layout = { 'window': { 'width': 0.4, 'height': 0.3 } } " Set FZF window size

" }}}
" APPEARANCE {{{

colorscheme gruvbox                             " Set colorscheme
let g:gruvbox_contrast_dark='hard'              " Set hard contrast on dark background
set background=dark                             " Always use dark background
syntax enable                                   " Enable syntax highlighting
syntax on                                       " Enable syntax highlighting
set synmaxcol=300                               " Only render syntax highlighting for 300 cols
set visualbell                                  " Blink cursor on error instead of beeping (grr)
set number                                      " Show line numbers
set rnu                                         " Use relative line numbering

" }}}
" KEYMAPPINGS {{{

let leader=","                                   " Set comma to be Leader key
let mapleader=","                                " Set comma to be map Leader key

nmap <C-f> :Files<CR>
nmap <C-a> :BLines<CR>
nmap <C-g> :Rg<CR>
nmap <C-b> :Buffers<CR>
nmap m <Plug>(easymotion-s)

map <leader>e <plug>(emmet-expand-abbr)
map <leader>c :source ~/.vim/vimrc<CR> :echo 'Sourced ~/.vimrc'<CR>
map <leader>f :Autoformat<cr>
map <leader>n :e ~/.vim/notes.md<CR>
map <leader>w :w<CR>
map <C-c> :e ~/.vim/vimrc<CR>
map <C-s> :%s///<Left><Left>
map <C-x> :let @/=''<CR>
map ª :move-2<CR>
map √ :move+1<CR>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

vmap < < gv
vmap > > gv
vmap <Esc> <C-c>

inoremap {<CR> {<CR>}<ESC>O

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

map <leader>gs :Gstatus<Cr>
map <leader>gc :Gcommit<Cr>

" }}}
" ABBREVATIONS {{{

iabbrev iphp <?php ?><Left><Left><Left>
iabbrev icl console.log('');<Left><Left><Left>
iabbrev irc rem-calc();<Left><Left>

" }}}
" STARTIFY {{{

let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   Most recently used']  },
\ ]

"}}}
