set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"""""""""""""""""""""""""""""""""""
" 		plugins
"""""""""""""""""""""""""""""""""""
" {{{
" better  js
Plugin 'pangloss/vim-javascript'
" makes iterm2 tmux and vim have sex
Plugin 'sjl/vitality.vim'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" exectute file
:Plugin 'Bexec'
" send line to tmux
Plugin 'jpalardy/vim-slime'
" autofromat code
Plugin 'Chiel92/vim-autoformat'
" emmet
Plugin 'mattn/emmet-vim'
" colorize css hexcodes
Plugin 'ap/vim-css-color'
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
" fuGITve
Plugin 'tpope/vim-fugitive'
" tasklist leader-t
Plugin 'TaskList.vim'
" new command ds, cs, and yss i
Plugin 'tpope/vim-surround'
"nice status bar
"Plugin 'itchyny/lightline.vim'
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
"{{{
" zero msec timeout  http://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0
" turn on syntax highlight
syntax on
" show curret line
:set cursorline
" turn on linenumbers
:set number
"remove ugly ass  split separator
set fillchars=""
"show bar
set laststatus=2
" visual autocomplete for command menu
set wildmenu
"256 color base 16 theme
let base16colorspace=256
let &t_Co=256
colorscheme base16-default
"}}}
"""""""""""""""""""""""""""""""""""""""
" 				airline
"""""""""""""""""""""""""""""""""""""""
" {{{
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
"
"""""""""""""""""""""""""""""""""""""""
"	 		misc  tweaks
"""""""""""""""""""""""""""""""""""""""
"{{{
set nobackup
set noswapfile
" tmux copypaste integration
if $TMUX == ''
		set clipboard=unnamed
endif

" tab is 4 spaces
set tabstop=4
set clipboard=unnamed
" set spell check in english
setlocal spell spelllang=en_us
" special mode line at end of file
set modelines=1
" 			folding {{{
set foldenable  " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10  " max 10 nested fold allower
set foldmethod=indent " fold based on indent level
"  }}}

"}}}
"""""""""""""""""""""""""""""""""""""""
"			 aliases
"""""""""""""""""""""""""""""""""""""""
" {{{
"coveneient stuff
inoremap jj <Esc>
" toojse relative line numbers
nnoremap <silent><leader>o :set relativenumber!<cr>
map <silent><leader>bgl :set background=light<cr>
map  <silent><leader>bgd :set background=dark<cr>
" split right and below instead of default opposite
set splitbelow
set splitright
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
"}}}
""""""""" common typos""""""""""""
"{{{
command Q q
command W w
"}}}
""""""""" plug ins  """"""""""""
"{{{
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
"autoformat code with F7
noremap <F6> :Autoformat<CR><CR>
" tagbar autofous on open
let g:tagbar_autofocus = 1
"slime configuration
let g:slime_target = "tmux"
" let slime use the cpaste magic in python
let g:slime_python_ipython = 1
" snipppetss
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"js stuff
let javascript_enable_domhtmlcss=1
let b:javascript_fold=1
" }}}
"reload on save
autocmd! bufwritepost .vimrc source %
" vim: foldmethod=marker:foldlevel=0
