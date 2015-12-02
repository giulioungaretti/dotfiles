"┌─────────────────────────────────────────┐
"│              _                          │
"│       __   _(_)_ __ ___  _ __ ___       │
"│       \ \ / / | '_ ` _ \| '__/ __|      │
"│        \ V /| | | | | | | | | (__       │
"│       (_)_/ |_|_| |_| |_|_|  \___|      │
"│                                         │
"└─────────────────────────────────────────┘
" 16 Nov 2015
" ---------------------------------------------------------------------- Init
" {{{
set nocompatible              " be iMproved, required
" grab os name
let s:uname = system("uname -s")
call plug#begin('~/.vim/plugged')
"}}}
" --------------------------------------------------------------------- Plugs
"  {{{
if s:uname == "Darwin\n"
"Mac specific plug ins
" search in osx dictionary
Plug 'jonhiggs/MacDict.vim'
    " Support different cursor in insert mode.
    if &term == "screen-256color"
      let &t_SI = "\<Esc>[3 q"
      let &t_EI = "\<Esc>[0 q"
    endif
    " this should make it work with osx/tmux/madness
    set clipboard+=unnamed
endif
if s:uname == "Linux\n"
    " Do linux stuff here
    set clipboard=unnamedplus
    " sync vim clipboard to x clipboard
    autocmd VimLeave * call system("xsel -ib", getreg('+'))
endif
"
" nice start page
Plug 'mhinz/vim-startify'
" manage virtual envs
Plug 'jmcantrell/vim-virtualenv'
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" unite
Plug 'Shougo/unite.vim'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neomru.vim'
Plug 'tsukkee/unite-help'
Plug 'tacroe/unite-mark'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" nice doc ref stuff
Plug 'thinca/vim-ref'
" Arduino
Plug 'sudar/vim-arduino-syntax'
" snippets
Plug 'sudar/vim-arduino-snippets'
" Processing syntax / run script and docs.
Plug 'sophacles/vim-processing'
" elang plugs
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-omnicomplete'
" Rainbow paranthesis
Plug 'junegunn/rainbow_parentheses.vim'
" headers
Plug 'bimbalaszlo/vim-eightheader'
" hide cursorline inactive buffer
Plug 'vim-scripts/CursorLineCurrentWindow'
" better search tools highglihg + match
Plug 'inside/vim-search-pulse'
Plug 'haya14busa/incsearch.vim'
"auto gnerate docstring for python
Plug 'heavenshell/vim-pydocstring'
" templates for empty files
Plug 'aperezdc/vim-template'
" undo -trees
Plug 'mbbill/undotree'
" neocompchage
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" easymotions
Plug 'Lokaltog/vim-easymotion'
" expand selection to region
Plug 'terryma/vim-expand-region'
" align table
Plug 'godlygeek/tabular'
" markdown plugin
Plug 'plasticboy/vim-markdown'
Plug 'terryma/vim-instant-markdown'
" eyecany bar
Plug 'bling/vim-airline'
" send line to tmux
Plug 'ervandew/screen'
" tmux seamless movement
Plug 'christoomey/vim-tmux-navigator'
" auto-format code
 Plug 'chiel92/vim-autoformat', { 'branch': 'dev' }
