syntax on
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
set iskeyword-=-                    " '_' is an end of word designator

" no backup and swap files.
set nobackup
set noswapfile

set modeline
set modelines=5

" smart case when searching
set ignorecase
set smartcase
" highlight as you type
set incsearch
set showmatch

" better mouse interaction is no mouse integration
set mouse=""
"Hide when characters are typed
set mousehide

"folding
set nofoldenable  " enable folding
set foldnestmax=10  " max 10 nested fold allowed
set foldmethod=indent " fold based on indent level
" automatic fold save and restore on buf leave enter (per window)
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
" scroll the view port faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>"

" md files as markdown
autocmd BufRead,BufNew *.md set filetype=markdown

" show grammar on gitcommit
autocmd FileType gitcommit setlocal spell
autocmd FileType rst setlocal spell

"remove ugly ass  split separator
set fillchars=""
" visual autocomplete for command menu
set wildmenu
" ignore pattern for wildmenu
set wildignore+=*.a,*.o,*.pyc,*~,*.swp,*.tmp

" show hidden characters
set list "
set list listchars=tab:»·,trail:·

set tabstop=4
set shiftwidth=4
set expandtab

" Persitent UNDO
if has("persistent_undo")
    " unix only
    " TODO use vim's mkdir
    " !mkdir -p $HOME/.undodir/
    set undodir=$HOME/.undodir/
    set undofile
endif
" }}}

" Common typos {{{
command! Q q
command! Qq q
command! W w
command! Ww w
command! Qa qa
command! Wa wa
command! Wq wq
command! Wqa wqa
"}}}

" Aliases {{{
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
nnoremap <leader>P :call TogglePasteMode()<CR>

" move to right insert mode
inoremap l;  <Esc>la

" edit in fullscreen
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

nnoremap <silent><C-W>m :call Fullscreen() <CR>
nnoremap <silent><C-W>c :call Minimze() <CR>

" tabs shortcuts
map <leader>tn :tabnew<CR>

"jk/kj to  to esc
inoremap jk <Esc>
inoremap kj <Esc>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" merge and split
" merge line below
nnoremap M mzJ`z

" split line (sister to [M]merge lines above)
" the normal use of S is covered by cc, so don't worry about shadowing it.
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
" turn on and off spell checking
map <F10> :setlocal spell! spelllang=en_us<CR>

" buffers
" cycle through open buffers
nnoremap <silent><C-W><C-d> :bnext<CR>
nnoremap <silent><C-W><C-a> :bprevious<CR>

" current line number
nnoremap <silent><leader>rl :set relativenumber!<cr>

" redraw only when we need to
set lazyredraw
" clean screen up
au VimLeave * :!clear

" we don't need no hilighted matching partentheses
" NoMatchParen is a command to the loaded plugin to ask it to stop matching.
" Setting "loaded_matchparen", on the other hand, stops the plugin from
" ever loading (by making it think that it's already running).
let loaded_matchparen = 0

" change the 'completeopt' option so that Vim's popup menu doesn't select the first completion item, but rather just inserts the longest common text of all matches; and the menu will come up even if there's only one match. (The longest setting is responsible for the former effect and the menuone is responsible for the latter.)
set completeopt=longest,menuone
"change the behavior of the <Enter> key when the popup menu is visible. In that case the Enter key will simply select the highlighted menu item, just as <C-Y> does.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"make <C-N> work the way it normally does; however, when the menu appears, the <Down> key will be simulated. What this accomplishes is it keeps a menu item always highlighted. This way you can keep typing characters to narrow the matches, and the nearest match will be selected so that you can hit Enter at any time to insert it. In the above mappings, the second one is a little more exotic: it simulates <C-X><C-O> to bring up the omni completion menu, then it simulates <C-N><C-P> to remove the longest common text, and finally it simulates <Down> again to keep a match highlighted.
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
            \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
            \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" }}}

set noshowmode
" OS specfic settings

let s:uname = system("uname -s") " grab os name

if s:uname == "Darwin\n"
    set clipboard=unnamed
endif

if s:uname == "Linux\n"
    set clipboard=unnamedplus
endif

" tmux 
function! TmuxMove(direction)
        let wnr = winnr()
        silent! execute 'wincmd ' . a:direction
        " If the winnr is still the same after we moved, it is the last pane
        if wnr == winnr()
                call system('tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR'))
        end
endfunction

nnoremap <silent> <c-h> :call TmuxMove('h')<cr>
nnoremap <silent> <c-j> :call TmuxMove('j')<cr>
nnoremap <silent> <c-k> :call TmuxMove('k')<cr>
nnoremap <silent> <c-l> :call TmuxMove('l')<cr>

" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1

" Do not show stupid q: window
map q: :q
map qq :q <CR>

" only hilights the row in the current active window
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

" reload on save
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %

if filereadable(glob("~/.vimPlug"))
    source  $HOME/.vimPlug
endif
" vim: foldmethod=marker sw=4 ts=4 sts=4 et tw=78
