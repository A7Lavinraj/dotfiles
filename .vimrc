:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set mouse=a
:set clipboard=unnamed
:set termguicolors
:set scrolloff=10
colorscheme tokyonight

syntax on

filetype on
filetype indent on 

inoremap { {}<left>
inoremap {<CR> {<CR>}<Esc>O
inoremap { {
inoremap {} {}
map <C-a> <Esc>ggVGy<CR>

autocmd BufNewFile *.cpp 0r /home/user/cp/template.cpp
autocmd filetype cpp nnoremap <F9> :w <bar> !clear && g++ -o %:r.exe<CR>
autocmd filetype cpp nnoremap <F10> :!./%:r.exe<CR>

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

call plug#begin() 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline_powerline_fonts=1
let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_splits=0
let g:airline#extensions#tabline#show_close_button=0

if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
