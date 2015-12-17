"%% SiSU Vim color file
" Slate Maintainer: Ralph Amissah <ralph@amissah.com>
" (originally looked at desert Hans Fugal <hans@fugal.net> http://hans.fugal.net/vim/colors/desert.vim (2003/05/06)
:set background=dark
:highlight clear
if version > 580
 hi clear
 if exists("syntax_on")
 syntax reset
 endif
endif
let colors_name = "deku"
:hi Normal ctermfg=246
:hi VertSplit cterm=reverse
:hi Folded ctermfg=7 ctermbg=8
:hi ModeMsg ctermfg=7
:hi Search ctermfg=7 ctermbg=1
:hi SpecialKey ctermfg=3
:hi Visual ctermbg=8 ctermfg=0
:hi Special guifg=darkkhaki ctermfg=14
:hi Include  ctermfg=1
:hi PreProc ctermfg=1
:hi Define ctermfg=1
:hi LineNr  ctermfg=241

:hi Pmenu ctermbg=1
:hi PmenuSel ctermbg=0 ctermfg=1

" Keywords
:hi Identifier ctermfg=1
:hi Repeat ctermfg=1
:hi Conditional ctermfg=1
:hi Statement ctermfg=1
:hi Exception ctermfg=1
:hi StorageClass ctermfg=1
:hi Type ctermfg=1
:hi Constant ctermfg=1
:hi Typedef ctermfg=1
:hi Boolean ctermfg=1
:hi Operator ctermfg=1
:hi Structure ctermfg=1
" Numbers
:hi Number ctermfg=6
" Strings
:hi Character ctermfg=6
:hi String ctermfg=6
" Include
" Comment
:hi Comment ctermfg=241
" Functions
:hi Function ctermfg=246

" Operators and Parentheses
:hi Paren ctermfg=7
:hi Oper ctermfg=8
":hi Operator ctermfg=8
