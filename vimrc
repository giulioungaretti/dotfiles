set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"""""""""""""""""""""""""""""""""""
" 		plugins
"""""""""""""""""""""""""""""""""""
 " {{{
 " ptyhon pep8
Plugin 'scrooloose/syntastic'
 " window managment
Plugin 'wesQ3/vim-windowswap'
" undo treee
Plugin 'sjl/gundo.vim'
"remove and highlight trailing spaces
Plugin 'bronson/vim-trailing-whitespace'
"tmux seamless movement
Plugin 'christoomey/vim-tmux-navigator'
"indent highlight
Plugin 'Yggdroot/indentLine'
"autoclose
Plugin 'Townk/vim-autoclose'
" sublime like mutiple cursors
Plugin 'terryma/vim-multiple-cursors'
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" add git gutter
Plugin 'airblade/vim-gitgutter'
" tree bar
Plugin 'scrooloose/nerdtree'
" cntrl p
Plugin 'kien/ctrlp.vim'
" nerd commenter
Plugin 'scrooloose/nerdcommenter'
" Fugtive
Plugin 'tpope/vim-fugitive'
" tasklist leader-t
Plugin 'TaskList.vim'
" new command ds, cs, and yss i
Plugin 'tpope/vim-surround'
"nice status bar
Plugin 'itchyny/lightline.vim'
" structure of  file
Plugin 'majutsushi/tagbar'
" add :Gist command
Plugin 'mattn/gist-vim'
"super tab
Plugin 'ervandew/supertab'
" add colorscheme
Plugin 'chriskempson/base16-vim'
" jedi for ptyhon
Plugin 'davidhalter/jedi-vim'
"}}}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""
"	 Visual tweaks
"""""""""""""""""""""""""""""""""""""""
" turn on syntax highlight
set timeoutlen=1000 ttimeoutlen=10
syntax on
" show curret line
:set cursorline
" customize appeararance to light grayish  bg
" hi CursorLine cterm=NONE ctermbg=234  " uselsess when using great base 16
" turn on linenumbers
:set number
"remove ugly ass separator
set fillchars=""
"show bar
set laststatus=2
 " visual autocomplete for command menu
set wildmenu
"256 color base 16 theme
let base16colorspace=256
let &t_Co=256
colorscheme base16-default
"""""""""""airline""""""""""""""""""""
"{{{
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ' Y '  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
"}}}
"""""""""""""""""""""""""""""""""""""""
"	 		misc  tweaks
"""""""""""""""""""""""""""""""""""""""
set nobackup
set noswapfile
" tmux copypaste integration
if $TMUX == ''
		set clipboard=unnamed
endif

" tab is 4 spaces
set clipboard=unnamed
set tabstop=4
set clipboard=unnamed
" allows cursor change in tmux mode
 if exists('$TMUX')
     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"kill useless keys
"{{{
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
map <BS> <Nop>
map <Del> <Nop>
" }}}

:setlocal spell
:setlocal spell spelllang=en_us
" special mode line at end of file
set modelines=1
" 			folding {{{
set foldenable  " enalbe folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10  " max 10 nested fold allower
set foldmethod=indent " fold based on indent level
" }}}

"""""""""""""""""""""""""""""""""""""""
"			 aliases
"""""""""""""""""""""""""""""""""""""""
" {{{
"coveneient stuff
inoremap jj <Esc>
" esc esc to save
map <Esc><Esc> :w<CR>
" toogle relative line numbers
nnoremap <silent><leader>o :set relativenumber!<cr>
map <silent><leader>bl :set background=light<cr>
map  <silent><leader>bd :set background=dark<cr>
" split right and below instead of default opposite
set splitbelow
set splitright
"}}}
""""""""" common typos""""""""""""
command Q q
command W w
""""""""" plug ins  """"""""""""
" map nerd tree to leader n
map <silent><leader>n :NERDTreeFocus<CR>
" remap jedi usage to leader u
let g:jedi#usages_command = "<leader>u"
nmap <F8> :TagbarToggle<CR>
nnoremap <F5> :GundoToggle<CR>
" fugitive git bindings
" add current file
nnoremap <leader>ga :Git add %:p<CR><CR>
" status
nnoremap <leader>gs :Gstatus<CR>
" commit added files
nnoremap <leader>gc :Gcommit -q<CR>
" add and commit current file
nnoremap <leader>gt :Gcommit -v -q  %:p<CR>
" open task list
map <leader>td <Plug>TaskList
" tagbar autofous on open
let g:tagbar_autofocus = 1
"reload on save
autocmd! bufwritepost .vimrc source %
" vim:foldmethod=marker:foldlevel=1
