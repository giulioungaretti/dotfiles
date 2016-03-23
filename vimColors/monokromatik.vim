" Anton Shulgin <anton.shulgin@gmx.com>

hi clear
set background=dark

let g:colors_name="monokromatik"

if exists("syntax_on")
  syntax reset
endif

hi Normal             guifg=#666666 guibg=#ffffff gui=NONE        ctermfg=241 ctermbg=231   cterm=NONE
hi Comment            guifg=#bbbbbb guibg=NONE    gui=italic      ctermfg=248 ctermbg=NONE  cterm=NONE

hi Special            guifg=#111111 guibg=NONE    gui=bold,italic ctermfg=233 ctermbg=NONE  cterm=bold
hi Label              guifg=#111111 guibg=NONE    gui=bold,italic ctermfg=233 ctermbg=NONE  cterm=bold
hi Keyword            guifg=#111111 guibg=NONE    gui=bold,italic ctermfg=233 ctermbg=NONE  cterm=bold

hi Title              guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi Underlined         guifg=NONE    guibg=NONE    gui=underline   ctermfg=NONE ctermbg=NONE cterm=NONE

hi htmlTag            guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi htmlTagName        guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi htmlSpecialTagName guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi htmlEndTag         guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold

hi xmlTag             guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi xmlSpecialTagName  guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi xmlTagName         guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi xmlEndTag          guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold

hi Identifier         guifg=#111111 guibg=NONE    gui=bold        ctermfg=233  ctermbg=NONE cterm=bold
hi Statement          guifg=#111111 guibg=NONE    gui=bold        ctermfg=233  ctermbg=NONE cterm=bold
hi Function           guifg=#111111 guibg=NONE    gui=bold        ctermfg=233  ctermbg=NONE cterm=bold
hi Type               guifg=#111111 guibg=NONE    gui=italic      ctermfg=233  ctermbg=NONE cterm=NONE
hi PreProc            guifg=#222222 guibg=NONE    gui=italic      ctermfg=235  ctermbg=NONE cterm=NONE

hi Operator           guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold

hi Boolean            guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi Constant           guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi Number             guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi Float              guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi String             guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi Character          guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold

hi Ignore             guifg=#cccccc guibg=NONE    gui=NONE        ctermfg=251  ctermbg=NONE cterm=NONE

hi Include            guifg=NONE    guibg=NONE    gui=bold,italic ctermfg=NONE ctermbg=NONE cterm=bold
hi Define             guifg=NONE    guibg=NONE    gui=bold,italic ctermfg=NONE ctermbg=NONE cterm=bold
hi Macro              guifg=NONE    guibg=NONE    gui=bold,italic ctermfg=NONE ctermbg=NONE cterm=bold

hi LineNr             guifg=#cccccc guibg=NONE    gui=NONE        ctermfg=251  ctermbg=NONE cterm=NONE
hi NonText            guifg=#dddddd guibg=NONE    gui=NONE        ctermfg=253  ctermbg=NONE cterm=NONE
hi SpecialKey         guifg=#dddddd guibg=NONE    gui=NONE        ctermfg=253  ctermbg=NONE cterm=NONE

hi Directory          guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi Search             guifg=#222200 guibg=#ffffaa gui=NONE        ctermfg=0    ctermbg=228  cterm=NONE
hi IncSearch          guifg=#222200 guibg=#ffffaa gui=bold        ctermfg=0    ctermbg=228  cterm=bold

hi Error              guifg=#ff4444 guibg=NONE    gui=bold        ctermfg=196  ctermbg=NONE cterm=bold
hi Todo               guifg=#ffaa00 guibg=NONE    gui=bold        ctermfg=208  ctermbg=NONE cterm=bold

