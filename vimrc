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
"
Plugin 'tpope/vim-obsession.git'
Plugin 'dhruvasagar/vim-prosession'
" yankring
Plugin 'vim-scripts/YankRing.vim'
" undo -trees
Plugin 'mbbill/undotree'
" dahs integration
Plugin 'rizzatti/dash.vim'
" py-doc
Plugin 'fs111/pydoc.vim'
" neocompchage
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
" open gvim from firefox
Plugin 'superbrothers/vim-vimperator'
" vim - evernote client not py3 compatible
" Plugin 'neilagabriel/vim-geeknote'
" easymotions
Plugin 'Lokaltog/vim-easymotion'
" instant markdown needs extra installs
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
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" eyecany bar
Plugin 'bling/vim-airline'
" makes iterm2 tmux and vim have sex
Plugin 'sjl/vitality.vim'
" execute file
:Plugin 'Bexec'
" send line to tmux
"Plugin 'jpalardy/vim-slime'
Plugin 'ervandew/screen'
" auto-format code
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
" not py3 compatible.
" Plugin 'sjl/gundo.vim'
" remove and highlight trailing spaces
Plugin 'bronson/vim-trailing-whitespace'
" tmux seamless movement
Plugin 'christoomey/vim-tmux-navigator'
"indent highlight
Plugin 'Yggdroot/indentLine'
""autoclose
Plugin 'Townk/vim-autoclose'
" sublime like mutiple cursors
Plugin 'terryma/vim-multiple-cursors'
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
"tasklist leader-t
Plugin 'TaskList.vim'
" new command ds, cs, and yss i
Plugin 'tpope/vim-surround'
" structure of  file
Plugin 'majutsushi/tagbar'
" add :Gist command
Plugin 'mattn/gist-vim'
" required
Plugin 'mattn/webapi-vim'
" colorscheme
Plugin 'chriskempson/base16-vim'
Plugin  'altercation/vim-colors-solarized'
" jedi for ptyhon
Plugin 'davidhalter/jedi-vim'
" go integration
Plugin 'fatih/vim-go'
" zen writing
Plugin 'junegunn/goyo.vim'
" highlighcolors
Plugin 'chrisbra/Colorizer'
" use silver searcher
Plugin 'rking/ag.vim'"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"}}}
"""""""""""""""""""""""""""""""""""""""
" Visual
"""""""""""""""""""""""""""""""""""""""
"{{{
"  kill the mouse forever
if has("gui_running")
        set mouse=a
else
        set mouse=c
endif
" turn on syntax highlight
syntax on
" show curret line
set cursorline
" turn on linenumbers, and make them relative except current line
set number
"remove ugly ass  split separator
set fillchars=""
" nuke split background
"show bar
set laststatus=2
" visual autocomplete for command menu
set wildmenu
" redraw only when we need to
set lazyredraw
"256 color base 16 theme
let &t_Co=256
let base16colorspace=256
"hi Visual cterm=reverse
set background=light
colorscheme base16-chalk
hi! VertSplit  ctermfg=9 ctermbg=21
set mousehide "Hide when characters are typed
"}}}
"""""""""""""""""""""""""""""""""""""""
" Settings
"""""""""""""""""""""""""""""""""""""""
"{{{
"
set shell=/bin/sh
" bybye ex mode
nnoremap Q <nop>
" zero msec timeout  http://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0
" use space as leader
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
set iskeyword-=_                    " '_' is an end of word designator
set nobackup
set noswapfile
set clipboard+=unnamed
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
" Toggle paste mode.
function! TogglePasteMode()
        if &paste
                set nopaste
        else
                set paste
        endif
endfunction
" move to right
inoremap l;  <Esc>la
snoremap l;  <Esc>la
nnoremap <leader>p :call TogglePasteMode()<CR>
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
" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" tabs shortcuts
map <leader>tn :tabnew<CR>
nnoremap <silent><C-W>m :call Fullscreen() <CR>
nnoremap <silent><C-W>c :call Minimze() <CR>
"jj to esc
inoremap jj <Esc>
" toggle relative line numbers
nnoremap <silent><leader>o :set relativenumber!<cr>
function! Light()
        :set background=light
        :hi! VertSplit  ctermfg=9 ctermbg=21
        :redraw!
        :AirlineRefresh
endfunction
map <silent><leader>bgl :call Light()<cr>

function! Dark()
        :set background=dark
        :hi! VertSplit  ctermfg=9 ctermbg=18
        :redraw!
        :AirlineRefresh
