call plug#begin('~/.vim/plugged')
let s:uname = system("uname -s") " grab os name
" colors
set t_Co=256
" --------------------------------------------------------------------- Plugs
" {{{
if s:uname == "Darwin\n"
    " use global pyhton3
    " no idea how this works with venvs
    let g:python3_host_prog = "/usr/local/bin/python3"
    "Mac specific plug ins
    " search in osx dictionary
    Plug 'jonhiggs/MacDict.vim'
    " this should make it work with osx/tmux/madness
    set clipboard+=unnamed
endif
if s:uname == "Linux\n"
    " Do linux stuff here
    " use global pyhton3
    " no idea how this works with venvs
    let g:python3_host_prog = "/usr/bin/python3"
    " use sys wide syntastic
    let g:syntastic_python_python_exec = '/usr/bin/python3'
    set clipboard=unnamedplus
    " sync vim clipboard to x clipboard
    autocmd VimLeave * call system("xsel -ib", getreg('+'))
    " look up documentation
    Plug 'KabbAmine/zeavim.vim'
    :nmap <silent> <leader>d <Plug>Zeavim           " <leader>z (NORMAL mode)
    :vmap <silent> <leader>d<Plug>ZVVisSelection   " <leader>z (VISUAL mode)
endif
" Text objects, folding, and more for Python and other indented languages.
Plug 'tweekmonster/braceless.vim'
"  enable for python only with autoident, folding, and hilight current level
autocmd FileType python BracelessEnable +indent +fold +highlight

" make search great again
Plug 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


" sane pair mappings [l, ]l
Plug 'Tpope/vim-unimpaired'
" easymotion
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

function! ToggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax on
     endif
endfunction

function! ColorGitStuff()
    let current_filetype = &filetype
    if current_filetype == "gitcommit"
        syntax enable
    else
        syntax off
     endif
endfunction

" manually reduce noise
map <F7> :call ToggleSyntax() <CR>
" automatically reudce noise
autocmd BufEnter *  call ColorGitStuff()
autocmd TabEnter *  call ColorGitStuff()
autocmd WinEnter *  call ColorGitStuff()
autocmd BufAdd *  call ColorGitStuff()

"" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" snip engine
Plug 'SirVer/ultisnips'
" snippets
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" check syntax
Plug 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '~/.pyenv/shims/python'
let g:syntastic_python_checkers = ['flake8']

" add session stufff for tmux ressurect
Plug 'tpope/vim-obsession'
" regain focus events in tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
" Fix tmux (limited to iTerm, Konsole, and xterm) im cursor shape.
Plug 'jszakmeister/vim-togglecursor'

"Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" complete word from dictionary
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
imap <c-x><c-p> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <silent>; :Commands <cr>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>W :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>. :Lines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
" seach current dir with Ag
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR> <CR>
nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>gb :BCommits<CR>
function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
endfunction

" todo and notes fzf powered
" open task list for todo in current folder and subfolder
noremap <Leader>tl  :Ag TODO <CR>
" open task list for note in current folder and subfolder
noremap <Leader>nl :Ag NOTE <CR>
" }}} 

" headers
Plug 'bimbalaszlo/vim-eightheader'
" hide cursorline inactive buffer
Plug 'vim-scripts/CursorLineCurrentWindow'
" templates for empty files
Plug 'aperezdc/vim-template'
" align table
Plug 'godlygeek/tabular'
" send line to tmux
Plug 'ervandew/screen'
" tmux seamless movement
Plug 'christoomey/vim-tmux-navigator'
" remove and highlight trailing spaces
Plug 'bronson/vim-trailing-whitespace'
" indent highlight
Plug 'Yggdroot/indentLine'
" auto-format code
Plug 'chiel92/vim-autoformat'
"autoformat code with F6
noremap <F6> :Autoformat<CR><CR>
let g:formatter_yapf_style = 'google'
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
" colorschemes
Plug 'chriskempson/base16-vim'
highlight SignColumn ctermbg=0
hi VertSplit  ctermbg=0
" zen writing
Plug 'junegunn/goyo.vim'
" highlighcolors
Plug 'chrisbra/Colorizer'
"----------------------------------------------------------- language specific
" 👓  interactive code pad
Plug 'metakirby5/codi.vim'
"ƛ
" {{{
"elixir
Plug 'elixir-lang/vim-elixir'
" erlang
" omnifunc!
Plug 'vim-erlang/vim-erlang-omnicomplete'
" compiler
Plug 'vim-erlang/vim-erlang-compiler'
" elm
Plug 'elmcast/elm-vim'
au FileType elm nmap <leader>b <Plug>(elm-make)
au FileType elm nmap <leader>m <Plug>(elm-make-main)
au FileType elm nmap <leader>t <Plug>(elm-test)
au FileType elm nmap <leader>r <Plug>(elm-repl)
au FileType elm nmap <leader>e <Plug>(elm-error-detail)
au FileType elm nmap <leader>d <Plug>(elm-show-docs)
au FileType elm nmap <leader>w <Plug>(elm-browse-docs)
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1
au BufNewFile,BufRead *.elm setlocal noet ts=2 sw=2 sts=2 expandtab
" }}}
 "---------------------------------------------------------------- python {{{
