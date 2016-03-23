" Anton Shulgin <anton.shulgin@gmx.com>

hi clear
set background=dark

let g:colors_name="kitamorkonom"

if exists("syntax_on")
  syntax reset
endif

hi Normal             guifg=#999999 guibg=#111111 gui=NONE        ctermfg=247 ctermbg=233   cterm=NONE
hi Comment            guifg=#444444 guibg=NONE    gui=italic      ctermfg=238 ctermbg=NONE  cterm=NONE

hi Special            guifg=#ffffff guibg=NONE    gui=bold        ctermfg=15  ctermbg=NONE  cterm=bold
hi Label              guifg=#ffffff guibg=NONE    gui=bold,italic ctermfg=15  ctermbg=NONE  cterm=bold
hi Keyword            guifg=#ffffff guibg=NONE    gui=bold,italic ctermfg=15  ctermbg=NONE  cterm=bold

hi Title              guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi Underlined         guifg=NONE    guibg=NONE    gui=underline   ctermfg=NONE ctermbg=NONE cterm=underline

hi htmlTag            guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi htmlTagName        guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi htmlSpecialTagName guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi htmlEndTag         guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
                                                                                                      
hi xmlTag             guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi xmlSpecialTagName  guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi xmlTagName         guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi xmlEndTag          guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
                                                                                                      
hi Identifier         guifg=#ffffff guibg=NONE    gui=bold        ctermfg=15   ctermbg=NONE cterm=bold
hi Statement          guifg=#ffffff guibg=NONE    gui=bold        ctermfg=15   ctermbg=NONE cterm=bold
hi Function           guifg=#ffffff guibg=NONE    gui=bold        ctermfg=15   ctermbg=NONE cterm=bold
hi Type               guifg=#ffffff guibg=NONE    gui=italic      ctermfg=15   ctermbg=NONE cterm=NONE
hi PreProc            guifg=#cccccc guibg=NONE    gui=italic      ctermfg=251  ctermbg=NONE cterm=NONE
                                                                                                      
hi Operator           guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
                                                                                                      
hi Boolean            guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi Constant           guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi Number             guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi Float              guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi String             guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi Character          guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
                                                                                                      
hi Ignore             guifg=#333333 guibg=NONE    gui=NONE        ctermfg=236  ctermbg=NONE cterm=NONE
                                                                                                      
hi Include            guifg=NONE    guibg=NONE    gui=bold,italic ctermfg=NONE ctermbg=NONE cterm=bold
hi Define             guifg=NONE    guibg=NONE    gui=bold,italic ctermfg=NONE ctermbg=NONE cterm=bold
hi Macro              guifg=NONE    guibg=NONE    gui=bold,italic ctermfg=NONE ctermbg=NONE cterm=bold
                                                                                                      
hi LineNr             guifg=#444444 guibg=NONE    gui=NONE        ctermfg=238  ctermbg=NONE cterm=NONE
hi NonText            guifg=#222222 guibg=NONE    gui=NONE        ctermfg=234  ctermbg=NONE cterm=NONE
hi SpecialKey         guifg=#222222 guibg=NONE    gui=NONE        ctermfg=234  ctermbg=NONE cterm=NONE
                                                                                                      
hi Directory          guifg=#ffffff guibg=NONE    gui=bold        ctermfg=15   ctermbg=NONE cterm=bold
hi Search             guifg=#eeff00 guibg=#223300 gui=NONE        ctermfg=190  ctermbg=NONE cterm=NONE
hi IncSearch          guifg=#eeff00 guibg=#223300 gui=bold        ctermfg=190  ctermbg=NONE cterm=bold
                                                                                                      
hi Error              guifg=#ff4444 guibg=NONE    gui=bold        ctermfg=196  ctermbg=NONE cterm=bold
hi Todo               guifg=#ffaa00 guibg=NONE    gui=bold        ctermfg=214  ctermbg=NONE cterm=bold
                                                                                                      
