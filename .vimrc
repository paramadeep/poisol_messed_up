set nocompatible      " We're running Vim, not Vi!

"https://github.com/gmarik/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'AutoComplPop'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-cucumber'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'digitaltoad/vim-jade'
Plugin 'vim-scripts/jade.vim'
call vundle#end()

filetype plugin indent on
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection

set hlsearch
set incsearch

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

set wildmode=full
set laststatus=2 "always display status
set number
highlight LineNr ctermbg=black

let mapleader = ","
nmap <leader>n :NERDTreeFind<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>e :e<space>
nmap <leader>1 :!<space>
nmap <leader>s :%s///g
nmap <leader>f gg=G:w<cr>
nmap <leader>x :NERDTreeToggle<cr> 
nmap <leader>z :NERDTreeToggle<cr> :set nonumber<cr>
"https://github.com/tpope/vim-fugitive#fugitivevim
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<space>-m ""
nmap <leader>gb :Gblame<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gp :Git<space>push<cr>
nmap <leader>gl :Git<space>pull<cr>
"http://stackoverflow.com/questions/6053301/easier-way-to-navigate-between-vim-split-panes
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>            
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

nmap <silent> <c-e> :CtrlPMRU <CR>

"spelling
:set spell
hi clear SpellBad
hi SpellBad cterm=underline

"https://github.com/vim-scripts/vim-auto-save
let g:auto_save = 1 
let g:auto_save_no_updatetime = 1 

"https://github.com/scrooloose/nerdtree#faq
autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"http://vim.wikia.com/wiki/Format_your_xml_document_using_xmllint
au FileType xml exe html svg ":silent %!xmllint --format --recover - 2>/dev/null"

