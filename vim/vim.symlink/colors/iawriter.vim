"
" Last Change: 2011/12/11
" Maintainer:  Jacek Dominiak <doj (at) ptpbs (dot) com>
"
" Description: Vim color file
"

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="iawriter"

hi Cursor guifg=fg guibg=#00baff
hi CursorLine   guibg=#f5f5f6
hi CursorLineNr guifg=#f5f6f6
hi Normal       guifg=#424242   guibg=#f5f6f6          ctermfg=black    ctermbg=white
hi DiffAdd                    guibg=#c0ffe0                           ctermbg=3
hi DiffDelete   guifg=#ff8097 guibg=#ffe0f7          ctermfg=4        ctermbg=5
hi DiffChange                 guibg=#cfefff                           ctermbg=9
hi DiffText                   guibg=#bfdfff gui=NONE                  ctermbg=6     cterm=NONE
hi FoldColumn guibg=#f5f6f6
hi NonText      guifg=#f5f6f6  guibg=#f5f6f6  gui=NONE ctermfg=darkblue
hi SpecialKey   guifg=grey50  guibg=grey86  gui=NONE ctermfg=darkblue
hi LineNr       guifg=#f5f6f6  guibg=#f5f6f6           ctermfg=darkblue
hi Search                     guibg=#fff999
hi StatusLine   guifg=bg      guibg=#333333 gui=NONE ctermfg=bg       ctermbg=black cterm=NONE
hi StatusLineNC guifg=bg      guibg=grey40  gui=NONE ctermfg=bg       ctermbg=black cterm=NONE
hi Visual       guifg=fg      guibg=#ccccdd gui=NONE
hi VisualNOS    guifg=bg      guibg=#ccccdd gui=NONE

" syntax highlighting groups
hi Comment      guifg=#000099 guibg=bg               ctermfg=darkblue
hi String       guifg=#b30000 guibg=bg               ctermfg=darkred
hi Constant     guifg=#c033ff guibg=bg               ctermfg=darkmagenta
hi Statement    guifg=black   guibg=bg               ctermfg=black                  cterm=NONE
hi PreProc      guifg=#335588 guibg=bg      gui=NONE ctermfg=blue
hi Type         guifg=#338855 guibg=bg      gui=NONE ctermfg=darkgreen
hi StorageClass guifg=#990000 guibg=bg               ctermfg=red
"hi Special      guifg=#6688ff guibg=bg               ctermfg=darkcyan
hi Special      guifg=#424242 guibg=bg               ctermfg=darkcyan
hi Function     guifg=#117777 guibg=bg               ctermfg=red
hi Title        guifg=#424242   guibg=bg               ctermfg=black   

" markdown syntax
hi markdownBold gui=bold
hi markdownItalic gui=italic
hi markdownBoldItalic gui=bold,italic
hi markdownLinkText guifg=#424242 gui=NONE
hi markdownUrl guifg=#929292 gui=underline
hi markdownLinkDelimiter guifg=#929292
hi markdownUrlDelimiter guifg=#929292
hi markdownUrlTitleDelimiter guifg=#929292
hi markdownLinkTextDelimiter guifg=#929292
hi markdownId guifg=#929292
hi markdownIdDeclaration guifg=#929292

" showpairs plugin
"   for cursor on paren
hi ShowPairsHL                guibg=#c4ffc4                           ctermbg=lightgreen
"   for cursor between parens
hi ShowPairsHLp               guibg=#c4f0c4                           ctermbg=lightgreen
"   unmatched paren
hi ShowPairsHLe               guibg=#ff5555                           ctermbg=red

" settings for Vim7
if version >= 700
  hi MatchParen               guibg=#c4ffc4                                             ctermbg=lightgreen
  " Spell
  hi SpellBad   guifg=#cc0000               gui=undercurl guisp=#cc0000 ctermfg=red                        cterm=underline
  hi SpellRare  guifg=magenta               gui=undercurl               ctermfg=magenta                    cterm=underline
  hi SpellCap                               gui=undercurl guisp=#22cc22                                    cterm=underline
  " Completion menu
  hi Pmenu                    guibg=#ffffcc                                             ctermbg=yellow
  hi PmenuSel                 guibg=#ddddaa                                             ctermbg=lightcyan  cterm=NONE
  hi PmenuSbar                guibg=#999966                                             ctermbg=lightcyan
  " Tab line
  hi TabLine                  guibg=grey70                                                                 cterm=underline
  hi TabLineSel                             gui=NONE                                                       cterm=NONE
  hi TabLineFill guifg=black  guibg=grey80                                                                 cterm=underline
endif
