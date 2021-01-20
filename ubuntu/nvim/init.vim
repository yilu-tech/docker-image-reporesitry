syntax on
set guicursor=

set cole&

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

set number
set relativenumber
set ruler
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set nocompatible
set splitright
set splitbelow
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

autocmd FileType php set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType java set tabstop=4|set shiftwidth=4|set expandtab

let mapleader="\<Space>"

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

call plug#begin('~/.vim/plugged')


call plug#end()
