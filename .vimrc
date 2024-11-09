let mapleader=" "
" Colorscheme
syntax on
au GUIEnter * simalt ~x " startup window maximized
colorscheme desert
set background=dark
set splitbelow

set number
set clipboard=unnamed
set guifont=JetBrainsMono\ NFM:h10
set colorcolumn="80"
set history=500

let g:font_size=11
function! AdjustFontSize(amount)
    let g:font_size = g:font_size + a:amount
    let font='JetBrainsMono\ NFM:h'.g:font_size
    :execute "set guifont=".font
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

" Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Remap VIM 0 to first non-blank character
map 0 ^

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" thuytv personal configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" moving between windows
map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k

" managing buffers
nmap <S-l> <cmd> bnext <cr>
nmap <S-h> <cmd> bprevious <cr>
map <leader>c <cmd> bdelete <cr>

" editing
imap jk <esc>
imap kj <esc>
map <leader>w <cmd> w! <cr>
cmap <S-p> <C-r>+

vmap p "_dP
vmap < <gv
vmap > >gv

map <leader>h <cmd>noh<cr>

" Map auto complete of (, ", ', [
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap < <><Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

function! NetrwToggle()
  if &ft ==# "netrw"
    Rex
  else
    Ex
  endif
endfunction
map <leader>e <cmd> call NetrwToggle() <cr>

function! QuickFixToggle()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
map <leader>q <cmd> call QuickFixToggle() <cr>

command! Cd :cd %:p:h
command! Bdall :%bd|e#
map <leader>c <cmd> call Bdall() <cr>

" gui config
set vb t_vb=
set go+=c
set go+=d
set go+=i
set go-=m
set go-=t
set go-=T
set go-=r
set go-=R
set go-=l
set go-=h
set go-=L

" Terminal
nmap <C-t> <cmd> terminal C:\msys64\usr\bin\bash.exe <cr>
tmap <esc><esc> <c-\><c-n>
tmap <C-t> <c-\><c-n>:bdelete!<cr>
tmap <S-p> <C-w>"+
