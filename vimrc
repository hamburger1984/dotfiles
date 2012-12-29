" in parts stolen from pfleidis vimrc file
" https://github.com/pfleidi/dotfiles.git


" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=120             " keep 120 lines of command line history
set autoindent              " auto indenting
set smartindent             " smart indenting
set ruler                   " show the cursor position all the time
set showcmd                 " display incomplete commands
set incsearch               " do incremental searching
set smartcase               " do smart case matching
set background=dark         " dark background is used
set laststatus=2            " show always status line on bottom
set ttyfast                 " we have a fast tty
set showmatch               " Show matching brackets.
set matchtime=5             " Bracket blinking.

" No Tabs are used
set tabstop=2
set shiftwidth=2
set expandtab 
set smarttab
set number

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set autoindent

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

" Remove highlight after search
nmap <silent> ,/ :nohlsearch<CR>

" Always show statusline
set laststatus=2
set noruler
" no colorsheme - KDE Konsole with solarized works well
" colorscheme wombat

" Show buffer number, filetype, fileformat and fileencoding in statusline
set statusline=[%n]\ [%f]\ %w%y%r%m[%{&fileformat}][%{&fileencoding}]\ %=\ %l/%L,%-5c\ %P\ 
