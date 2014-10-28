set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"""""""""""""""""""""""""""""""""""
" 		plugins 
"""""""""""""""""""""""""""""""""""
 " {{{ 
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
Plugin 'itchyny/lightline.vim'
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
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
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
"""""""""""""""""""""""""""""""""""""""
"	 		misc  tweaks
"""""""""""""""""""""""""""""""""""""""
set nobackup
set noswapfile
if $TMUX == ''
		set clipboard=unnamed
endif

" tab is 4 spaces
set clipboard=unnamed
set tabstop=4   
set clipboard=unnamed
autocmd! bufwritepost .vimrc source %
" allows cursor change in tmux mode
 if exists('$TMUX')
     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
         let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
     else
            let &t_SI = "\<Esc>]50;CursorShape=1\x7"
            let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"Plugin 'terryma/vim-multiple-cursors' kill useless keys  {{{
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
map <BS> <Nop>
map <Del> <Nop>
" }}}

" special mode line at end of file
set modelines=1
"""""""""""""""""""""""""""""""""""""""
" 			folding {{{
set foldenable  " enalbe folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10  " max 10 nested fold allower
set foldmethod=indent " fold based on indent level
" }}}

"""""""""""""""""""""""""""""""""""""""
"			 aliases  
"""""""""""""""""""""""""""""""""""""""

" 		 coveneient stuff 
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
""""""""" common typos""""""""""""
command Q q
command W w
""""""""" plug ins  """"""""""""
map <silent><leader>n :NERDTreeFocus<CR>
nmap <F8> :TagbarToggle<CR>
" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
map <leader>td <Plug>TaskList
let g:tagbar_autofocus = 1
" vim:foldmethod=marker:foldlevel=1
