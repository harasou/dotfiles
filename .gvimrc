if has('gui_running')

  "set mouse=a
  "set mousehide
  "set ttymouse=xterm2
  "set guioptions=c
  set showtabline=2
  set numberwidth=7
  set background=light
  colorscheme solarized

  if has('mac')
    set guifont=Ricty\ Regular\ for\ Powerline:h15
  endif

  let g:save_window_file = expand('~/.vim/.vimwinpos')
  augroup SaveWindow
    autocmd!
    autocmd VimLeavePre * call s:save_window()
    function! s:save_window()
      let options = [
        \ 'set columns=' . &columns,
        \ 'set lines=' . &lines,
        \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
        \ ]
      call writefile(options, g:save_window_file)
    endfunction
  augroup END
  
  if filereadable(g:save_window_file)
    execute 'source' g:save_window_file
  endif

endif
