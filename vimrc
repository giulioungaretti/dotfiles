" load Vunlde" {{{
" required bits for vundle
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" }}}
"""""""""""""""""""""""""""""""""""
" 		plugins
"""""""""""""""""""""""""""""""""""
 " {{{
 "
 " align
Plugin 'godlygeek/tabular'
" markdown plugin
Plugin 'plasticboy/vim-markdown'"
"" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"" eyecany bar
Plugin 'bling/vim-airline'
" makes iterm2 tmux and vim have sex
Plugin 'sjl/vitality.vim'
" Track the engine.
Plugin 'SirVer/ultisnips'
"" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
"" exectute file
:Plugin 'Bexec'
"" send line to tmux
Plugin 'jpalardy/vim-slime'
"" autofromat code
Plugin 'Chiel92/vim-autoformat'
 "" emmet
Plugin 'mattn/emmet-vim'
"" better js
Plugin 'pangloss/vim-javascript'
 "" colorize css hexcodes
Plugin 'ap/vim-css-color'
 "" ptyhon pep8
Plugin 'scrooloose/syntastic'
 "" window managment
Plugin 'wesQ3/vim-windowswap'
"" undo treee
Plugin 'sjl/gundo.vim'
""remove and highlight trailing spaces
Plugin 'bronson/vim-trailing-whitespace'
""tmux seamless movement
Plugin 'christoomey/vim-tmux-navigator'
""indent highlight
Plugin 'Yggdroot/indentLine'
""autoclose
Plugin 'Townk/vim-autoclose'
"" sublime like mutiple cursors
Plugin 'terryma/vim-multiple-cursors'
"" add git gutter
Plugin 'airblade/vim-gitgutter'
"" tree bar
Plugin 'scrooloose/nerdtree'
"" cntrl p
Plugin 'kien/ctrlp.vim'
"" nerd commenter
Plugin 'scrooloose/nerdcommenter'
" fuGITve
Plugin 'tpope/vim-fugitive'
 "tasklist leader-t
Plugin 'TaskList.vim'
"" new command ds, cs, and yss i
Plugin 'tpope/vim-surround'
"" structure of  file
Plugin 'majutsushi/tagbar'
"" add :Gist command
Plugin 'mattn/gist-vim'
""super tab
Plugin 'ervandew/supertab'
"" add colorscheme
Plugin 'chriskempson/base16-vim'
"" jedi for ptyhon
Plugin 'davidhalter/jedi-vim'
"}}}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""
"Visual vim tweaks
"""""""""""""""""""""""""""""""""""""""
"{{{
" zero msec timeout  http://www.johnhawthorn.com/2012/09/vi-escape-delays/
" turn on syntax highlight
set timeoutlen=1000 ttimeoutlen=0
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
set mousehide "Hide when characters are typed
"}}}
"""""""""""""""""""""""""""""""""""""""
"misc vim tweaks
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
"folding {{{
set foldenable  " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10  " max 10 nested fold allower
set foldmethod=indent " fold based on indent level
" }}}
" }}}
"""""""""""""""""""""""""""""""""""""""
"vim aliases
"""""""""""""""""""""""""""""""""""""""
" {{{
" " tab shortcuts
map <leader>tn :tabnew<CR>
map <leader>tc :tabclose<CR>
"coveneient stuff
let mapleader = " "
"Type 12<Enter> to go to line 12.
"Hit Enter to go to end of file.
"Hit Backspace to go to beginning of file.
nnoremap <CR> G
nnoremap <BS> gg
"save a file
nnoremap <Leader>w :w<CR>
"jj to esc
inoremap jj <Esc>
" esc esc tosave
inoremap js <Esc> :w<CR>
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
"""""""""""""""""""""""""""""""""""""""
" common typos
"""""""""""""""""""""""""""""""""""""""
"{{{
command Q q
command W w
"}}}
"""""""""""""""""""""""""""""""""""""""
"  plug ins
"""""""""""""""""""""""""""""""""""""""
"{{{
"enalbe cool fonts
let g:airline_powerline_fonts = 1
"enable better tab
let g:airline#extensions#tabline#enabled = 1
""Enables HTML/CSS syntax highlighting in your JavaScript file.
let g:javascript_enable_domhtmlcss = 1
"" map nerd tree to leader n
map <silent><leader>n :NERDTreeFocus<CR>
"" remap jedi usage to leader u
let g:jedi#usages_command = "<leader>u"
nmap <F8> :TagbarToggle<CR>
nnoremap <F5> :GundoToggle<CR>
" fugitive git bindings
" open diff)
nnoremap <space>gd :Gdiff<CR>
" add current file
nnoremap <space>ga :Git add %:p<CR><CR>
" status
nnoremap <space>gs :Gstatus<CR>
" commit added files
nnoremap <space>gc :Gcommit -q<CR>
" add and commit current file
nnoremap <space>gt :Gcommit -v -q  %:p<CR>
" this should turn off the annothing random highlight
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
" open task list
map <leader>td <Plug>TaskList
"autoformat code with F6
noremap <F6> :Autoformat<CR><CR>
" tagbar autofous on open
let g:tagbar_autofocus = 1
""slime configuration
let g:slime_target = "tmux"
"" let slime use the cpaste magic in python
let g:slime_python_ipython = 1
"" snipppetss
"" Trigger configuration. Do not use <tab> if you use
"" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"js stuff
let javascript_enable_domhtmlcss=1
let b:javascript_fold=1
" }}}
"reload on save
autocmd! bufwritepost .vimrc source %
" vim: foldmethod=marker:foldlevel=0