endfunction
map  <silent><leader>bgd :call Dark()<cr>
" split right and below instead of default opposite
set splitbelow
set splitright
" folds
nnoremap <silent> z1 :set foldlevel=1<CR>
nnoremap <silent> z2 :set foldlevel=2<CR>
nnoremap <silent> z3 :set foldlevel=3<CR>
nnoremap <silent> z4 :set foldlevel=4<CR>
nnoremap <silent> z5 :set foldlevel=5<CR>
" turn on and off spell checking.
map <F10> :setlocal spell! spelllang=en_us<CR>
"buffers
" nice maximize split and go back to normal layout
nnoremap <silent><C-W><C-d> :bnext<CR>
nnoremap <silent><C-W><C-a> :bprevious<CR>
nnoremap <silent><C-W><C-q> :bd<CR>
" close current buffer and moves back to the previous "
nmap <leader>bq :bp <BAR> bd #<CR>
" zen mode with Goyo
nnoremap <silent><Leader>f :Goyo <CR>
" open task list for todo single file
map <leader>td <Plug>TaskList
" open task list for todo in current folder and subfolder
noremap <Leader>tl  :Ag TODO <CR>
" open task list for note in current folder and subfolder
noremap <Leader>nl :Ag NOTE <CR>
" delete left
imap <C-G> <BS>
" move search highlight to the center of the screen
nnoremap n nzz
nnoremap N Nzz
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
"  Plug ins
"""""""""""""""""""""""""""""""""""""""
"{{{
"""""""""""""""""""""""""""""""""""""""
" airline {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" use simple separators
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme="base16"
"}}}
"""""""""""""""""""""""""""""""""""""""
" syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = 'python3'
"}}}
"""""""""""""""""""""""""""""""""""""""
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
"""""""""""""""""""""""""""""""""""""""
" misc {{{
" press esc to go back to normal mode instead of quitting multi cursor
let g:multi_cursor_exit_from_insert_mode=0
"autoformat code with F6
noremap <F5> :FixWhitespace <CR><CR>
nnoremap <F7> :UndotreeToggle<cr>
"autoformat code with F6
noremap <F6> :Autoformat<CR><CR>
" tagbar autofous on open
nmap <c-t> :TagbarOpen fj <CR>
let g:tagbar_autofocus = 1
" sort tags by file zrder and not by alphabetical order
let g:tagbar_sort = 0
" remap ctrlp to ctrla and use ctrlp for yankring
let g:ctrlp_map = '<c-a>'
" The Silver Searcher
if executable('ag')
        " Use ag over grep
        set grepprg=ag\ --nogroup\ --nocolor
        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
                                \ --ignore .git
                                \ --ignore .svn
                                \ --ignore .hg
                                \ --ignore .DS_Store
                                \ --ignore "**/*.pyc"
                                \ -g ""'

        " ag is fast enough that CtrlP doesn't need to cache
        let g:ctrlp_use_caching = 0
else
        echoerr "consider installing ag"
endif
" slime configuration
let g:slime_target = "tmux"
" }}}
"}}}
"""""""""""""""""""""""""""""""""""""""
" go
"""""""""""""""""""""""""""""""""""""""
"{{{
"fold by sytax and style
" set style for go files
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
au FileType go  set foldmethod=syntax foldnestmax=10 foldlevel=3
"Show a list of interfaces which is implemented by the type under your cursor with <leader>s
au FileType go nmap <Leader>s <Plug>(go-implements)
"Show type info for the word under your cursor with <leader>i (useful if you have disabled auto showing type info via g:go_auto_type_info)
au FileType go nmap <Leader>i <Plug>(go-info)
"Open the relevant Godoc for the word under the cursor with <leader>gd or open it vertically with <leader>gv
au FileType go nmap <Leader>gd <Plug>(go-doc)<cr><C-w>k<cr>
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)<cr><C-w>h<cr>
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
"""""""""""""""""""""""""""""""""""""""
" neocopmlete
"""""""""""""""""""""""""""""""""""""""
"{{{
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
autocmd FileType go setlocal omnifunc=gocomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"---------------------------
" neocoomplete snippts {{{
" Plugin key-mappings.
imap <TAB>     <Plug>(neosnippet_expand_or_jump)
smap <TAB>     <Plug>(neosnippet_expand_or_jump)
xmap <TAB>     <Plug>(neosnippet_expand_target)
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
let g:neocomplete#disable_auto_complete=0
let g:neocomplete#enable_auto_select = 0
"" fix go ? seems to
let g:neocomplete#sources#omni#functions = {'go': 'go#complete#Complete'}
" }}}
"""""""""""""""""""""""""""""""""""""""
" NerdTree
"""""""""""""""""""""""""""""""""""""""
" {{{
" map nerd tree to leader n
map <silent><leader>n :NERDTreeFocus<CR>
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
"""""""""""""""""""""""""""""""""""""""
" js and csss
"""""""""""""""""""""""""""""""""""""""
" {{{
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
" Enables HTML/CSS syntax highlighting in your JavaScript file.
let g:javascript_enable_domhtmlcss = 1
"  show nice embedded js
let javascript_enable_domhtmlcss=1
" allow js folding
let b:javascript_fold=1
"}}}
" python
"""""""""""""""""""""""""""""""""""""""
"{{{
" set 79 long ruler
au FileType python  set colorcolumn=79
" expand tab to spaces
au FileType python  set expandtab
au BufNewFile,BufRead *.py setlocal noet ts=8 sw=4 sts=4
" JEDI and auto complete {{{
let g:neocomplete#force_overwrite_completefunc=1
if !exists('g:neocomplete#force_omni_input_patterns')
        "let g:neocomplete#force_omni_input_patterns={}