hi ModeMsg            guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi MoreMsg            guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold
hi ErrorMsg           guifg=#ff4444 guibg=NONE    gui=bold        ctermfg=196  ctermbg=NONE cterm=bold
hi WarningMsg         guifg=#ffaa00 guibg=NONE    gui=bold        ctermfg=208  ctermbg=NONE cterm=bold
hi Question           guifg=NONE    guibg=NONE    gui=bold        ctermfg=NONE ctermbg=NONE cterm=bold

hi StatusLine         guifg=#111111 guibg=NONE    gui=bold        ctermfg=233  ctermbg=NONE cterm=bold
hi StatusLineNC       guifg=#bbbbbb guibg=NONE    gui=NONE        ctermfg=248  ctermbg=NONE cterm=NONE
hi VertSplit          guifg=#bbbbbb guibg=NONE    gui=NONE        ctermfg=248  ctermbg=NONE cterm=NONE

hi Visual             guifg=#ffffff guibg=#333333 gui=NONE        ctermfg=15   ctermbg=236  cterm=NONE
hi VisualNOS          guifg=#ffffff guibg=#333333 gui=NONE        ctermfg=15   ctermbg=236  cterm=NONE

hi Folded             guifg=#bbbbbb guibg=NONE    gui=NONE        ctermfg=248  ctermbg=NONE cterm=NONE
hi FoldColumn         guifg=#bbbbbb guibg=NONE    gui=NONE        ctermfg=248  ctermbg=NONE cterm=NONE

hi Pmenu              guifg=#111111 guibg=#eeeeee gui=NONE        ctermfg=233  ctermbg=255  cterm=NONE
hi PmenuSel           guifg=#ffffff guibg=#ff0022 gui=NONE        ctermfg=15   ctermbg=196  cterm=NONE
hi WildMenu           guifg=#ffffff guibg=#ff0022 gui=NONE        ctermfg=15   ctermbg=196  cterm=NONE

hi TabLine            guifg=NONE    guibg=NONE    gui=NONE        ctermfg=NONE ctermbg=NONE cterm=NONE
hi TabLineFill        guifg=NONE    guibg=NONE    gui=NONE        ctermfg=NONE ctermbg=NONE cterm=NONE
hi TabLineSel         guifg=#ffffff guibg=#ff0022 gui=NONE        ctermfg=15   ctermbg=196  cterm=NONE

hi Cursor             guifg=#ffffff guibg=#ff0022 gui=NONE        ctermfg=15   ctermbg=196  cterm=NONE
hi CursorLine         guifg=#ffffff guibg=#ff0022 gui=NONE        ctermfg=0    ctermbg=254 cterm=NONE
hi CursorLineNr       guifg=#ffffff guibg=#ff0022 gui=NONE        ctermfg=15   ctermbg=196  cterm=NONE
hi ColorColumn        guifg=NONE    guibg=#eeeeee gui=NONE        ctermfg=NONE ctermbg=255  cterm=NONE

hi MatchParen         guifg=#ff4444 guibg=#ffeeee gui=bold        ctermfg=196  ctermbg=NONE cterm=bold

hi IndentGuidesOdd    guifg=NONE    guibg=NONE    gui=NONE        ctermfg=NONE ctermbg=NONE cterm=NONE
hi IndentGuidesEven   guifg=NONE    guibg=NONE    gui=NONE        ctermfg=NONE ctermbg=NONE cterm=NONE

hi SignColumn         guifg=NONE    guibg=NONE    gui=NONE        ctermfg=NONE ctermbg=NONE cterm=NONE

hi DiffAdd            guifg=NONE    guibg=#ddffcc gui=NONE        ctermfg=NONE ctermbg=191  cterm=NONE
hi DiffDelete         guifg=#eebbaa guibg=#ffddcc gui=NONE        ctermfg=203  ctermbg=209  cterm=NONE
hi DiffChange         guifg=#aa9988 guibg=#ffffee gui=NONE        ctermfg=166  ctermbg=228  cterm=NONE
hi DiffText           guifg=NONE    guibg=#ffffee gui=NONE        ctermfg=NONE ctermbg=228  cterm=NONE
