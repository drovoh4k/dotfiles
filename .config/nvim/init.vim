" .........................................................
" # Plugins
" .........................................................


call plug#begin('~/.config/nvim/plugged')


" ## General Utilities
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify' " Start screen

" ## Editor Utilities
Plug 'lukas-reineke/indent-blankline.nvim' " Show indentation lines
Plug 'tpope/vim-commentary' " Comment lines easily
Plug 'jiangmiao/auto-pairs' " Autopair quotes, parentheses, etc.

" ## Navegation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " General fuzzy finder
Plug 'preservim/nerdtree' " Tree

" ## Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


" .........................................................
" # Settings
" .........................................................


" ## General
set mouse=a " Allow mouse interaction

" ## Lines
set nowrap " No wrap lines (display long lines)
set number " Display long lines
" set relativenumber " Show relative line numbers
set cursorline " Hightlight current line

" ## Indenting
set autoindent
set smartindent " Does the right thing (mostly)
set cindent " Stricter rules for C programs

" ## Theme & Colorscheme
set termguicolors " Active true colors on terminal
syntax on
set t_Co=256
colorscheme onehalflight


" .........................................................
" # Mappings
" .........................................................


" Include mappings


" .........................................................
" # Custom Commands and Autocommands
" .........................................................


" Include custom commands and autocommands


" .........................................................
" # Plugins Settings
" .........................................................


" ## Vim-Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='violet'

" ## NERDTree
map <F2> :NERDTreeToggle<CR>
