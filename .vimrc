runtime bundle/vim-pathogen/autoload/pathogen.vim

" http://stackoverflow.com/questions/4261785/temporarily-disable-some-plugins-using-pathogen-in-vim
" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'markdown')
" call add(g:pathogen_disabled, 'vim-markdown-plasticboy')

set nocompatible

call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

set ruler
set linebreak

" Use UTF-8.
set encoding=utf-8

" Add line numbers.
set number

" Copy indent from current line when starting a new line 
set autoindent
set smartindent

" Number of spaces to insert for a <tab>
set tabstop=2
set shiftwidth=2
" Insert spaces when the <tab> key is pressed
set expandtab
set smarttab

" To save, ctrl-s.
" nmap <c-s> :w<CR>
" imap <c-s> <Esc>:w<CR>a

" Search related
set incsearch
set ignorecase
set smartcase

" if $COLORTERM == 'gnome-terminal'
"   set t_Co=256
" endif

" if has("gui_running")
"   colorscheme jellybeans
" else
"   colorscheme elflord
" endif

colorscheme jellybeans

set cursorline
" set cursorcolumn

" Show NERDTree when vim starts
" autocmd VimEnter * NERDTree

" Config the NERDTree
nmap <silent> tt :NERDTreeToggle<cr>

imap <c-j> <Down>
imap <c-k> <Up>
imap <c-h> <left>
imap <c-l> <Right>

" vim tab binding
nnoremap tn :tabnew %<cr>
nnoremap tc :tabclose<cr>
nnoremap th :tabprev<cr>
" nnoremap th gT
nnoremap tl :tabnext<cr>
" nnoremap tl gt

let NERDSpaceDelims = 1
let NERDCompactSexyComs = 1

" map \a for ack current word in new tab
nmap <Leader>a tn:Ack <cword><CR>
" nmap <Leader>a tn:Ack <cWORD><CR>

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 20
" let g:CommandTMatchWindowReverse = 1
