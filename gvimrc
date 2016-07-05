set guifont=PragmataPro\ for\ Powerline:h13
set guioptions-=r
set guioptions-=L
set guioptions-=T
set guioptions-=e
set guioptions-=m
set mousehide "Hide when characters are typed
function s:CheckColorScheme()
  let g:base16colorspace=256
  let s:config_file = expand('~/.vim/.base16')
  if filereadable(s:config_file)
    let s:config = readfile(s:config_file, '', 2)

    if s:config[1] =~# '^dark\|light$'
      execute 'set background=' . s:config[1]
    else
      echoerr 'Bad background ' . s:config[1] . ' in ' . s:config_file
    endif

    if filereadable(expand('~/.nvim/plugged/base16-vim/colors/base16-' . s:config[0] . '.vim'))
      execute 'color base16-' . s:config[0]
    else
      echoerr 'Bad scheme ' . s:config[0] . ' in ' . s:config_file
    endif
  else " default
    set background=dark
    color base16-tomorrow
  endif
endfunction
autocmd GUIEnter * call s:CheckColorScheme()
autocmd GUIEnter * AirlineRefresh
