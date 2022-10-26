" GENERAL "
""""""""""""""""""
set background=dark  
set nu rnu 
syntax on
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
let mapleader = ","
set history=500
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ai
set si
set wrap
set so=7
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
set backspace=2
set belloff=all

let vim_markdown_preview_github=1

set wildmenu
set path+=**

"Sets noexpandtab when editing a Makefile
if has("autocmd")
  autocmd FileType make set noexpandtab
endif


"open at right point, retains cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"fix swaps
set undodir=~/.vim/undodir
set undofile


"Notes Plugin
:let g:notes_suffix = '.txt'

" map <leader>nn :NERDTreeToggle<CR><C-w>H:vertical res -20<cr> 
autocmd bufenter * if (winnr("$") == 1 && exists("b:zsh") && b:NERDTree.isTabTree()) | q | endif
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" let g:NERDTreeWinPos = "right"

" TERMINAL "
""""""""""""""""""""""""
" function OpenTerm()
"   if (winnr("$") == 1 && exists("b:termIsOpen") && b:termIsOpen) 
"     let b:termIsOpen = false
"     return true
"   else
"     let b:termIsOpen = true
"     :bot :term ++close<cr><C-w>:res -10<cr> 
"     return false
"   endif

"   let b:termIsOpen
" endfunction

" nnoremap <silent><leader>tt OpenTerm()
" tnoremap <silent><leader>tt OpenTerm() exit<cr>
nnoremap <silent><leader>tt :bot :term ++close<cr><C-w>:res -10<cr> 
tnoremap <silent><leader>tt exit<cr>


"f5 to run 
autocmd filetype python nnoremap <F5> :w <bar> !python3 % <CR>
autocmd filetype java nnoremap <F5> :w <bar> !javac % && java -enableassertions %:r <CR>


" REMAPS "
"""""""""""""""""""""

noremap <C-k> {
noremap <C-j> }
noremap Y y$
noremap j gj
noremap k gk
noremap <leader>sn ]s
noremap <leader>sN [s
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <S-Tab> <<<Esc>gv
vnoremap <Tab>   >><Esc>gv
nnoremap <space> za


" Alt move
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"change cwd to directory of file 
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"Toggle spell
map <leader>ss :setlocal spell!<cr>

"Split Resizing
let g:vim_resize_disable_auto_mappings = 1
nnoremap <silent> <left> :CmdResizeLeft <cr>
nnoremap <silent> <down> :CmdResizeDown <cr>
nnoremap <silent> <up> :CmdResizeUp <cr>
nnoremap <silent> <right> :CmdResizeRight <cr>

"Auto-Pairs
let g:AutoPairsMultilineClose = 0


" Vundle "
"""""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

"""""""""""""""""""""""
" Plugins "
"""""""""""""""""""""""
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive' 
Plugin 'itchyny/lightline.vim'
Plugin 'shime/vim-livedown'
"Plugin 'wakatime/vim-wakatime'
"Plugin 'vimwiki/vimwiki'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
"Plugin 'christoomey/vim-tmux-navigator'
Plugin 'breuckelen/vim-resize' 
"Plugin 'valloric/youcompleteme'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ap/vim-css-color'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'tpope/vim-commentary'
Plugin 'pocke/keycast.vim'
Plugin 'pocke/vanner'
" Plugin 'davidhalter/jedi-vim'

" End Vundle"
"""""""""""""""""""""""""
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""

""""""""""""""
" Nerd Tree"
""""""""""""""
map <leader>nn :NERDTreeToggle<CR><C-w>H:vertical res -20<cr> 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeWinPos = "right"

"""""""""""""
"Status Line"
"""""""""""""
if !has('gui_running')
  set t_Co=256
endif

set laststatus=2
set noshowmode


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             [ 'gitbranch', expand('%'), 'filename', 'modified', 'readonly' ] ],
      \   'right': [ [ 'percent' ],
      \              [ 'filetype'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:lightline.separator = {
      \   'left': '', 'right': ''
      \}
let g:lightline.subseparator = {
      \   'left': '', 'right': '' 
      \}

set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline


"""""""""""
"Syntastic"
"""""""""""
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0
let g:syntastic_enable_highlighting = 1
"let g:syntastic_python_python_exec = 'python3'
"let g:syntastic_python_checkers = ['python']


""""""""""""""""""""
" Helper Functions "
""""""""""""""""""""

