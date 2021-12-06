" .........................................................
" # Plugins
" .........................................................


call plug#begin('~/.config/nvim/plugged')

" ## General Utilities
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ## Editor Utilities
Plug 'lukas-reineke/indent-blankline.nvim'

" ## Navegation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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
"set relativenumber " Show relative line numbers
set cursorline " Hightlight current line

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
