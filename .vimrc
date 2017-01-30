" vim != vi
set nocompatible

" ================== General ==================
set number                      " Enable line numbers
set esckeys                     " Cursor keys in insert mode
set cursorline                  " Highlight current line
set ttyfast                     " Optimize for fast terminal connections
set clipboard=unnamed           " Use OS clipboard
set backspace=indent,eol,start  " Allow backspace in insert mode
set encoding=utf-8 nobomb       " Use UTF-* without BOM
set shell=/usr/bin/zsh          " Don't use Bash

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

let mapleader=","               " Change mapleader

" ================== display ==================
set title           " Display filename in window titlebar
set laststatus=2    " Always show status line
set noerrorbells    " Disable error bells
set nostartofline   " Don't reset cursor to start of line when moving around
set shortmess=atI   " Disable Vim intro message during start
set showcmd         " Display the (partial) command as it's typed

syntax on           " Enable syntax highlighting

" ================== Search ==================
set hlsearch        " Highlight searches
set ignorecase      " Ignore case for searches
set incsearch       " Highlight dynamically as pattern is typed

" ================== Scrolling ==================
set scrolloff=3     " Start scrolling when we're 3 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================== Completion ==================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.pyc

" ================== swapfiles ==================
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" ================== indentation ==================
set tabstop=4       " The width of a TAB is set to 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Enable automatic indentation
filetype plugin on
filetype indent on

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" ================== Plugins ==================
" Poor man's bundler
execute pathogen#infect()

" https://github.com/NLKNguyen/papercolor-theme
colorscheme PaperColor

" NerdTree
let NERDTreeIgnore=['.pyc$', '\~$', '__pycache__$', '.git$', '.*\.egg.*$', '.tox', '.coverage.*']
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_new_tab=0
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Automatically open NerdTree when vim started with no args
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim when NerdTree is only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NerdTree Git Plugin symbols
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✭",
    \ "Staged"    : "+",
    \ "Untracked" : "±",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "×",
    \ "Dirty"     : "☢",
    \ "Clean"     : "⚛",
    \ "Unknown"   : "?"
    \ }

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_style_error_symbol="⚠"
let g:syntastic_style_warning_symbol="⚠"
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args=''
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']

" Airline
let g:airline_theme = "PaperColor"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Gitgutter
let g:gitgutter_sign_column_always = 1
let g:gitgutter_on_bufenter = 0
let g:gitgutter_all_on_focusgained = 0

" Ctrlp
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_lazy_update = 350
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0

" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_close_preview = 1

" The Silver Searcher
if executable("ag")
        set grepprg=ag\ --nogroup\ --nocolor
        let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

" ================== Languages ==================
" Golang
let g:go_fmt_command = "goimports"

" FileType specific settings
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2|set expandtab
autocmd FileType c setlocal shiftwidth=4 tabstop=4|set noic cin noexpandtab
autocmd FileType make setlocal shiftwidth=4 tabstop=4|set noic cin noexpandtab
autocmd FileType python setlocal sw=4 sts=4|set expandtab autoindent