" emmet
Plug 'mattn/emmet-vim'
" better js
Plug 'pangloss/vim-javascript'
" colorize css hexcodes
Plug 'ap/vim-css-color'
" syntax cheker
Plug 'scrooloose/syntastic'
" window managment
Plug 'wesQ3/vim-windowswap'
" remove and highlight trailing spaces
Plug 'bronson/vim-trailing-whitespace'
"indent highlight
Plug 'Yggdroot/indentLine'
""autoclose
Plug 'Townk/vim-autoclose'
" sublime like mutiple cursors
Plug 'terryma/vim-multiple-cursors'
" add git gutter
Plug 'airblade/vim-gitgutter'
" nerd commenter
Plug 'scrooloose/nerdcommenter'
" fuGITve
Plug 'tpope/vim-fugitive'
"tasklist leader-t
Plug 'TaskList.vim'
" new command ds, cs, and yss i
Plug 'tpope/vim-surround'
" structure of  file
Plug 'majutsushi/tagbar'
" add :Gist command
Plug 'mattn/gist-vim'
" required
Plug 'mattn/webapi-vim'
" colorschemes
Plug 'chriskempson/base16-vim'
" jedi for ptyhon
Plug 'davidhalter/jedi-vim'
" go integration
Plug 'fatih/vim-go'
Plug 'garyburd/go-explorer'
" zen writing
Plug 'junegunn/goyo.vim'
" highlighcolors
Plug 'chrisbra/Colorizer'
" use silver searcher
Plug 'rking/ag.vim'"
" All of your Plugs must be added before the following line
call plug#end()
"}}}
" -------------------------------------------------------------------- Visual
"{{{
au VimLeave * :!clear
" turn on syntax highlight
syntax on
" show curret line
set cursorline
"remove ugly ass  split separator
set fillchars=""
"show bar
set noshowmode
set noruler
set laststatus=2
" visual autocomplete for command menu
set wildmenu
" redraw only when we need to
set lazyredraw
" theme {{{
let g:airline_theme='base16'
let base16colorspace="256"
set t_Co=256
set background=dark
colorscheme base16-tomorrow
function! Light()
        set background=light
        hi! VertSplit ctermbg=15 guibg=#fefefe
        hi! CursorLineNR cterm=bold ctermfg=1
        hi! StatusLine ctermbg=15
        :redraw!
        if exists(':AirlineRefresh')
                :AirlineRefresh
        endif
endfunction

function! Dark()
        set background=dark
        hi! VertSplit ctermbg=0 guibg=#1c1f21
        hi! StatusLine ctermbg=0
        hi! CursorLineNR cterm=bold ctermfg=1
        :redraw!
        if exists(':AirlineRefresh')
                :AirlineRefresh
        endif
endfunction
" map functions to bgl and bgd
map <silent><leader>bgl :call Light()<cr>
map  <silent><leader>bgd :call Dark()<cr>
"}}}
set mousehide "Hide when characters are typed
" color of the current line number
nnoremap <silent><leader>o :set relativenumber!<cr>
"}}}
" ------------------------------------------------------------------ Settings
"{{{
"au FocusLost * :wa     " Set vim to save the file on focus out
set shell=/bin/sh
" Don't use Ex mode, use Q for formatting
map Q gq
" zero msec timeout  http://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0
"Extend word designators
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=_                    " '_' is an end of word designator
" no backup and swap files.
set nobackup
set noswapfile
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
" highlight matching [{()}]
set showmatch
" smart case when searching
set ignorecase
set smartcase
" better mouse interaction
set mouse=""
"folding
set foldenable  " enable folding
set foldnestmax=10  " max 10 nested fold allowed
set foldmethod=syntax " fold based on indent level
"reload on save
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %
" scroll the view port faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>"
"}}}
"-------------------------------------------------------------------- Aliases
"{{{
" bare vim
" delete char backwards insert mode
set backspace=indent,eol,start
imap ^D <BS>
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
nnoremap <leader>p :call TogglePasteMode()<CR>
" move to right
inoremap l;  <Esc>la
" fullscreen
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
"
" tabs shortcuts
map <leader>tn :tabnew<CR>
nnoremap <silent><C-W>m :call Fullscreen() <CR>
nnoremap <silent><C-W>c :call Minimze() <CR>
"jk kj to  to esc
inoremap jk <Esc>
inoremap kj <Esc>
" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" split right and below instead of default opposite
set splitbelow
set splitright
" folds
nnoremap <silent> z1 :set foldlevel=1<CR>
nnoremap <silent> z2 :set foldlevel=2<CR>
nnoremap <silent> z3 :set foldlevel=3<CR>
nnoremap <silent> z4 :set foldlevel=4<CR>
nnoremap <silent> z5 :set foldlevel=5<CR>
nnoremap <silent> z5 :set foldlevel=6<CR>
nnoremap <silent> z5 :set foldlevel=7<CR>
" turn on and off spell checking.
map <F10> :setlocal spell! spelllang=en_us<CR>
"buffers
" nice maximize split and go back to normal layout
nnoremap <silent><C-W><C-d> :bnext<CR>
nnoremap <silent><C-W><C-a> :bprevious<CR>
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif

