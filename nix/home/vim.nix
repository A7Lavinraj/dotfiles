{ ... }:

{
  enable = true;
  extraConfig = ''
    set number
    set relativenumber
    set autoindent
    set tabstop=4
    set shiftwidth=4
    set smarttab
    set mouse=a
    set clipboard=unnamed
    set termguicolors
    set scrolloff=8
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
  '';
}
