" Vundle setup
"{{{
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"}}}
" Plugins
"""""""""""""""""""""""""""""""""""
" {{{
" neocompchage
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin  'superbrothers/vim-vimperator'
" vim - evernote client
Plugin 'neilagabriel/vim-geeknote' 
" easymotions
Plugin 'Lokaltog/vim-easymotion'
" instant markdown needs extra installs
" http://vimawesome.com/plugin/vim-instant-markdown
Plugin 'terryma/vim-instant-markdown'
" expand selection to region
Plugin 'terryma/vim-expand-region'
" open markdown preview in marked2 app
Plugin 'itspriddle/vim-marked'
" pomodoro manager vim
Plugin 'gregsexton/Vomodoro'
" align table
Plugin 'godlygeek/tabular'
" markdown plugin
Plugin 'plasticboy/vim-markdown'
"" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"" eyecany bar
Plugin 'bling/vim-airline'
" makes iterm2 tmux and vim have sex
Plugin 'sjl/vitality.vim'
"" execute file
:Plugin 'Bexec'
"" send line to tmux
Plugin 'jpalardy/vim-slime'
"" auto-format code
Plugin 'Chiel92/vim-autoformat'
" emmet
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
" colorscheme
Plugin 'chriskempson/base16-vim'
" jedi for ptyhon
Plugin 'davidhalter/jedi-vim'
" go integration
Plugin 'fatih/vim-go'
" zen writing
Plugin 'junegunn/goyo.vim'
" highlighcolors
Plugin 'chrisbra/Colorizer' 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"}}}
"""""""""""""""""""""""""""""""""""""""
" Visual
"""""""""""""""""""""""""""""""""""""""
"{{{
"  kill hte mouse
if has("gui_running")
        set mouse=a
else
        set mouse=c
endif
" turn on syntax highlight
syntax on
" show curret line
set cursorline
" set 79 long ruler
au FileType python  set colorcolumn=79
" turn on linenumbers, and make them relative except current line
set number          
"remove ugly ass  split separator
set fillchars=""
"show bar
set laststatus=2
" visual autocomplete for command menu
set wildmenu
" redraw only when we need to 
set lazyredraw
"256 color base 16 theme
let base16colorspace=256
let &t_Co=256
colorscheme base16-default 
set mousehide "Hide when characters are typed
"}}}
"""""""""""""""""""""""""""""""""""""""
" Settings
"""""""""""""""""""""""""""""""""""""""
"{{{
" zero msec timeout  http://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0
" use space as leader
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set iskeyword-=_                    " '_' is an end of word designator
set nobackup
set noswapfile
" tmux copypaste integration
if $TMUX == ''
        set clipboard=unnamed
endif
set clipboard=unnamed
" tab is 4 spaces
set tabstop=4
" always uses spaces instead of tab characters
set expandtab
" set spell check in English
setlocal spell spelllang=en_us
" special mode line at end of file
set modelines=1
" md files as markdown
autocmd BufRead,BufNew *.md set filetype=markdown
" highlight as you type
set incsearch
set showmatch           " highlight matching [{()}]
" smart case when searching
set smartcase
"folding {{{
set foldenable  " enable folding
set foldnestmax=10  " max 10 nested fold allower
set foldmethod=syntax " fold based on indent level
"reload on save
autocmd! bufwritepost .vimrc source %
" }}}
" }}}
"""""""""""""""""""""""""""""""""""""""
" Aliases
"""""""""""""""""""""""""""""""""""""""
" {{{
" leader
map <space> <leader>
" fullscreen  {{{
function! Fullscreen()
        let line = line(".")+0
        tabedit %
        call cursor(line,0 )
endfunction

function! Minimze()
        let line = line(".")+0
        tabclose
        call cursor(line,0 )
endfunction
" }}}
" tabs shortcuts
map <leader>tn :tabnew<CR>
nnoremap <silent><C-W>m :call Fullscreen() <CR>
nnoremap <silent><C-W>c :call Minimze() <CR>
"jj to esc
inoremap jj <Esc>
" toggle relative line numbers
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
nnoremap <silent> z4 :set foldlevel=4<CR>
nnoremap <silent> z5 :set foldlevel=5<CR>
"buffers
" nice maximize split and go back to normal layout
nnoremap <silent><C-W><C-d> :bnext<CR>
nnoremap <silent><C-W><C-a> :bprevious<CR>
nnoremap <silent><C-W><C-q> :bd<CR>
" close current buffer and moves back to the previous "
nmap <leader>bq :bp <BAR> bd #<CR>
"}}}
"""""""""""""""""""""""""""""""""""""""
" common typos
"""""""""""""""""""""""""""""""""""""""
"{{{
command! Q q
command! W w
command! Qa qa
command! Wa wa
"}}}
"""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
"  Plug ins
"""""""""""""""""""""""""""""""""""""""
"{{{
" tag-bar css stuff  " {{{
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
" neocopmlete  {{{
let g:neocomplcache_temporary_dir = "$HOME/.vim/tmp/neocomplcache"
let g:neocomplete#data_directory = "$HOME/.vim/tmp/"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
                        \ 'default' : '',
                        \ 'vimshell' : $HOME.'/.vimshell_hist',
                        \ 'scheme' : $HOME.'/.gosh_completions'
                        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
        return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-g>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" mardkdown tagbar support
let g:tagbar_type_markdown = {
                        \ 'ctagstype' : 'markdown',
                        \ 'kinds' : [
                        \ 'h:headings',
                        \ 'l:links',
                        \ 'i:images'
                        \ ],
                        \ "sort" : 0
                        \ }
"}}}
" neocoomplete snippts {{{
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                        \ "\<Plug>(neosnippet_expand_or_jump)"
                        \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                        \ "\<Plug>(neosnippet_expand_or_jump)"
                        \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
        set conceallevel=2 concealcursor=i
endif
" }}}
" airline {{{
"enable better tab
let g:airline_theme="base16"
let g:airline#extensions#tabline#enabled = 1
" use nice powerline line theme 
let g:AirlineTheme="powerlineish"
" use simple separators 
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'''
let g:airline_left_sep=''
let g:airline_right_sep=''
"}}}
" Enables HTML/CSS syntax highlighting in your JavaScript file.
let g:javascript_enable_domhtmlcss = 1
" map nerd tree to leader n
map <silent><leader>n :NERDTreeFocus<CR>
" remap jedi usage to leader u
let g:jedi#usages_command = "<leader>u"
nnoremap <F5> :GundoToggle<CR>
" gutter & fugitive git bindings {{{
" open diff
nnoremap <leader>gd :Gdiff<CR>
" add current file
nnoremap <leader>ga :Git add %:p<CR><CR>
" status
nnoremap <leader>gs :Gstatus<CR>
" commit added files
nnoremap <leader>gc :Gcommit -q<CR>
" add and commit current file
nnoremap <leader>gt :Gcommit -v -q  %:p<CR>
" this should turn off the annothing random highlight
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
"}}}
" task and notes {{{
" open task list for todo single file
map <leader>td <Plug>TaskList
" open task list for todo in current folder and subfolder
noremap <Leader>tl :noautocmd vimgrep /TODO/ ./**/*.*<CR>:cw<CR>
noremap <Leader>nl :noautocmd vimgrep /NOTE/ ./**/*.*<CR>:cw<CR>
"}}}
"autoformat code with F6
noremap <F6> :Autoformat<CR><CR>
" tagbar behavior {{{
" tagbar autofous on open
nmap <c-t> :TagbarToggle <CR>
let g:tagbar_autofocus = 1
" sort tags by file zrder and not by alphabetical order
let g:tagbar_sort = 0
"}}}
" slime configuration
let g:slime_target = "tmux"
"" let slime use the cpaste magic in python
let g:slime_python_ipython = 1
"  show nice embedded js
let javascript_enable_domhtmlcss=1
" allow js folding
let b:javascript_fold=1
" zen mode with Goyo
nnoremap <silent><Leader>f :Goyo <CR>
" make contrlp faster
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
" }}}
"""""""""""""""""""""""""""""""""""""""
" go
"""""""""""""""""""""""""""""""""""""""
"{{{
"fold by sytax and style
"
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
au FileType go  set foldmethod=syntax foldnestmax=10 nofoldenable foldlevel=0
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
au FileType go nmap <leader>c <Plug>(go-coverage)
"By default the mapping gd is enabled which opens the target identifier in current buffer. You can also open the definition/declaration in a new vertical, horizontal or tab for the word under your cursor:
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)
" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
" tabar tags
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
"""""""""""""""""""""""""""""""""""""""
" easymotion
"""""""""""""""""""""""""""""""""""""""
"{{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-s)
"Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
"
"" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" Beginning of word forward and backward. See |w| & |b|.
map <Leader>w <Plug>(easymotion-bd-w)
map <Leader>W <Plug>(easymotion-bd-W)
map <Leader>e <Plug>(easymotion-bd-e)
map <Leader>E <Plug>(easymotion-bd-E)
map <Leader>q <Plug>(easymotion-jumptoanywhere)
" customize color
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen
" }}}
" NerdTree {{{
map <C-e> <plug>NERDTreeTabsToggle<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
" }}}
" vim: foldmethod=marker:foldlevel=0