nnoremap <silent> <leader>w :<C-u>Update<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <C-q> :bd <CR>
"}}}
"--------------------------------------------------------------- common typos
"{{{
command! Q q
command! Qq q
command! W w
command! Ww w
command! Qa qa
command! Wa wa
command! Wq wq
command! Wqa wqa
"}}}
"------------------------------------------------------------------- Plug ins
"{{{
"{{{orgmode
let g:org_todo_keywords=['TODO', 'FEEDBACK', 'VERIFY', '|', 'DONE', 'DELEGATED', 'ARCHIVED']
"}}}
" misc
" {{{
" UNDO
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif
" search in osx dictionary
function! GetDict()
        let w = expand("<cword>")
        :call g:MacDict(w)
endfunction
command! Def :call GetDict()<cr>
" zen mode with Goyo
nnoremap <silent><Leader>f :Goyo <CR>
" open task list for todo single file
map <leader>td <Plug>TaskList
" open task list for todo in current folder and subfolder
noremap <Leader>tl  :Ag TODO <CR>
" open task list for note in current folder and subfolder
noremap <Leader>nl :Ag NOTE <CR>
" heading creator
let g:EightHeader_comment   = 'call NERDComment( "n", "comment" )'
let g:EightHeader_uncomment = 'call NERDComment( "n", "uncomment" )'
" create heading from selected text
command! Header call EightHeader( 78, 'right', 1, ['', '-', ''], '', '\=" ".s:str." "' ) '] )
"-------------------------------------------------- incsearch and search pulse
" incsearch and vim search pulse
let g:vim_search_pulse_disable_auto_mappings = 1
let g:incsearch#auto_nohlsearch = 1
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Next or previous match is followed by a Pulse
map n <Plug>(incsearch-nohl-n)<Plug>Pulse
map N <Plug>(incsearch-nohl-N)<Plug>Pulse
map * <Plug>(incsearch-nohl-*)<Plug>Pulse
map # <Plug>(incsearch-nohl-#)<Plug>Pulse
map g* <Plug>(incsearch-nohl-g*)<Plug>Pulse
map g# <Plug>(incsearch-nohl-g#)<Plug>Pulse

" Pulses the first match after hitting the enter keyan
autocmd! User IncSearchExecute
autocmd User IncSearchExecute :call search_pulse#Pulse()
"templates
let  g:templates_directory = '/Users/giulio/dotfiles/templates'
let  g:pydocstring_templates_dir = '/Users/giulio/dotfiles/templates/docstrings/'
let g:email = "giulioungaretti@me.com"
" airline
let g:airline_powerline_fonts = 1
" smart  tab bar
let g:airline#extensions#tabline#enabled = 1
" use simple separators
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_left_sep='  '
let g:airline_right_sep='  '
" exclude airline from preview windows
let g:airline_exclude_preview = 1
let g:airline#extensions#ctrlp#color_template = 'normal'
 "----------------------------------------------------------------- syntastic
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_python_exec = '/usr/bin/python3'

" gutter & fugitive git bindings
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
" this should turn off the annoying random highlight
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1



" misc
" multiple cursors
" press esc to go back to normal mode instead of quitting multi cursor
let g:multi_cursor_exit_from_insert_mode=0
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

"remove trailing white spaces with f5
noremap <F5> :FixWhitespace <CR><CR>
" ignore trailing whitespaces on unite and mkd filetype
let g:extra_whitespace_ignored_filetypes = ['unite', 'mkd','org', 'calendar']
"autoformat code with F6
noremap <F6> :Autoformat<CR><CR>
" show untodtreee
nnoremap <F7> :UndotreeToggle<cr>
" tagbar autofous on open
nmap <c-t> :TagbarToggle  <CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose  = 1
" sort tags by file order and not by alphabetical order
let g:tagbar_sort = 0
"}}}
"------------------------------------------------------------------------- go
" {{{
" fold by sytax and style
" set style for go files
"au FileType go set noet ts=4 sw=4 sts=4
au FileType go set foldmethod=indent foldnestmax=10
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
"avoid clash with unite buffer navigator
au FileType go nmap ;b <Plug>(go-build)
au FileType go nmap ;t <Plug>(go-test)
au FileType go nmap ;c <Plug>(go-coverage)
"By default the mapping gd is enabled which opens the target identifier in current buffer. You can also open the definition/declaration in a new vertical, horizontal or tab for the word under your cursor:
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)
" format with goimports instead of gofmt too slow
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
" Enable syntax highting on everything
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck',"go"]
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"}}}
"----------------------------------------------------------------- easymotion
"{{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
"" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
""  search to char back and forwad
 nmap s <Plug>(easymotion-sl)
 nmap t <Plug>(easymotion-tl)
