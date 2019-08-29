" dein settings {{{
if &compatible
  set nocompatible
endif

let s:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
let s:config_dir = s:config_home . '/nvim'
let s:toml = s:config_dir . '/dein.toml'

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_self = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_self)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_self
endif
execute 'set runtimepath^=' . s:dein_self

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#add(s:dein_self)
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

let g:python_host_prog = $PYENV_ROOT . '/shims/python'
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

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

" bug https://github.com/neovim/neovim/pull/6969
set ttimeout
set ttimeoutlen=50
