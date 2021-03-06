"-------------------------------------------------------------------------------
" enable colors..
"-------------------------------------------------------------------------------
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------
" Load vim-plug
if empty(glob("$HOME/.config/nvim/autoload/plug.vim"))
    execute "!curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif
let plug_path='$HOME/.config/nvim/plugged'

call plug#begin(plug_path)
" sensible defaults
Plug 'tpope/vim-sensible'

" devicons have to be loaded quite early.
Plug 'ryanoasis/vim-devicons'

" some util plugins
"Plug 'xolox/vim-misc'      " needed for vim-shell
"Plug 'xolox/vim-shell'     " fullscreen, hide flashing cmd prompts in windows
"Plug 'Shougo/vimproc.vim'  " needed by unite (at least)

" text writing
"Plug 'reedes/vim-wordy'

" start screen
Plug 'mhinz/vim-startify'

" git
"Plug 'cohama/agit.vim'
"Plug 'jreybert/vimagit', { 'branch': 'next' }
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'

" distraction free
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}

" unite replacement: denite
Plug 'Shougo/denite.nvim'

" usage hints
"Plug 'urbainvaes/vim-remembrall'
Plug 'liuchengxu/vim-which-key'

" lldb integration
"Plug 'critiqjo/lldb.nvim'

" cursorword (underline all occurrences of the word under cursor)
Plug 'itchyny/vim-cursorword'

