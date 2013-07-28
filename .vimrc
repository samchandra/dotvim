" ****************************************************************
" Vim/Macvim Settings
"
" Inspired by following sources:
"
" 1. Todd Werth (http://blog.infinitered.com/entries/show/9)
"      http://github.com/twerth/dotfiles 
"
" Note:
" 1. Reload vimrc using :source $MYVIMRC
" 2. Create the backup directories before use
" ****************************************************************
call pathogen#infect()

" Defaults *******************************************************
set nocompatible             " not compatible to old vi
let mapleader = ","          " change mapleader from \ to ,

set backspace=indent,eol,start
set number                  " line numbering

" Backup *********************************************************
set backup
set backupdir=~/.vim_tmp/backup
set directory=~/.vim_tmp/tmp

" Tabs ***********************************************************
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab

" Folding ********************************************************
" set fdm=syntax

" Identing *******************************************************
set autoindent
set smartindent

" Scrollbars *****************************************************
set sidescrolloff=2
set numberwidth=4

" Windows *********************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitright splitbelow

" split navigation to make it easier
:noremap <leader>v :vs<cr>
:noremap <leader>h :sp<cr>

" key mapping for easy navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" key mapping for easy buffer navigation
map <c-p> :bp<cr>
map <c-n> :bn<cr>

" Cursor highlights *************************************************

" cursor column color is defined in the color scheme
set cursorcolumn

" this is for macvim
if has('gui_running')
  set cursorline
endif

" Searching *********************************************************
set hlsearch                " highlight search
set incsearch               " incremental search, search as you type
set ignorecase              " Ignore case when searching 
set smartcase               " Ignore case when searching lowercase

" Colors ************************************************************
set term=xterm-256color
syntax on                   " syntax highlighting
colorscheme neverland-darker

" this is for macvim
if has('gui_running')
 colorscheme ir_black        " stored in ~/.vim/colors
endif

" Status Line *******************************************************
set showcmd
set ruler                   " Show ruler
set ch=2                    " Make command line two lines high

" Line Wrapping *****************************************************
set wrap                    " Wrap lines that is wider than screen
set linebreak               " Wrap at word
 
" Normal Mode Mappings **********************************************

" NERD Tree
nmap <leader>d :NERDTreeToggle<CR>

" Insert Mode Mappings **********************************************
imap jj <Esc>
" imap uu _
" imap hh =>
" imap aa @


" Plugin Config *****************************************************
filetype plugin on
filetype plugin indent on   " to show current filetype use: set ft

au BufRead,BufNewFile *.viki set ft=viki

" Some mods *********************************************************
function! OpenApiDockRuby(keyword)
  let url = 'http://apidock.com/rails/'.a:keyword
  call system("open -a Safari ". url)
endfunction

noremap RR :call OpenApiDockRuby(expand('<cword>')) <CR>

