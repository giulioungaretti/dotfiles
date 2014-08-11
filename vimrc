"giulio 10/8/2014
"plain and simple
"Basics -----------------------------------------------------------------
execute pathogen#infect()
call pathogen#helptags()
set runtimepath+=~/Dropbox/Dotfiles/.vim
vnoremap y "*y
nnoremap y "*yy
vnoremap p "*p
nnoremap p "*p

set foldlevel=99
"# cliboard issues on osx:
if $TMUX == ''
	set clipboard=unnamed
endif
"remap esec esc to save file
map <Esc><Esc> :w<CR>
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype
""
"nextline seems to work on osx, and on linux via sssh
""
let base16colorspace=256
let &t_Co=256
colorscheme base16-default
"set background=dark
set laststatus=2
set number
"map jj to exit
inoremap jj <Esc>
"highlight current line
set cursorline
 " visual autocomplete for command menu
set wildmenu
"disable paowerline fonts---compatible everywhere!
"let g:airline_powerline_fonts = 1
"""""""""""""""""""""""""""
"Easier split navitagions"
"""""""""""""""""""""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
""""" easyer buffer navigation
" hides all the buffer so you can leave it without saving but keeping changes
:set hidden
nnoremap <Leader>h :bnext<CR>
nnoremap <leader>l :bprevious<CR>
"vim slime --> send text to a tmux session
"shortcuts:
"
let g:slime_target = "tmux"
" folding {{{
set foldenable  " enalbe folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10  " max 10 nested fold allower
" }}}
set foldmethod=indent " fold based on indent level
"toogle gundo
nnoremap <leader>u :GundoToggle<CR>
" special mode line at end of file
set modelines=1
" pymode bidings and options{{{
let g:pymode_doc = 1
let g:pymode_trim_whitespaces = 1
"enalbe python specific options
"If this option is set to 1, pymode will enable the following options for
"python buffers: >
    "setlocal complete+=t
    "setlocal formatoptions-=t
    "if v:version > 702 && !&relativenumber
        "setlocal number
    "endif
    "setlocal nowrap
    "setlocal textwidth=79
    "setlocal commentstring=#%s
    "setlocal define=^\s*\\(def\\\\|class\\)
let g:pymode_options = 1
"enable python motion through classes and functions
let g:pymode_motion = 1
"turun off slow rope autocompletion
let g:pymode_rope_completion = 0
"folding with zc-lose, zo-pen
let g:pymode_folding = 1
" }}}
" latex-box settings {{{
let g:LatexBox_viewer = '/Applications/Skim.app/Contents/MacOS/Skim'
let g:LatexBox_latexmk_async = 0
let g:LatexBox_latexmk_preview_continuously = 1
" }}}
" toogle relative line numbers
nnoremap <silent><leader>n :set relativenumber!<cr>
" vim:foldmethod=marker:foldlevel=0
