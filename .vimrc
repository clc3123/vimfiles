runtime bundle/vim-pathogen/autoload/pathogen.vim

" http://stackoverflow.com/questions/4261785/temporarily-disable-some-plugins-using-pathogen-in-vim
let g:pathogen_disabled = []
" call add(g:pathogen_disabled, 'markdown')
call add(g:pathogen_disabled, 'vim-markdown-plasticboy')

set nocompatible

call pathogen#infect()
" call pathogen#helptags()
syntax on
filetype plugin indent on

set noswapfile

set t_Co=256
colorscheme jellybeans
" https://github.com/tomasr/molokai
" colorscheme molokai
" if has("gui_running")
"   colorscheme jellybeans
" endif

" let g:netrw_list_hide = '^\.,\~$,^tags$'

set wrap
set linebreak
let &showbreak = '>>> '
set scrolloff=1
set display+=lastline
" Add line numbers
" set number
" show cursor position
set ruler
set cursorline
" set cursorcolumn
" set wildmenu
set showcmd
set laststatus=2

" Use UTF-8
set encoding=utf-8
set termencoding=utf-8

set autoread

set listchars=eol:▼,tab:▶\ ,trail:◀,nbsp:□

" Increment ctrl+a or decrement ctrl+x number under cursor
set nrformats=octal,hex

" MappingTimeout = 1000ms; KeycodeTimeout = 100ms
set ttimeout
set ttimeoutlen=100

" Copy indent from current line when starting a new line 
set autoindent
set smartindent
" Backspace action setting for insert mode
set backspace=indent,eol,start

" highlight matching bracket for a short period
set showmatch
set matchtime=10

" Insert spaces when the <tab> key is pressed
set expandtab
" Leave &softtabstop to be 0 as default to turn softtabstop off
set tabstop=2
set shiftwidth=2
" Indent >/< to multiple of &shiftwidth, equal to ctrl+t/ctrl+d in insert mode
set shiftround
set smarttab

" Search related
set incsearch
" Highlight search result
set hlsearch
set ignorecase
set smartcase

nmap <silent> tt :NERDTreeToggle<cr>

imap <c-j> <Down>
imap <c-k> <Up>
imap <c-h> <left>
imap <c-l> <Right>

" vim tab binding
nnoremap tn :tabnew "getcwd()"<cr>
nnoremap tc :tabclose<cr>
nnoremap th :tabprev<cr>
nnoremap tl :tabnext<cr>

" toggle list mode
nmap <Leader>l :set list!<cr>

let NERDSpaceDelims = 1
let NERDCompactSexyComs = 1

" map \a for ack current word in new tab
nmap <Leader>a tn:Ack <cword><CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 20
