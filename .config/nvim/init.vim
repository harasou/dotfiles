if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_self = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_self)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_self
endif
execute 'set runtimepath^=' . s:dein_self
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#add(s:dein_self)
  call dein#add('Shougo/denite.nvim')
  call dein#add('harasou/quickmemo.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-go')
  call dein#add('benekastah/neomake')
  call dein#add('fatih/vim-go')
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

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


" denite
nnoremap  [denite]  <Nop>
nmap      ;        [denite]
nnoremap  <silent> [denite]b    :<C-u>Denite -auto-preview -mode=normal buffer<CR>
nnoremap  <silent> [denite]f    :<C-u>DeniteProjectDir file_rec<CR>
nnoremap  <silent> [denite]g    :<C-u>Denite grep -mode=normal<CR>
nnoremap  <silent> [denite]l    :<C-u>Denite line<CR>
nnoremap  <silent> [denite]d    :<C-u>Denite <Space>

" quickmemo
let quickmemo_save_path = "~/Dropbox/Memo/%Y/%m" 

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction


let g:deoplete#enable_at_startup = 1