"}}}
"---------------------------------------------------------------- neocopmlete
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
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
        return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"---------------------------
" neocoomplete snippet
" Plug key-mappings.
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
"
let g:neocomplete#disable_auto_complete=0
let g:neocomplete#enable_auto_select=0
"}}}
"---------------------------------------------------------------- js and csss
" {{{
" tag-bar css stuff  "
let g:tagbar_type_html = {
                        \  'ctagstype' : 'html',
                        \  'kinds' : [
                        \    'f:functions',
                        \    'a:anchors',
                        \  ]
                        \}

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

" Enables HTML/CSS syntax highlighting in your JavaScript file.
let g:javascript_enable_domhtmlcss = 1
"  show nice embedded js
let javascript_enable_domhtmlcss=1
" allow js folding
let b:javascript_fold=1
"}}}
"--------------------------------------------------------------------- python
"{{{
" set 79 long ruler
au FileType python  set colorcolumn=79
" expand tab to spaces
au FileType python  set expandtab
au BufNewFile,BufRead *.py setlocal noet ts=8 sw=4 sts=4
" place  docstring template does not seem to work properly
nmap <silent> <C-d> <Plug>(pydocstring)
" JEDI and auto complete
let g:neocomplete#force_overwrite_completefunc=1
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
let g:jedi#use_splits_not_buffers = "winwidth" "this decides depending on the window length
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<leader>c"
let g:jedi#rename_command = "<leader>r"

