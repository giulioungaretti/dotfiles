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
 " blog with vim
Plugin 'parkr/vim-jekyll'
 " expand selection to region
Plugin 'terryma/vim-expand-region'
" open markdown preview in marked2 app
Plugin 'itspriddle/vim-marked'
 " align
Plugin 'godlygeek/tabular'
" markdown plugin
Plugin 'plasticboy/vim-markdown'
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
" better js
Plugin 'pangloss/vim-javascript'
" colorize css hexcodes
Plugin 'ap/vim-css-color'
" ptyhon pep8
Plugin 'scrooloose/syntastic'
" window managment
Plugin 'wesQ3/vim-windowswap'
" undo treee
Plugin 'sjl/gundo.vim'
" remove and highlight trailing spaces
Plugin 'bronson/vim-trailing-whitespace'
" tmux seamless movement
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
Plugin 'mattn/webapi-vim'
""super tab
Plugin 'ervandew/supertab'
"" add colorscheme
Plugin 'chriskempson/base16-vim'
"" jedi for ptyhon
Plugin 'davidhalter/jedi-vim'
"" go integration
Plugin 'fatih/vim-go'
""" zen writing
Plugin 'junegunn/goyo.vim'
"}}}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""
"Visual vim tweaks
"""""""""""""""""""""""""""""""""""""""
"{{{
" zero msec timeout  http://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0
" turn on syntax highlight
syntax on
" show curret line
set cursorline
" set 79 long ruler
au FileType python  set colorcolumn=79
" turn on linenumbers
set number
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
set clipboard=unnamed
" tab is 4 spaces
set tabstop=4
" set spell check in english
setlocal spell spelllang=en_us
" special mode line at end of file
set modelines=1
" md files as markdown
autocmd BufRead,BufNew *.md set filetype=markdown
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
map <Leader>w :w<CR>
map <Leader>q :q<CR>
"jj to esc
inoremap jj <Esc>
" esc esc tosave
" toojse relative line numbers
nnoremap <silent><leader>o :set relativenumber!<cr>
map <silent><leader>bgl :set background=light<cr>
map  <silent><leader>bgd :set background=dark<cr>
" split right and below instead of default opposite
set splitbelow
set splitright
" folds
nnoremap <silent> z1 :set foldlevel=1<CR>
nnoremap <silent> z2 :set foldlevel=2<CR>
nnoremap <silent> z3 :set foldlevel=3<CR>
" supertab omtnicomplete
let g:SuperTabDefaultCompletionType = "context""
"}}}
"""""""""""""""""""""""""""""""""""""""
" common typos
"""""""""""""""""""""""""""""""""""""""
"{{{
command Q q
command W w
"}}}
"css stuff
"{{{
let g:tagbar_type_css = {
\  'ctagstype' : 'css',
\  'kinds' : [
\    'v:variables',
\    'c:classes',
\    'i:identities',
\    't:tags',
\    'm:medias'
\  ]
\}

let g:tagbar_type_less = {
\  'ctagstype' : 'css',
\  'kinds' : [
\    'v:variables',
\    'c:classes',
\    'i:identities',
\    't:tags',
\    'm:medias'
\  ]
\}

let g:tagbar_type_scss = {
\  'ctagstype' : 'css',
\  'kinds' : [
\    'v:variables',
\    'c:classes',
\    'i:identities',
\    't:tags',
\    'm:medias'
\  ]
\}
"}}}
"""""""""""""""""""""""""""""""""""""""
"  plug ins
"""""""""""""""""""""""""""""""""""""""
"{{{
"mardkdown tagbar support
let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
                \ 'h:headings',
                \ 'l:links',
                \ 'i:images'
            \ ],
    \ "sort" : 0
\ }
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
nmap <c-t> :TagbarOpen fj<CR>
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
" sort tags by file zrder and not by alphabetical order
let g:tagbar_sort = 0
""slime configuration
let g:slime_target = "tmux"
"" let slime use the cpaste magic in python
let g:slime_python_ipython = 1
"" snipppetss
"" Trigger configuration. Do not use <tab> if you use
"" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"js stuff
let javascript_enable_domhtmlcss=1
let b:javascript_fold=1
" }}}
"""""""""""""""""""""""""""""""""""""""
" go
"""""""""""""""""""""""""""""""""""""""
"{{{
"Show a list of interfaces which is implemented by the type under your cursor with <leader>s
au FileType go nmap <Leader>s <Plug>(go-implements)
"Show type info for the word under your cursor with <leader>i (useful if you have disabled auto showing type info via g:go_auto_type_info)
au FileType go nmap <Leader>i <Plug>(go-info)
"Open the relevant Godoc for the word under the cursor with <leader>gd or open it vertically with <leader>gv
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
"Or open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
"Run commands, such as go run with <leader>r for the current file or go build and go test for the current package with <leader>b and <leader>t. Display a beautiful annotated source code to see which functions are covered with <leader>c.
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
"By default the mapping gd is enabled which opens the target identifier in current buffer. You can also open the definition/declaration in a new vertical, horizontal or tab for the word under your cursor:

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
"Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
"}}}
"reload on save
autocmd! bufwritepost .vimrc source %
" vim: foldmethod=marker:foldlevel=0
