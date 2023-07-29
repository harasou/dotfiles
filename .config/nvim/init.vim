" vim-plug なかったら落としてくる
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 足りないプラグインがあれば :PlugInstall を実行
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('$HOME/.local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'lambdalisue/fern.vim'
Plug 'harasou/quickmemo.vim'
call plug#end()

nnoremap <silent> <Leader>e :Fern . -drawer -width=40 -toggle<CR>
let quickmemo_save_path = "~/.notable/%Y/%m"

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
nnoremap  <C-]>       g<C-]>
nnoremap  v<C-]>      :vsp<CR><C-w><C-w>:exec("tag ".expand("<cword>"))<CR>


" move
nnoremap  j           gj
nnoremap  k           gk

nnoremap  z           z<CR>
nnoremap  <C-e>       <C-e>j
nnoremap  <C-y>       <C-y>k

nnoremap  <C-h>       <C-w>h
nnoremap  <C-j>       <C-w>j
nnoremap  <C-k>       <C-w>k
nnoremap  <C-l>       <C-w>l

nnoremap  {           :<C-u>tabprevious<Cr>
nnoremap  }           :<C-u>tabnext<Cr>

" edit
nnoremap  <F8>        :<C-u>source %<CR>
nnoremap  <C-a>       ggVG
vnoremap  <           <gv
vnoremap  >           >gv


" options
syntax on
set number
set numberwidth=5
set nowrap
set scrolloff=1
set clipboard+=unnamed
set virtualedit=all
set laststatus=2
set encoding=utf8
set fileformats=unix,dos,mac
set backspace=indent,eol,start
set wildmenu
set showcmd
set noswapfile

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
