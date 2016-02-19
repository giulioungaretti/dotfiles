" {{{
" grab os name
let s:uname = system("uname -s")
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
call plug#begin('~/.vim/plugged')
"}}}
" --------------------------------------------------------------------- Plugs
" {{{
if s:uname == "Darwin\n"
    "Mac specific plug ins
    " search in osx dictionary
    Plug 'jonhiggs/MacDict.vim'
    Plug 'rizzatti/dash.vim'
    :nmap <silent> <leader>d <Plug>DashSearch
    " search in osx dictionary
    " this should make it work with osx/tmux/madness
    set clipboard+=unnamed
endif
if s:uname == "Linux\n"
    " Do linux stuff here
    set clipboard=unnamedplus
    " sync vim clipboard to x clipboard
    autocmd VimLeave * call system("xsel -ib", getreg('+'))
    " look up documentation
    Plug 'KabbAmine/zeavim.vim'
    :nmap <silent> <leader>d <Plug>Zeavim           " <leader>z (NORMAL mode)
    :vmap <silent> <leader>d<Plug>ZVVisSelection   " <leader>z (VISUAL mode)
endif
" neomake
Plug 'benekastah/neomake'
" and run neomake on save
autocmd! BufWritePost * Neomake
" add session stufff for tmux ressurect
Plug 'tpope/vim-obsession'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Fix tmux (limited to iTerm, Konsole, and xterm) im cursor shape.
Plug 'jszakmeister/vim-togglecursor'
" nice start page
Plug 'mhinz/vim-startify'
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Rainbow paranthesis
Plug 'junegunn/rainbow_parentheses.vim'
" headers
Plug 'bimbalaszlo/vim-eightheader'
" hide cursorline inactive buffer
Plug 'vim-scripts/CursorLineCurrentWindow'
" templates for empty files
Plug 'aperezdc/vim-template'
" align table
Plug 'godlygeek/tabular'
" eyecany bar
"Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" send line to tmux
Plug 'ervandew/screen'
" tmux seamless movement
Plug 'christoomey/vim-tmux-navigator'
" TODO This is a (hopefully) temporary workaround for neovim#2048.
if has('nvim')
    nmap <silent><bs> :<c-u>TmuxNavigateLeft<cr>
endif
" remove and highlight trailing spaces
Plug 'bronson/vim-trailing-whitespace'
" indent highlight
Plug 'Yggdroot/indentLine'
" autoclose
Plug 'Townk/vim-autoclose'
" sublime like mutiple cursors
Plug 'terryma/vim-multiple-cursors'
" add git gutter
Plug 'airblade/vim-gitgutter'
" nerd commenter
Plug 'scrooloose/nerdcommenter'
" fuGITve
Plug 'tpope/vim-fugitive'
" new command ds, cs, and yss i
Plug 'tpope/vim-surround'
" structure of  file
Plug 'majutsushi/tagbar'
" add :Gist command
Plug 'mattn/gist-vim'
" required
Plug 'mattn/webapi-vim'
" use silver searcher
Plug 'rking/ag.vim'"
" colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'antonshulgin/vim.colors'
" zen writing
Plug 'junegunn/goyo.vim'
" highlighcolors
Plug 'chrisbra/Colorizer'
"----------------------------------------------------------- language plugins
" golang
Plug 'fatih/vim-go', { 'for': 'go' }
" All of your Plugs must be added before the following line
call plug#end()
"}}}
" -------------------------------------------------------------------- Visual
"{{{
" turn on syntax highlight
syntax on
" show grammar on gitcommit
autocmd FileType gitcommit setlocal spell
" show curret line
set cursorline
"remove ugly ass  split separator
set fillchars=""
set laststatus=0
" visual autocomplete for command menu
set wildmenu
" redraw only when we need to
set lazyredraw
" theme {{{
set background=light
colorscheme PaperColor
set noshowmode
function! Light()
    set background=light
    if exists(':AirlineRefresh')
        :AirlineRefresh
    endif
endfunction

function! Dark()
    set background=dark
    if exists(':AirlineRefresh')
        :AirlineRefresh
    endif
endfunction
"" map functions to bgl and bgd
map <silent><leader>bgl :call Light()<cr>
map  <silent><leader>bgd :call Dark()<cr>
"}}}
set mousehide "Hide when characters are typed
" color of the current line number
nnoremap <silent><leader>oo :set relativenumber!<cr>
"}}}
" ------------------------------------------------------------------ Settings
"{{{
au VimLeave * :!clear
" vim-sensible
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set nrformats-=octal
" use bash as shell
set shell=/bin/sh
" Don't use Ex mode, use Q for formatting
map Q gq
" zero msec timeout  http://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0
"Extend word designators
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=_                    " '_' is an end of word designator
set iskeyword-=-                    " '_' is an end of word designator
" no backup and swap files.
set nobackup
set noswapfile
" special mode line at end of file
set modelines=1
" md files as markdown
autocmd BufRead,BufNew *.md set filetype=markdown
" highlight as you type
" smart case when searching
set ignorecase
set incsearch
nnoremap <silent><esc> :noh<return><esc>
" highlight matching [{()}]
set showmatch
set smartcase
" better mouse interaction is no mouse integration
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
" run os command and get results in quickfix window.
command -nargs=+ Run :cexpr system('<args>') | copen
command! -nargs=+ SS :bufdo vimgrepadd <f-args> % | copen
command! -nargs=* SA :!grep -n -R <f-args> | copen
" leader
map <space> <leader>
" redo last colon command
nmap @@ @:
nmap <silent>; :Commands <cr>
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
"jk/kj to  to esc
inoremap jk <Esc>
inoremap kj <Esc>
" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" merge line below
" merge and split
nnoremap M mzJ`z
" Split line (sister to [M]merge lines above)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
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
map <C-p> :NERDTreeToggle<CR>
" UNDO
if has("persistent_undo")
    set undodir=.undodir/
    set undofile
endif
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
"templates
let  g:templates_directory = '/Users/giulio/dotfiles/templates'
let  g:pydocstring_templates_dir = '/Users/giulio/dotfiles/templates/docstrings/'
let g:email = "giulioungaretti@me.com"
" airline
let g:airline_powerline_fonts = 1
" smart  tab bar
let g:airline#extensions#tabline#enabled = 0
" use simple separators
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_left_sep='  '
let g:airline_right_sep='  '
" exclude airline from preview windows
let g:airline_exclude_preview = 1
let g:airline#extensions#ctrlp#color_template = 'normal'
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
" multiple cursors
" press esc to go back to normal mode instead of quitting multi cursor
let g:multi_cursor_exit_from_insert_mode=0
"remove trailing white spaces with f5
noremap <F5> :FixWhitespace <CR><CR>
" ignore trailing whitespaces on unite and mkd filetype
let g:extra_whitespace_ignored_filetypes = ['unite', 'mkd','org', 'calendar']
" tagbar autofous on open
nmap <c-t> :TagbarToggle  <CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose  = 1
" sort tags by file order and not by alphabetical order
let g:tagbar_sort = 0
"}}}
"-------------------------------------------------------------------------golang {{{
" fold by sytax and style
" set style for go files
au FileType go set foldmethod=indent foldnestmax=10
" match gofmt style
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
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
" auto import stuff
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
let g:go_auto_type_info = 0
"}}}
" vim: foldmethod=marker sw=4 ts=4 sts=4 et tw=78
