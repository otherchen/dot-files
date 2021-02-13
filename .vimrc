" vim-plug auto install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
 
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Color Schemes
Plug 'morhetz/gruvbox'

" Visual Layout
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

" Tools - Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Tools - Commenting
Plug 'tpope/vim-commentary'

" Language Support
Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Lint & Error Checking
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Initialize plugin system
call plug#end()

" General configs
set ruler                           " Show row and column ruler information
set number	        	    " Show line numbers
set linebreak	        	    " Break lines at word (requires Wrap lines)
set showbreak=+++		    " Wrap-broken line prefix
set textwidth=100		    " Line wrap (number of cols)
set showmatch	        	    " Highlight matching brace

set hlsearch			    " Highlight all search results
set smartcase			    " Enable smart-case search
set ignorecase			    " Always case-insensitive
set incsearch			    " Searches for strings incrementally

set autoindent			    " Auto-indent new lines
set expandtab			    " Use spaces instead of tabs
set shiftwidth=2		    " Number of auto-indent spaces
set smartindent			    " Enable smart-indent
set smarttab			    " Enable smart-tabs
set softtabstop=2		    " Number of spaces per Tab
set backspace=indent,eol,start      " Backspace behavior

set clipboard=unnamed   	    " Use system clipboard
set undolevels=1000		    " Number of undo levels
set virtualedit=onemore             " Go on char past EOL
set laststatus=2                    " Always show status bar
set signcolumn=yes                  " Always show sign column
set mouse=a                         " Allow mouse clicks
set cursorline                      " Highlight the current line
set list listchars=tab:▸\ ,trail:·  " Column space / tab indicator
set tabstop=2                       " Change the length of tabs

" Backup Configs
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//
set backup

" Colorscheme Configs
set background=dark                 " Uses dark mode
colorscheme gruvbox                 " Uses gruvbox colorscheme

" Airline Configs
let g:airline_theme='gruvbox'       " Uses gruvbox for airline
let g:airline_powerline_fonts = 1   " Uses correct symbols/fonts

" NERDTree Configs
let NERDTreeShowHidden=1

" Vim-go Overrides
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Use AG to filter with FZF command
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" General Keybinds
inoremap jj <ESC>l
nnoremap ww :w<Enter>
nnoremap qq :q<Enter>
nnoremap ff :Files<Enter>

" Navigation Keybinds
map H ^
map L $l
nnoremap K 10k
nnoremap J 10j

" Indentation Keybinds
vnoremap < <gv
vnoremap > >gv

" Navigate splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" automatic bracket formatting on newlines
inoremap {<CR> {<CR>}<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O

" Always show the current file when opening NERDTree
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeFind"
  endif
endfunction

nnoremap <Leader>f :call NERDTreeToggleInCurDir()<CR>