" fileencodings & language plugins
"Plug 's3rvac/AutoFenc'
Plug 'NLKNguyen/c-syntax.vim', {'for': 'c'}
"Plug 'chrisbra/csv.vim' " delaying this causes an error , {'for': 'csv'}
"Plug 'jimenezrick/vimerl', {'for': 'erlang'}
"Plug 'fatih/vim-go', {'for': 'go'}
Plug 'wannesm/wmgraphviz.vim', {'for': ['dot', 'gv']}
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'moll/vim-node', {'for': ['javascript', 'node', 'nodejs']}
Plug 'jelera/vim-javascript-syntax', {'for': ['javascript', 'node', 'nodejs']}
"Plug 'elzr/vim-json', {'for': 'json'}
Plug 'xolox/vim-lua-ftplugin', {'for': 'lua'}
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'zah/nim.vim', {'for': 'nim'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
"Plug 'Rykka/riv.vim' " crashes when loaded on-demand , {'for': 'rst'}
Plug 'lervag/vimtex' ", {'for': 'tex'}
"Plug 'jneen/ragel.vim', {'for': 'ragel'}
Plug 'WolfgangMehner/c-support', {'for': 'c'}
Plug 'stevearc/vim-arduino', {'for': 'arduino'}
Plug 'keith/swift.vim', {'for': 'swift'}
Plug 'udalov/kotlin-vim'

" fold, complete, buffers, search
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'OmniSharp/omnisharp-vim'
Plug 'ddrscott/vim-side-search'
"Plug 'Konfekt/FastFold'
"Plug 'pseewald/vim-anyfold'
"Plug 'ervandew/supertab'
"Plug 'brooth/far.vim'
"Plug 'tpope/vim-commentary'

" syntax check..
Plug 'scrooloose/syntastic'

" color schemes
"Plug 'itchyny/landscape.vim'
"Plug 'alessandroyorba/despacio'
"Plug 'kkpmw/moonshine-vim'
"Plug 'morhetz/gruvbox'
"Plug 'kristijanhusak/vim-hybrid-material'
"Plug 'rakr/vim-one'
Plug 'AlessandroYorba/Alduin'

" bufferline, lightline, percent indicator
Plug 'bling/vim-bufferline'
Plug 'itchyny/lightline.vim'
Plug 'naddeoa/vim-visual-page-percent'

call plug#end()

"-------------------------------------------------------------------------------
" recursive find
"-------------------------------------------------------------------------------
set path+=**
"-------------------------------------------------------------------------------
" no square brackets on QUERTZ
"-------------------------------------------------------------------------------
set langmap=ß[,´]
"-------------------------------------------------------------------------------
" Toggle paste - turns on/off autoindenting etc.
"-------------------------------------------------------------------------------
set pastetoggle=<F2>
"-------------------------------------------------------------------------------
" Turn off paste mode when leaving insert
"-------------------------------------------------------------------------------
au InsertLeave * set nopaste
"-------------------------------------------------------------------------------
" Select a default copy&paste register
" * is selection ~ unnamed
" + is clipboard ~ unnamedplus
"-------------------------------------------------------------------------------
if has("win32")
    set clipboard=unnamed
else
    set clipboard=unnamedplus
endif
"-------------------------------------------------------------------------------
" Mouse
"-------------------------------------------------------------------------------
set mouse=a
"-------------------------------------------------------------------------------
" <Leader> key
"-------------------------------------------------------------------------------
let mapleader=","
"-------------------------------------------------------------------------------
" Learn to move..
"-------------------------------------------------------------------------------
nnoremap <Left> :echoe "Use h"<CR>
vnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
vnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
vnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
vnoremap <Down> :echoe "Use j"<CR>
"-------------------------------------------------------------------------------
" Jump to (help-)subject and back
"-------------------------------------------------------------------------------
nnoremap ü <C-]>
nnoremap Ü <C-t>
"-------------------------------------------------------------------------------
" faster split resize
"-------------------------------------------------------------------------------
map <Leader>+ <esc>:vertical resize +5<CR>
map <Leader>- <esc>:vertical resize -5<CR>
"-------------------------------------------------------------------------------
" new split below/right of current
"-------------------------------------------------------------------------------
set splitbelow
set splitright
"set diffopt+=vertical
"silent! set splitvertical
"-------------------------------------------------------------------------------
" move between splits
"-------------------------------------------------------------------------------
map <Leader>h <C-W><C-H>
map <Leader>j <C-W><C-J>
map <Leader>k <C-W><C-K>
map <Leader>l <C-W><C-L>
"-------------------------------------------------------------------------------
" easier buffer switching
"-------------------------------------------------------------------------------
map <Leader>n <esc>:bprevious<CR>
map <Leader>m <esc>:bnext<CR>
"-------------------------------------------------------------------------------
" open new (empty) buffer
"-------------------------------------------------------------------------------
map <Leader>a <esc>:enew<CR>
"-------------------------------------------------------------------------------
" open new vertical split
"-------------------------------------------------------------------------------
map <Leader>v <esc>:vnew<CR>
"-------------------------------------------------------------------------------
" close current file, but keep buffers intact
"-------------------------------------------------------------------------------
map <Leader>x <esc>:bp\|bd #<CR>
"-------------------------------------------------------------------------------
" change directory to that of current file
"-------------------------------------------------------------------------------
map <Leader>cd :cd %:p:h<CR>
"-------------------------------------------------------------------------------
" map sort to a key
"-------------------------------------------------------------------------------
vnoremap <Leader>s :sort<CR>
"-------------------------------------------------------------------------------
" easier moving of code blocks
"-------------------------------------------------------------------------------
vnoremap < <gv
vnoremap > >gv
"-------------------------------------------------------------------------------
" Make search case insensitive
"-------------------------------------------------------------------------------
set hlsearch
set ignorecase
set smartcase
"-------------------------------------------------------------------------------
" Automatically insert \v when searching, for sensible regex matching.
"-------------------------------------------------------------------------------
nnoremap <M-/> \v
vnoremap <M-/> /\v
nnoremap <M-?> ?\v
vnoremap <M-?> ?\v
"-------------------------------------------------------------------------------
" Keep search matches in the middle of the screen, and pulse the line when moving
"-------------------------------------------------------------------------------
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
"-------------------------------------------------------------------------------
" Clear search highlight
"-------------------------------------------------------------------------------
noremap  <silent> <C-n> :nohl<CR>
vnoremap <silent> <C-n> :nohl<CR>
inoremap <silent> <C-n> <esc>:nohl<CR>
"-------------------------------------------------------------------------------
" Highlight multiple spaces and trailing whitespace
"-------------------------------------------------------------------------------
set list
highlight Whitespace cterm=underline gui=underline ctermfg=94 guifg=#875f00
au ColorScheme * highlight Whitespace cterm=underline gui=underline ctermfg=94 guifg=#875f00
" highlight multiple spaces
au BufWinEnter * call matchadd('Whitespace', '\s\s\+\($\)\@!', -1)
" highlight trailing whitespace
au BufWinEnter * call matchadd('ErrorMsg', '\s\+$', -1)
"-------------------------------------------------------------------------------
" Set color scheme
"-------------------------------------------------------------------------------
if !has('gui_running')
    set t_Co=256
endif
set background=dark
"colorscheme landscape
"colorscheme despacio
"colorscheme moonshine
"colorscheme moonshine_lowcontrast
"colorscheme moonshine_minimal
"colorscheme gruvbox
"colorscheme hybrid_material
"
"let g:one_allow_italics = 1 " I love italic for comments
"colorscheme one
let g:alduin_Shout_Dragon_Aspect = 1 " almost black
colorscheme alduin

