runtime bundle/vim-pathogen/autoload/pathogen.vim

" http://stackoverflow.com/questions/4261785/temporarily-disable-some-plugins-using-pathogen-in-vim
let g:pathogen_disabled = []
" call add(g:pathogen_disabled, 'markdown')

set nocompatible

" Use UTF-8
set encoding=utf-8
set termencoding=utf-8
" set fileencoding=utf-8
if has('win32')
  set guifont=Ubuntu_Mono:h16
endif

call pathogen#infect()
" Instead of generating plugin docs when VIM starts up, you can do it lazy with :Helptags.
" call pathogen#helptags()
syntax on
filetype plugin indent on

set noswapfile

set t_Co=256

" colorscheme molokai
colorscheme Tomorrow-Night-Bright
" colorscheme Tomorrow-Night
" colorscheme jellybeans
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
set number
" show cursor position
set ruler
set cursorline
" set cursorcolumn
" set wildmenu
set showcmd
set laststatus=2

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

set fdm=marker

" highlight matching bracket for a short period
" set showmatch
" set matchtime=10

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
nmap <Leader>x <Plug>ToggleAutoCloseMappings

" imap <C-J> <Down>
" imap <C-K> <Up>
" imap <C-H> <Left>
" imap <C-L> <Right>

" vim tab binding
nnoremap tn :tabnew "getcwd()"<cr>
nnoremap td :tabnew %:p<cr>
nnoremap tc :tabclose<cr>
nnoremap th :tabprev<cr>
nnoremap tl :tabnext<cr>

" toggle list mode
nmap <Leader>l :set list!<cr>

let NERDSpaceDelims = 1
let NERDCompactSexyComs = 1

" map \a for ack current word in new tab
nmap <Leader>a :Ack <cword><CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_color_change_percent = 10

let g:ctrlp_prompt_mappings = {
  \ 'PrtClearCache()':      ['<F5>', '<c-c>'],
  \ 'PrtExit()':            ['<esc>', '<c-g>'],
  \ }

" ((( vim-ack setting
let g:ackprg="/usr/local/bin/ack -H --nocolor --nogroup --column"
" ))) vim-ack setting

" ((( mappings extracted from https://github.com/tpope/vim-unimpaired/blob/master/plugin/unimpaired.vim
function! s:setup_paste() abort
  let s:paste = &paste
  set paste
endfunction

nnoremap <silent> <SID>unimpairedPaste :call <SID>setup_paste()<CR>
nnoremap <silent> <script> yp  <SID>unimpairedPastea
nnoremap <silent> <script> yP  <SID>unimpairedPastei
nnoremap <silent> <script> yo  <SID>unimpairedPasteo
nnoremap <silent> <script> yO  <SID>unimpairedPasteO
nnoremap <silent> <script> yA  <SID>unimpairedPasteA
nnoremap <silent> <script> yI  <SID>unimpairedPasteI
nnoremap <silent> <script> ygi <SID>unimpairedPastegi
nnoremap <silent> <script> ygI <SID>unimpairedPastegI

augroup unimpaired_paste
  autocmd!
  autocmd InsertLeave *
        \ if exists('s:paste') |
        \   let &paste = s:paste |
        \   unlet s:paste |
        \ endif
augroup END

function! s:BlankUp(count) abort
  put!=repeat(nr2char(10), a:count)
  ']+1
  silent! call repeat#set("\<SID>unimpairedBlankUp", a:count)
endfunction

function! s:BlankDown(count) abort
  put =repeat(nr2char(10), a:count)
  '[-1
  silent! call repeat#set("\<SID>unimpairedBlankDown", a:count)
endfunction

nnoremap <silent> <SID>unimpairedBlankUp   :<C-U>call <SID>BlankUp(v:count1)<CR>
nnoremap <silent> <SID>unimpairedBlankDown :<C-U>call <SID>BlankDown(v:count1)<CR>

nmap [<Space> <SID>unimpairedBlankUp
nmap ]<Space> <SID>unimpairedBlankDown

function! s:Move(cmd, count, map) abort
  normal! m`
  exe 'move'.a:cmd.a:count
  norm! ``
  silent! call repeat#set("\<SID>unimpairedMove".a:map, a:count)
endfunction

nnoremap <silent> <SID>unimpairedMoveUp   :<C-U>call <SID>Move('--',v:count1,'Up')<CR>
nnoremap <silent> <SID>unimpairedMoveDown :<C-U>call <SID>Move('+',v:count1,'Down')<CR>
xnoremap <silent> <SID>unimpairedMoveUp   :<C-U>exe 'exe "normal! m`"<Bar>''<,''>move--'.v:count1<CR>``
xnoremap <silent> <SID>unimpairedMoveDown :<C-U>exe 'exe "normal! m`"<Bar>''<,''>move''>+'.v:count1<CR>``

nmap [e <SID>unimpairedMoveUp
nmap ]e <SID>unimpairedMoveDown
xmap [e <SID>unimpairedMoveUp
xmap ]e <SID>unimpairedMoveDown
" ))) mappings extracted from https://github.com/tpope/vim-unimpaired/blob/master/plugin/unimpaired.vim
