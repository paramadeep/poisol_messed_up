call pathogen#infect()
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

if has("autocmd")
  autocmd FileType ruby setlocal omnifunc=syntaxcomplete#Complete
  autocmd FileType ruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby let g:rubycomplete_classes_in_global=1
endif
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

"http://vimcasts.org/episodes/running-vim-within-irb/
if has("autocmd")
    " Enable filetype detection
    filetype plugin indent on
          " Restore cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

set wildmode=full

"https://github.com/scrooloose/nerdtree
"close the window
"autocmd vimenter * NERDTree
"autocmd VimEnter * wincmd p
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let mapleader = ","
nmap <leader>ne :NERDTree<cr>
nmap <leader>mv :Rview<space>
nmap <leader>mh :Rhelper<space>
nmap <leader>mm :Rmodel<space>
nmap <leader>mi :Rmigration<space>
nmap <leader>mc :Rcontroller<space>
nmap <leader>md :Rake db:
nmap <leader>ms :Rstylesheet<space>
nmap <leader>mj :Rjavascript<space>
nmap <leader>mf :Rfixture<space>
nmap <leader>mg :Rgenerate<space>
nmap <leader>mr :e config/routes.rb<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>e :e<space>
nmap <leader>s :%s///g
nmap <leader>a :Ack<space>
nmap <leader>f gg=G:w<cr>
