call pathogen#infect()
" call pathogen#helptags()
syntax on
" filetype plugin indent on

set nocompatible

" Use UTF-8.
set encoding=utf-8

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

" Shortcuts for moving between tabs.
" Alt-j to move to the tab to the left
noremap <A-j> gT
" Alt-k to move to the tab to the right
noremap <A-k> gt

if has("gui_running")
  colorscheme jellybeans
else
  colorscheme elflord
endif

set cursorline

" Show NERDTree when vim starts
" autocmd VimEnter * NERDTree

" Config the NERDTree
nmap <silent> tt :NERDTreeToggle<cr>

" map <F3> for ack current word
" nmap <silent> <F3> :Ack<CR>
