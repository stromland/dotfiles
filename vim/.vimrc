" Plugin
call plug#begin()

" Plugins
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'nanotech/jellybeans.vim'

call plug#end()

" Config

" Re-Mapping
" Exit insert mode with jj
imap jj <esc>
imap JJ <esc>
" Save with ctrl+s
:inoremap <C-s> <Esc>:update<CR>

" Vim
syntax on
set hidden
set formatoptions+=r
set autoindent
set expandtab
set nu
set tabstop=2
set shiftwidth=2
" Colorscheme
set t_Co=256
color jellybeans
set cc=121
autocmd ColorScheme * highlight ColorColumn ctermbg=235