hi ModeMsg            guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi MoreMsg            guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi ErrorMsg           guifg=#ff4444 guibg=NONE    gui=bold        ctermfg=196  ctermbg=NONE cterm=bold
hi WarningMsg         guifg=#ffaa00 guibg=NONE    gui=bold        ctermfg=214  ctermbg=NONE cterm=bold
hi Question           guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
                                                                                                      
hi StatusLine         guifg=#ffffff guibg=NONE    gui=bold        ctermfg=15   ctermbg=NONE cterm=bold
hi StatusLineNC       guifg=#444444 guibg=NONE    gui=NONE        ctermfg=238  ctermbg=NONE cterm=NONE
hi VertSplit          guifg=#444444 guibg=NONE    gui=NONE        ctermfg=238  ctermbg=NONE cterm=NONE
                                                                                                      
hi Visual             guifg=#111111 guibg=#ffffff gui=NONE        ctermfg=233  ctermbg=15   cterm=NONE
hi VisualNOS          guifg=#111111 guibg=#ffffff gui=NONE        ctermfg=233  ctermbg=15   cterm=NONE
                                                                                                      
hi Folded             guifg=#444444 guibg=NONE    gui=NONE        ctermfg=238  ctermbg=NONE cterm=NONE
hi FoldColumn         guifg=#444444 guibg=NONE    gui=NONE        ctermfg=238  ctermbg=NONE cterm=NONE
                                                                                                      
hi Pmenu              guifg=#ffffff guibg=#222222 gui=NONE        ctermfg=15   ctermbg=234  cterm=NONE
hi PmenuSel           guifg=#ffffff guibg=#ff0022 gui=NONE        ctermfg=15   ctermbg=196  cterm=NONE
hi WildMenu           guifg=#ffffff guibg=#ff0022 gui=NONE        ctermfg=15   ctermbg=196  cterm=NONE
                                                                                                      
hi TabLine            guifg=NONE    guibg=NONE    gui=NONE        ctermfg=NONE ctermbg=NONE cterm=NONE
hi TabLineFill        guifg=NONE    guibg=NONE    gui=NONE        ctermfg=NONE ctermbg=NONE cterm=NONE
hi TabLineSel         guifg=#ffffff guibg=#ff0022 gui=NONE        ctermfg=15   ctermbg=196  cterm=NONE
                                                                                                      
hi Cursor             guifg=#ffffff guibg=#ff0022 gui=NONE        ctermfg=15   ctermbg=196  cterm=NONE
hi CursorLine         guifg=#ffffff guibg=#ff0022 gui=NONE        ctermfg=15   ctermbg=237 cterm=NONE
hi CursorLineNr       guifg=#ffffff guibg=#ff0022 gui=NONE        ctermfg=15   ctermbg=196  cterm=NONE
hi ColorColumn        guifg=NONE    guibg=#222222 gui=NONE        ctermfg=NONE ctermbg=234  cterm=NONE
                                                                                                      
hi MatchParen         guifg=#ff4444 guibg=#221111 gui=bold        ctermfg=196  ctermbg=52   cterm=bold
                                                                                                      
hi IndentGuidesOdd    guifg=NONE    guibg=NONE    gui=NONE        ctermfg=NONE ctermbg=NONE cterm=NONE
hi IndentGuidesEven   guifg=NONE    guibg=NONE    gui=NONE        ctermfg=NONE ctermbg=NONE cterm=NONE
                                                                                                      
hi SignColumn         guifg=NONE    guibg=NONE    gui=NONE        ctermfg=NONE ctermbg=NONE cterm=NONE
                                                                                                      
hi DiffAdd            guifg=NONE    guibg=#112211 gui=NONE        ctermfg=NONE ctermbg=22   cterm=NONE
hi DiffDelete         guifg=#332222 guibg=#221111 gui=NONE        ctermfg=52   ctermbg=52   cterm=NONE
hi DiffChange         guifg=#555550 guibg=#242420 gui=NONE        ctermfg=130  ctermbg=NONE cterm=NONE
hi DiffText           guifg=NONE    guibg=#242420 gui=NONE        ctermfg=NONE ctermbg=235  cterm=NONE