endif
"overwrite omnifunc  with jedi
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"The call signatures can be displayed as a pop-up in the buffer (set to 1, the default), which has the advantage of being easier to refer to, or in Vim's command line aligned with the function call (set to 2), which can improve the integrity of Vim's undo history.   "
let g:jedi#usages_command = "<leader>u"
let g:jedi#show_call_signatures = "2"
let g:jedi#use_splits_not_buffers = "winwidth"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<leader>c"
let g:jedi#rename_command = "<leader>r"
"}}}
" ipyhont tmux integration {{{
let g:ScreenImpl = "Tmux"
" Open an ipython3 shell.
autocmd FileType python map <LocalLeader>p :ScreenShell! ipython<CR>
"autocmd FileType python map <LocalLeader>p :IPython!  <CR>
" Close whichever shell is running.
autocmd FileType python map <LocalLeader>q :ScreenQuit<CR>
" Send current line to python and move to next line.
autocmd FileType python map <LocalLeader>rp V:ScreenSend<CR>j
" Send visual selection to python and move to next line.
autocmd FileType python map <LocalLeader>v :ScreenSend<CR>`>0j
" Send a carriage return line to python.
autocmd FileType python map <LocalLeader>a :call g:ScreenShellSend("\r")<CR>
" Clear screen.
autocmd FileType python map <LocalLeader>L
                        \ :call g:ScreenShellSend('!clear')<CR>
" Start a time block to execute code in.
autocmd FileType python map <LocalLeader>t
                        \ :call g:ScreenShellSend('%%time')<CR>
" Start a timeit block to execute code in.
autocmd FileType python map <LocalLeader>tt
                        \ :call g:ScreenShellSend('%%timeit')<CR>
" Start a debugger repl to execute code in.
autocmd FileType python map <LocalLeader>db
                        \ :call g:ScreenShellSend('%%debug')<CR>
" Start a profiling block to execute code in.
autocmd FileType python map <LocalLeader>pr
                        \ :call g:ScreenShellSend('%%prun')<CR>
" Print the current working directory.
autocmd FileType python map <LocalLeader>gw
                        \ :call g:ScreenShellSend('!pwd')<CR>
" Set working directory to current file's folder.
function SetWD()
        let wd = '!cd ' . expand('%:p:h')
        :call g:ScreenShellSend(wd)
endfunction
autocmd FileType python map <LocalLeader>sw :call SetWD()<CR>
" Get ipython help for word under cursor. Complement it with Shift + K.
function GetHelp()
        let w = expand("<cword>") . "??"
        :call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>h :call GetHelp()<CR>
" Get `dir` help for word under cursor.
function GetDir()
        let w = "dir(" . expand("<cword>") . ")"
        :call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>d :call GetDir()<CR>
function! s:get_visual_selection()
endfunction
" Get `?` help for word under cursor.
function GetHelpMagic()
        let foo_tmp =  GetVisual()
        let w = "?".foo_tmp
        :call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>dc :call GetHelpMagic()<CR>

" Get `dir` help for word under cursor.
function GetLen()
        let w = "len(" . expand("<cword>") . ")"
        :call g:ScreenShellSend(w)
        echo  w
endfunction
autocmd FileType python map <LocalLeader>l :call GetLen()<CR>
"}}}
" py-doc bindings
let g:pydoc_open_cmd = 'vsplit'
let g:pydoc_cmd = '/Users/giulio/anaconda/bin/python -m pydoc'
"}}}
" {{{ misc functinons
" gets the selected text in visual mode
function! GetVisual()
        " Why is this not a built-in Vim script function?!
        let [lnum1, col1] = getpos("'<")[1:2]
        let [lnum2, col2] = getpos("'>")[1:2]
        let lines = getline(lnum1, lnum2)
        let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
        let lines[0] = lines[0][col1 - 1:]
        return join(lines, "\n")
endfunction
"}}}
"""""""""""""""""""""""""""""""""""""""
" vim: foldmethod=marker:foldlevel=0
