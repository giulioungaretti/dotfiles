set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"""""""""""""""""""""""""""""""""""
" 		plugins 
"""""""""""""""""""""""""""""""""""
 " {{{ 
 " auto completino with C based stuff
Plugin 'Valloric/YouCompleteMe'
"remove and highlight trailing spaces
Plugin 'bronson/vim-trailing-whitespace'
"tmux seamless movement
Plugin 'christoomey/vim-tmux-navigator'
"indent highlight
Plugin 'Yggdroot/indentLine'
"autoclose 
Plugin 'Townk/vim-autoclose'
" sublime like mutiple cursors
Plugin 'terryma/vim-multiple-cursors'
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" add git gutter
Plugin 'airblade/vim-gitgutter' 
" tree bar
Plugin 'scrooloose/nerdtree'
" cntrl p 
Plugin 'kien/ctrlp.vim'
" nerd commenter
Plugin 'scrooloose/nerdcommenter'
" Fugtive
Plugin 'tpope/vim-fugitive'
" tasklist leader-t 
Plugin 'TaskList.vim'
" new command ds, cs, and yss i	
Plugin 'tpope/vim-surround'
"file search
Plugin 'wincent/Command-T'
"nice status bar
Plugin 'bling/vim-airline'
" structure of  file
Plugin 'majutsushi/tagbar'
" add :Gist command 
Plugin 'mattn/gist-vim'
"super tab
Plugin 'ervandew/supertab'
" add colorscheme
Plugin 'chriskempson/base16-vim'
"}}}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""
"	 Visual tweaks
"""""""""""""""""""""""""""""""""""""""
" turn on syntax highlight
syntax on
" show curret line
:set cursorline 
" customize appeararance to light grayish  bg
" hi CursorLine cterm=NONE ctermbg=234  " uselsess when using great base 16
" theme
" turn on linenumbers
:set number
"remove ugly ass separator 
set fillchars=""
"show bar
set laststatus=2
 " visual autocomplete for command menu
set wildmenu
"256 color base 16 theme
let base16colorspace=256
let &t_Co=256
colorscheme base16-default
"""""""""""airline""""""""""""""""""""
"{{{
let g:airline_powerline_fonts = 1
"}}}
"""""""""""""""""""""""""""""""""""""""
"	 		misc  tweaks
"""""""""""""""""""""""""""""""""""""""
set nobackup
set noswapfile
" tmux copypaste integration 
if $TMUX == ''
		set clipboard=unnamed
endif

" tab is 4 spaces
set clipboard=unnamed
set tabstop=4   
set clipboard=unnamed
" allows cursor change in tmux mode
 if exists('$TMUX')
     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"Plugin 'terryma/vim-multiple-cursors' kill useless keys  
"{{{
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
map <BS> <Nop>
map <Del> <Nop>
" }}}

:setlocal spell
:setlocal spell spelllang=en_us
" special mode line at end of file
set modelines=1
" 			folding {{{
set foldenable  " enalbe folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10  " max 10 nested fold allower
set foldmethod=indent " fold based on indent level
" }}}

"""""""""""""""""""""""""""""""""""""""
"			 aliases  
"""""""""""""""""""""""""""""""""""""""
" {{{ 
"coveneient stuff 
inoremap jj <Esc>
" esc esc to save
map <Esc><Esc> :w<CR>
" toogle relative line numbers
nnoremap <silent><leader>o :set relativenumber!<cr>
map <silent><leader>bl :set background=light<cr>
map  <silent><leader>bd :set background=dark<cr>
" split right and below instead of default opposite
set splitbelow
set splitright
"}}}
""""""""" common typos""""""""""""
command Q q
command W w
""""""""" plug ins  """"""""""""
map <silent><leader>n :NERDTreeFocus<CR>
nmap <F8> :TagbarToggle<CR>
" fugitive git bindings
" add current file
nnoremap <leader>ga :Git add %:p<CR><CR>
" status
nnoremap <leader>gs :Gstatus<CR>
" commit added files
nnoremap <leader>gc :Gcommit -v -q<CR>
" add and commit current file
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
" open task list
map <leader>td <Plug>TaskList
" tagbar autofous on open
let g:tagbar_autofocus = 1
"reload on save
autocmd! bufwritepost .vimrc source %
" vim:foldmethod=marker:foldlevel=1
