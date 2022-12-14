set number					" Show the line number
set encoding=utf-8
set tabstop=4               " number of columns occupied by a tab 
set shiftwidth=4            " width for autoindents
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
"set mouse=a                 " enable mouse click
set cursorline              " highlight current cursorline
"set clipboard=unnamedplus   " using system clipboard

":syntax on                   " syntax highlighting


call plug#begin("~/.vim/plugged")

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'					" show the fancy powerline status bar.
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto completion tools

call plug#end()

" Set vim theme to dracula.
colorscheme dracula
set termguicolors
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1

" Set airline tabline.
let g:airline#extensions#tabline#enabled = 1

" nnoremap: maps the key in normal mode
" Change the shortcut to trigger nerd tree (Ctrl+t)
nnoremap <C-t> :NERDTreeToggle<CR>

" Change the symbol show in nerd tree.
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeShowHidden=1				" Let nerdtree show hidden files.

" Set the <leader> key for nerdcommenter
let mapleader="n"

" Tab navigation like Firefox.
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>

" Set current conda environment as python interpreter
let conda_default_env = $CONDA_DEFAULT_ENV
if conda_default_env == 'base'
  let env_name = 'neovim'
else
  let env_name = conda_default_env
endif
let bin_python = expand('~') . '/miniconda3/envs/' . env_name . '/bin/python'
if filereadable(bin_python)
  let g:python3_host_prog = bin_python
endif

source $HOME/.config/nvim/plug-config/coc.vim
