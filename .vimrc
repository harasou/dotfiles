" neobundle
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin'  : 'make -f make_cygwin.mak',
      \     'mac'     : 'make -f make_mac.mak',
      \     'unix'    : 'gmake -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Align'
NeoBundle 'harasou/quickmemo.vim'
NeoBundle 'altercation/vim-colors-solarized'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck


" search
set noincsearch
set ignorecase
set smartcase
nnoremap  N           Nzz
nnoremap  n           nzz
nnoremap  #           :<C-u>set hlsearch<CR>#
nnoremap  *           :<C-u>set hlsearch<CR>*
nnoremap  /           :<C-u>set hlsearch<CR>/
nnoremap  ?           :<C-u>set hlsearch<CR>?
nnoremap  <Esc><Esc>  :<C-u>set nohlsearch<CR><Esc>


" move
nnoremap  z           z<CR>
nnoremap  <C-e>       <C-e>j
nnoremap  <C-y>       <C-y>k

nnoremap  <C-h>       <C-w>h
nnoremap  <C-j>       <C-w>j
nnoremap  <C-k>       <C-w>k
nnoremap  <C-l>       <C-w>l


" edit
nnoremap  <F8>        :<C-u>source %<CR>
nnoremap  <C-a>       ggVG
vnoremap  <           <gv
vnoremap  >           >gv


" help
nnoremap <C-h> :<C-u>vertical belowright help<Space><C-r><C-w>


" options
syntax on
set number
set numberwidth=5
set nowrap
set scrolloff=1
set clipboard+=unnamed
set virtualedit=all
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set wildmenu
set showcmd
set noswapfile

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4


" unite
nnoremap  [unite]  <Nop>
nmap      ;        [unite]
nnoremap  <silent> [unite]b    :<C-u>Unite -no-split buffer<CR>
nnoremap  <silent> [unite]d    :<C-u>UniteWithBufferDir -no-split file<CR>
nnoremap  <silent> [unite]f    :<C-u>Unite -no-split file<CR>
nnoremap  <silent> [unite]l    :<C-u>Unite -no-split line<CR>
nnoremap  <silent> [unite]m    :<C-u>Unite -no-split file_mru<CR>
nnoremap  <silent> [unite]u    :<C-u>Unite -no-split<Space>

" surround
nmap s  <Plug>Ysurround
nmap ss <Plug>Yssurround

" align
let g:Align_xstrlen=3

" quickmemo
let quickmemo_save_path = "~/Dropbox/Memo/%Y/%m"
let quickmemo_list_unite_option = "-no-split -auto-preview"
