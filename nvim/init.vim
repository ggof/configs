call plug#begin()
Plug 'psliwka/vim-smoothie'

Plug 'tpope/vim-commentary'

Plug 'junegunn/fzf' 
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'sheerun/vim-polyglot'
Plug 'gleam-lang/gleam.vim'

Plug 'jiangmiao/auto-pairs'
call plug#end()

filetype plugin indent on
syntax enable

set number relativenumber 
set termguicolors
set noshowmode
set ruler
set ts=2
set shiftwidth=2
set ai sw=2
set expandtab

let mapleader=' '

let g:airline_theme='base16_eighties'
colorscheme base16-eighties
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none

" LSP keybinds
nm <silent> <leader>sh <Plug>(lsp-hover)
nm <silent> <leader>sf <Plug>(lsp-format)
nm <silent> <leader>sr <Plug>(lsp-references)
nm <silent> <leader>sd <Plug>(lsp-definition)
nm <silent> <leader>sc <Plug>(lsp-code-action)

nm <ESC> :noh<CR>

nm <c-p> :Files<CR>