" IPython3 tmux integration
let g:ScreenImpl = "Tmux"
" Open an IPython3 shell.
autocmd FileType python map <LocalLeader>p :IPython!<CR>
"autocmd FileType python map <LocalLeader>p :IPython!  <CR>
" Close whichever shell is running.
autocmd FileType python map <LocalLeader>q :ScreenQuit<CR>
" Send current line to python and move to next line.
autocmd FileType python map <LocalLeader>rp V:ScreenSend<CR>j
" Send visual selection to python and move to next line.
autocmd FileType python map <LocalLeader>v :ScreenSend<CR>`>0j
" Send a <CR> to ipython.
autocmd FileType python map <LocalLeader>cr :call g:ScreenShellSend("\r")<CR>
" Clear the screen.
autocmd FileType python map <LocalLeader>L
                        \ :call g:ScreenShellSend('!clear')<CR>
" Start a time  block to execute code in.
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
function! SetWD()
        let wd = '!cd ' . expand('%:p:h')
        :call g:ScreenShellSend(wd)
endfunction
autocmd FileType python map <LocalLeader>sw :call SetWD()<CR>
" Get ipython help for word under cursor. Complement it with Shift + K.
function! GetHelp()
        let w = expand("<cword>") . "??"
        :call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>h :call GetHelp()<CR>
" Get `dir` help for word under cursor.
function! GetDir()
        let w = "dir(" . expand("<cword>") . ")"
        :call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>d :call GetDir()<CR>
function! s:get_visual_selection()
endfunction
" Get `?` help for word under cursor.
function! GetHelpMagic()
        let foo_tmp =  GetVisual()
        let w = "?".foo_tmp
        :call g:ScreenShellSend(w)
endfunction
autocmd FileType python map <LocalLeader>dc :call GetHelpMagic()<CR>

" Get `dir` help for word under cursor.
function! GetLen()
        let w = "len(" . expand("<cword>") . ")"
        :call g:ScreenShellSend(w)
        echo  w
endfunction
autocmd FileType python map <LocalLeader>l :call GetLen()<CR>

" run file
autocmd FileType python nnoremap  <buffer> <leader>r :exec '!python' shellescape(@%, 1)<cr>
"  misc functinons
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
"---------------------------------------------------------------------- fzf{{{
" browse tags
function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run({
  \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
  \            '| grep -v ^!',
  \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
  \ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()

 "----------------------------------------------------------------------Unite
""set grep exex {{{
if executable('ag')
" Use ag in unite grep source.
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
\ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
\  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
" Use pt in unite grep source.
" https://github.com/monochromegane/the_platinum_searcher
let g:unite_source_grep_command = 'pt'
let g:unite_source_grep_default_opts = '--nogroup --nocolor'
let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
" Use ack in unite grep source.
let g:unite_source_grep_command = 'ack-grep'
let g:unite_source_grep_default_opts =
\ '-i --no-heading --no-color -k -H'
let g:unite_source_grep_recursive_opt = ''
endif
"}}}
" Start Insert
let g:unite_enable_start_insert = 1
let g:unite_enable_short_source_names = 1

" Enable history yank source
let g:unite_source_history_yank_enable = 1

" Shorten the default update date of 500ms
let g:unite_update_time = 300

" set up mru limit
let g:unite_source_file_mru_limit = 100

" highlight like my vim
let g:unite_cursor_line_highlight = 'CursorLine'

" format mru
let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

" set up coolguy arrow prompt
let g:unite_prompt = '➜ '

" Save session automatically.
let g:unite_source_session_enable_auto_save = 1

" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Use the rank sorter for everything
call unite#filters#sorter_default#use(['sorter_rank'])

" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ 'lib/Cake/',
      \ 'node_modules/',
      \ 'vendor/',
      \ 'Vendor/',
      \ 'app_old/',
      \ 'acf-laravel/',
      \ 'plugins/',
      \ 'bower_components/',
      \ '.sass-cache',
      \ 'web/wp',
      \ ], '\|'))

" Unite Commands ===============================================================

" No prefix for unite, leader that bish
nnoremap [unite] <Nop>

" ;f Fuzzy Find Everything
nnoremap <silent> <leader>f :<C-u>Unite
      \ -buffer-name=files file_rec/async -default-action=vsplit<CR>

" ;y Yank history
" Shows all your yanks, when you accidentally overwrite
nnoremap <silent> <leader>y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" ;o Quick outline, see an overview of this file
nnoremap <silent> <leader>o :<C-u>Unite -buffer-name=outline -vertical outline<CR>

" ;m MRU All Vim buffers, not file buffer
nnoremap <silent> <leader>m :<C-u>Unite -buffer-name=mru file_mru<CR>

" ;b view open buffers
nnoremap <silent> <leader>b :<C-u>Unite -buffer-name=buffer buffer<CR>

" ;c Quick commands, lists all available vim commands
nnoremap <silent> <leader>c :<C-u>Unite -buffer-name=commands command<CR>

" search in current dir
nnoremap <silent><leader>/ :Unite -quick-match grep:.  <cr>

" Unite motions ================================================================

" Function that only triggers when unite opens
"autocmd MyAutoCmd FileType unite call s:unite_settings()
function! s:unite_settings()

  " Ctrl jk mappings
  "imap <buffer> <c-j> <Plug>(unite_insert_leave)
  "imap <buffer> <c-k> <Plug>(unite_insert_leave)
  "nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
  "nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)

  imap <buffer> <C-n> <Plug>(unite_insert_leave)
  imap <buffer> <C-p> <Plug>(unite_insert_leave)
  nmap <buffer> <C-n> <Plug>(unite_loop_cursor_down)
  nmap <buffer> <C-p> <Plug>(unite_loop_cursor_up)

  " jj becuase you're lazy, and leave insert mode
  imap <buffer> jj <Plug>(unite_insert_leave)

  " qq `` becuase you're lazy, and quit unite
  imap <buffer> qq <Plug>(unite_exit)
  imap <buffer> `` <Plug>(unite_exit)

  " refresh unite
  nmap <buffer> <C-r> <Plug>(unite_redraw)
  imap <buffer> <C-r> <Plug>(unite_redraw)

  " split control
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')

endfunction

if has("autocmd")
augroup UniteSettingsGroup
    " Clear autocmds for this group
    autocmd!

    autocmd FileType unite call s:unite_settings()
augroup end
endif
"}}}
" --------------------------------------------------------------------- erlang
"{{{
"}}}
"}}}
" vim: foldmethod=marker sw=4 ts=4 sts=4 et tw=78