"-------------------------------------------------------------------------------
" (relative) line numbers
"-------------------------------------------------------------------------------
au InsertEnter * set number norelativenumber
au InsertLeave * set number relativenumber
set number relativenumber
"-------------------------------------------------------------------------------
" 80 cols, wrap, ..
"-------------------------------------------------------------------------------
set tw=80
set wm=4
set wrap
set linebreak
set fo-=t
set colorcolumn=+1
highlight ColorColumn ctermbg=236
"-------------------------------------------------------------------------------
" Useful settings
"-------------------------------------------------------------------------------
set history=2000
set undolevels=2000
"-------------------------------------------------------------------------------
" Don't use TABs but 4 spaces (except for xml, see below..)
"-------------------------------------------------------------------------------
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
"-------------------------------------------------------------------------------
" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
"-------------------------------------------------------------------------------
set nobackup
set nowritebackup
set noswapfile
"-------------------------------------------------------------------------------
" Autocomplete, Spelling
"-------------------------------------------------------------------------------
set spelllang=de,en
set complete=".,w,b,u,t,i,kspell" " default + included files + spelling
set completeopt=menuone,noinsert
"-------------------------------------------------------------------------------
" Filetype mappings, formatting.
"-------------------------------------------------------------------------------
au BufNewFile,BufRead *.c set formatprg=astyle\ -A1
au BufNewFile,BufRead *.h set filetype=c formatprg=astyle\ -A1
au BufNewFile,BufRead *.conf set filetype=config
au BufNewFile,BufRead *.config set filetype=xml
au BufNewFile,BufRead *.geojson set filetype=json
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.nim set filetype=nim
au BufNewFile,BufRead *.rl set filetype=ragel
au BufNewFile,BufRead *.xaml set filetype=xml
au BufNewFile,BufRead *.pde set filetype=arduino
au BufNewFile,BufRead *.ino set filetype=arduino
"-------------------------------------------------------------------------------
" Folding..
"-------------------------------------------------------------------------------
nnoremap <Leader>f za
vnoremap <Leader>f zf
" foldlevelstart is a global setting?!
set foldlevelstart=1
"-------------------------------------------------------------------------------
" Filetype specific settings..
"-------------------------------------------------------------------------------
" C_LIKE: fold by syntax, conceal
au FileType java setl fen foldmethod=syntax conceallevel=1
    \ omnifunc=javacomplete#Complete
au FileType c,cpp,javascript setl fen foldmethod=syntax conceallevel=1
" C: tabstops.. brrr..
au FileType c setl tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
au FileType json setl fen foldmethod=syntax conceallevel=0
" OBJECTIVE_C: fold by syntax
au FileType objc setl fen foldmethod=syntax noexpandtab
" PYTHON: folding up to 3 levels
au FileType python setl fen foldmethod=indent foldnestmax=3
" RST: spell check
au FileType rst setl fen foldmethod=syntax spell
" TEX: folding + line wrapping
au FileType tex,plaintex setl fen foldmethod=expr
    \ conceallevel=2
    \ foldexpr=vimtex#fold#level(v:lnum)
    \ foldtext=vimtex#fold#text()
    \ fo+=t fo-=c
    \ spell
" fo+=a  " .. is useful but might interfere with non-text parts of tex
" XML: syntax folding is slow for large files - use indent
" .. might have to switch for unformatted files
" let g:xml_syntax_folding=1
" au FileType xml setl fen foldmethod=syntax
au FileType xml setl fen foldmethod=indent sw=2
" YAML: fold by indent (syntax would be nicer but not supported..)
au FileType yaml setl fen foldmethod=indent sw=2
"-------------------------------------------------------------------------------
" running stuff ~> format/lint/make/..
"-------------------------------------------------------------------------------
au FileType c               map <buffer> <Leader>c gggqG
au FileType html            map <buffer> <Leader>c :!tidy -q -mi --show-errors 0 --wrap 0 %<CR>
au FileType json            map <buffer> <Leader>c :%!python -m json.tool<CR>
" if executable('eslint')
"     au FileType javascript  map <buffer> <Leader>c :%!eslint --env es6 --fix-dry-run --stdin --no-eslintrc<CR>
" endif
if executable('js-beautify')
    au FileType javascript  map <buffer> <Leader>c :%!js-beautify --stdin<CR>
endif
au FileType nim             map <buffer> <Leader>c :!nim c -d:ssl %<CR>
au FileType nim             map <buffer> <Leader>C :!nim c -d:ssl -r %<CR>
"au FileType python        map <buffer> <Leader>c :call Flake8()<CR>
au FileType tex             map <buffer> <Leader>c :VimtexCompile<CR>
au FileType xml             map <buffer> <Leader>c :%!xmllint --format --recover -<CR>
nnoremap <F5> :cd %:p:h<CR> :!make<CR>
"-------------------------------------------------------------------------------
" lightline
"-------------------------------------------------------------------------------
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'branch', 'filename', 'readonly', 'modified' ],
      \             [ 'fmtopts' ] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], [ 'visualpercent' ],
      \              [ 'fileinfo', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'fileinfo': '%{&fileencoding." ".WebDevIconsGetFileFormatSymbol()}',
      \   'filetype': '%{(strlen(&filetype)?&filetype." ".WebDevIconsGetFileTypeSymbol():"no ft")}',
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fmtopts': '%{strlen(&fo)?&fo:"⌀"}',
      \   'visualpercent': '%{VisualPercent()}',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'middle',
      \ },
      \ 'component_function': {
      \   'branch': 'LightLineBranch',
      \   'filename': 'LightLineFilename',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '\uE0B5', 'right': '\uE0B7' },
      \ 'colorscheme': 'material'
      \ }

