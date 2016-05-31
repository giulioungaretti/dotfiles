" ---------------------------------------------------------------------- init
" {{{
set nocompatible              " be iMproved, required
" grab os name
let s:uname = system("uname -s")
call plug#begin('~/.vim/plugged')
"}}}
" --------------------------------------------------------------------- Plugs
" {{{
if s:uname == "Darwin\n"
    " this should make it work with osx/tmux/madness
    set clipboard+=unnamed
endif
if s:uname == "Linux\n"
    " Do linux stuff here
    set clipboard=unnamedplus
    " sync vim clipboard to x clipboard
    autocmd VimLeave * call system("xsel -ib", getreg('+'))
endif
" Fix tmux (limited to iTerm, Konsole, and xterm) im cursor shape.
Plug 'jszakmeister/vim-togglecursor'
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
imap <c-x><c-p> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>W :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> ; :Commands<CR>
nnoremap <silent> <leader>. :Lines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
" easymotions
Plug 'Lokaltog/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
"" JK motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" move between windwos
Plug 'christoomey/vim-tmux-navigator'
" add git gutter
Plug 'airblade/vim-gitgutter'
" this should turn off the annoying random highlight
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
" nerd commenter
Plug 'scrooloose/nerdcommenter'
" fuGITve
Plug 'tpope/vim-fugitive'
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
" text-object for surroundings
Plug 'tpope/vim-surround'
"Old text                  Command     New text ~
""Hello *world!"           ds"         Hello world!
"[123+4*56]/2              cs])        (123+456)/2
""Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
"if *x>3 {                 ysW(        if ( x>3 ) {
"my $str = *whee!;         vllllS'     my $str = 'whee!';
" structure of  file
Plug 'majutsushi/tagbar'
" colorschemes
Plug 'NLKNguyen/papercolor-theme'
" almost monochrome
Plug 'antonshulgin/vim.colors'
" elm
" {{{
Plug 'ElmCast/elm-vim'
let g:elm_format_autosave = 1
"}}}
"python 
"{{{
" turn on virtualenvs
Plug 'jmcantrell/vim-virtualenv'
" jedi autocpmletion and smart code fu
Plug 'davidhalter/jedi-vim'
let g:jedi#force_py_version = 3
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#show_call_signatures = "2"
" do not complete on dot
let g:jedi#popup_on_dot = 0
" defaultjs
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
"}}}
call plug#end()
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
" ignore pattern for wildmenu
set wildignore+=*.a,*.o,*.pyc,*~,*.swp,*.tmp
set list " show hidden characters
set list listchars=tab:»·,trail:·
set tabstop=2
set shiftwidth=2
set expandtab
" redraw only when we need to
set lazyredraw
" theme {{{
set background=dark
colorscheme PaperColor
"}}}
set mousehide "Hide when characters are typed
" color of the current line number
nnoremap <silent><leader>oo :set relativenumber! number!<cr>
"}}}
" ------------------------------------------------------------------ Settings
"{{{
"The above command will change the 'completeopt' option so that Vim's popup menu doesn't select the first completion item, but rather just inserts the longest common text of all matches; and the menu will come up even if there's only one match. (The longest setting is responsible for the former effect and the menuone is responsible for the latter.)
set completeopt=longest,menuone
"change the behavior of the <Enter> key when the popup menu is visible. In that case the Enter key will simply select the highlighted menu item, just as <C-Y> does.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"make <C-N> work the way it normally does; however, when the menu appears, the <Down> key will be simulated. What this accomplishes is it keeps a menu item always highlighted. This way you can keep typing characters to narrow the matches, and the nearest match will be selected so that you can hit Enter at any time to insert it. In the above mappings, the second one is a little more exotic: it simulates <C-X><C-O> to bring up the omni completion menu, then it simulates <C-N><C-P> to remove the longest common text, and finally it simulates <Down> again to keep a match highlighted.
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
            \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
            \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

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
set incsearch
" highlight matching [{()}]
set showmatch
" smart case when searching
set ignorecase
set smartcase
nnoremap <silent><esc> :noh<return><esc>
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
" leader
map <space> <leader>
" redo last colon command
nmap @@ @:
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
" UNDO
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif
" Enable omni completion.
set omnifunc=syntaxcomplete#Complete
" vim: foldmethod=marker sw=4 ts=4 sts=4 et tw=78