" turn on virtualenvs
Plug 'alfredodeza/pytest.vim'
Plug 'jmcantrell/vim-virtualenv' , { 'for': 'python' }
" auto docstrings 
Plug 'heavenshell/vim-pydocstring'
let g:pydocstring_enable_mapping = 0
" jedi autocpmletion and smart code fu
Plug 'davidhalter/jedi-vim'
let g:jedi#force_py_version = 3
" defaultjs
let g:jedi#goto_command = "<leader>d"
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures  = 2
" don't auto complete
let g:jedi#popup_on_dot = 0
" Plug 'tmhedberg/SimpylFold'
" let g:SimpylFold_docstring_preview = 1
" screen stuff
let g:ScreenImpl = "Tmux"
" Open an IPython3 shell.
autocmd FileType python map <LocalLeader>p :IPython!<CR>
" autocmd FileType python map <LocalLeader>p :IPython!  <CR>
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
"}}}
"-------------------------------------------------------------------------golang {{{
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'garyburd/go-explorer'
" open in term
let g:go_term_enabled = 1
let g:go_term_mode = "vsplit"
" fold by sytax and style
" set style for go files
au FileType go set foldmethod=indent foldnestmax=10
au FileType go set nolist
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
" --------------------------------------------------------------------------js
" {{{{
au BufNewFile,BufRead *.js setlocal noet ts=2 sw=2 sts=2 expandtab
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
" emmet
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
" better js syntax
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'gavocanov/vim-js-indent'
let g:neomake_javascript_enabled_makers = ['eslint']
Plug 'mephux/vim-jsfmt', { 'do': 'npm install -g jsfmt' }
" like go fmt
let g:js_fmt_autosave = 0
" }}}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
:let g:airline_theme='base16'
" always show bar
set laststatus=2
" don't show mode
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_y =''
let g:airline_section_z = ''
call plug#end()
"}}}
"------------------------------------------------------------------- Plug ins
"{{{
map <C-p> :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
" UNDO
if has("persistent_undo")
    set undodir=$HOME/.undodir/
    set undofile
endif
" zen mode with Goyo
nnoremap <silent><Leader>F :Goyo <CR>
"templates
let  g:templates_directory = '/Users/giulio/dotfiles/templates'
let  g:pydocstring_templates_dir = '/Users/giulio/dotfiles/templates/docstrings/'
let g:email = "giulioungaretti@me.com"
" gutter & fugitive git bindings
" open diff
nnoremap <leader>gd :Gdiff<CR>
" add current file
nnoremap <leader>ga :Git add %:p<CR><CR>
" status
nnoremap <leader>gs :Gstatus<CR>
" commit added files
nnoremap <leader>gc :Gcommit -q -v<CR>
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
" ignore trailing whitespaces  mkd
let g:extra_whitespace_ignored_filetypes = ['mkd']

" tagbar autofous on open
nmap <c-t> :TagbarToggle  <CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose  = 1
" sort tags by file order and not by alphabetical order
let g:tagbar_sort = 0
"}}}

" colors
set t_Co=256

let g:gitgutter_override_sign_column_highlight = 0
highlight clear signcolumn
highlight SignColumn ctermbg=0
set mousehide "Hide when characters are typed
"color of the current line number
nnoremap <silent><leader>oo :set relativenumber!<cr>
" we don't need no hilighted matching partentheses
" NoMatchParen is a command to the loaded plugin to ask it to stop matching.
" Setting "loaded_matchparen", on the other hand, stops the plugin from
" ever loading (by making it think that it's already running).
let loaded_matchparen = 1
let loaded_matchparen = 1
Plug 'Raimondi/delimitMate'
"theme {{{
function s:CheckColorScheme()
  let g:base16colorspace=256
  let s:config_file = expand('~/.vim/.base16')
  if filereadable(s:config_file)
    let s:config = readfile(s:config_file, '', 2)
    if s:config[1] =~# '^dark\|light$'
        if filereadable(expand('~/.vim/plugged/base16-vim/colors/base16-' . s:config[0] . '-' . s:config[1] . '.vim'))
          execute 'color base16-' . s:config[0] . '-' . s:config[1]
          highlight SignColumn ctermbg=0
          hi VertSplit  ctermbg=0
          syntax off
        else
          echoerr 'Bad scheme ' . s:config[0] . .s:config[1] ' in ' . s:config_file
        endif
    else
        if filereadable(expand('~/.vim/plugged/base16-vim/colors/base16-' . s:config[0] . '.vim'))
          execute 'color base16-' . s:config[0]
          highlight SignColumn ctermbg=0
          hi VertSplit  ctermbg=0
          syntax off
        else
          echoerr 'Bad scheme ' . s:config[0] . ' in ' . s:config_file
        endif
    endif
  else
    color base16-pico
    highlight SignColumn ctermbg=0
    hi VertSplit  ctermbg=0
    syntax off
  endif
endfunction

if v:progname !=# 'vi'
  if has('autocmd')
    augroup AutoColor
       autocmd!
       autocmd FocusGained * call s:CheckColorScheme()
       autocmd BufEnter * call s:CheckColorScheme()
       autocmd FocusGained * AirlineRefresh
       autocmd VimResized * execute "normal! \<c-w>="
    augroup END
  endif
endif
if has('gui_running')
    autocmd GUIEnter * call s:CheckColorScheme()
    autocmd GUIEnter * AirlineRefresh
endif
"}}}
" load mappings
source $HOME/dotfiles/vimMaps

"reload on save
autocmd! bufwritepost .vimrc source %

"vim: foldmethod=marker sw=4 ts=4 sts=4 et tw=78