"      \ 'colorscheme': 'wombat'
"      \ 'colorscheme': 'seoul256'

function! LightLineBranch()
    if exists("*gitbranch#name")
        let _ = gitbranch#name()
        return strlen(_) ? ' '._ : ''
    endif
    return ''
endfunction

function! LightLineFilename()
  return ('' != expand('%:t') ? expand('%:t') : '[No Name]')
endfunction

function! LightLineMode()
    if &ft == 'unite'
        return 'Unite'
    endif
    let _ = lightline#mode()
    return _ == 'NORMAL' ? 'N' :
        \ _ == 'INSERT' ? 'I' :
        \ _ == 'REPLACE' ? 'R' :
        \ _ == 'VISUAL' ? 'V' :
        \ _ == 'V-LINE' ? 'VL' :
        \ _
endfunction

" no -- INSERT -- etc.. (will be displayed by lightline)
set noshowmode
"-------------------------------------------------------------------------------
" bufferline
"-------------------------------------------------------------------------------
let g:bufferline_active_buffer_left=''  " ''  " ❨
let g:bufferline_active_buffer_right=''  " ''  " ❩
let g:bufferline_echo=1
let g:bufferline_modified='+'
let g:bufferline_rotate=0
let g:bufferline_show_bufnr=0
let g:bufferline_solo_highlight=0
"-------------------------------------------------------------------------------
" goyo.vim
"-------------------------------------------------------------------------------
nnoremap <Leader><Space> :Goyo<CR>
let g:goyo_linenr = 0
let g:goyo_width = 120
"-------------------------------------------------------------------------------
" Syntastic
"-------------------------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python3'
"let g:syntastic_ignore_files = ['\.py$']
"-------------------------------------------------------------------------------
" jedi-vim
"-------------------------------------------------------------------------------
let g:jedi#show_call_signatures='2' " 1 - default (popup), 2 - commandline
let g:jedi#usages_command='<Leader>u'
"-------------------------------------------------------------------------------
" Unite
"-------------------------------------------------------------------------------
if executable('ag')
    call denite#custom#option('default', {'prompt': '❭'})
    call denite#custom#var('file_rec', 'command',
                \ ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '--ignore', '.git', '-g', ''])
endif
nnoremap <Leader>b :<C-u>Denite buffer<CR>
nnoremap <Leader>e :<C-u>DeniteBufferDir file_rec<CR>
nnoremap <Leader>E :<C-u>Denite file_rec<CR>
"-------------------------------------------------------------------------------
" File browsing - included plugin netrw
"-------------------------------------------------------------------------------
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
"-------------------------------------------------------------------------------
" SideSearch
"-------------------------------------------------------------------------------
nnoremap <Leader>7 :SideSearch <C-r><C-w><CR> | wincmd p
"-------------------------------------------------------------------------------
" Magit
"-------------------------------------------------------------------------------
let g:magit_show_help = 0
"-------------------------------------------------------------------------------
" GitGutter
"-------------------------------------------------------------------------------
let g:gitgutter_map_keys = 0
"-------------------------------------------------------------------------------
" vim-javascript
"-------------------------------------------------------------------------------
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_undefined  = "¿"
"-------------------------------------------------------------------------------
" Latex
"-------------------------------------------------------------------------------
let g:vimtex_mappings_enabled=0
let g:vimtex_fold_enabled=1
let g:vimtex_format_enabled=1
"-------------------------------------------------------------------------------
" Neovim terminal mode \o/
"-------------------------------------------------------------------------------
tnoremap <Leader><Esc> <C-\><C-n>
"-------------------------------------------------------------------------------
" deoplete
"-------------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
"-------------------------------------------------------------------------------
" csupport
"-------------------------------------------------------------------------------
let g:C_Ctrl_j = 'off'
"-------------------------------------------------------------------------------
" arduino
"-------------------------------------------------------------------------------
let g:arduino_dir='~/.tools/arduino-1.8.2'
nnoremap <buffer> <Leader>Au :ArduinoUpload<CR>
nnoremap <buffer> <Leader>As :ArduinoUploadAndSerial<CR>
"-------------------------------------------------------------------------------
" buggy qterminal? buggy neovim?
"-------------------------------------------------------------------------------
set guicursor=
"-------------------------------------------------------------------------------
" WhichKey
"-------------------------------------------------------------------------------
nnoremap <Leader> :<c-u>WhichKey ','<CR>
