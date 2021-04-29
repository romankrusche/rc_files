" Vim syntax file
" Language: pps_blue
" Maintainer: roman krusche
" Latest Revision: 31.08.2020
"
" note: match longer patterns after samller ones, since groups defined later have
" priority over groups defined earlier.
" =============================================================================

if exists("b:current_syntax")
  finish
endif

" match yes/no keywords
syn keyword blueBoolean contained yes no
" match TODOs
syn keyword blueTodo contained TODO FIXME
syn match blueComment "^#.*$" contains=blueTodo

" match numbers 
" Regular int like number with - + or nothing in front
syn match blueNumber '\d\+' contained display
syn match blueNumber '[-+]\d\+' contained display
" Floating point number with decimal no E or e (+,-)
syn match blueNumber '\d\+\.\d*' contained display
syn match blueNumber '[-+]\d\+\.\d*' contained display
" Floating point like number with E and no decimal point (+,-)
syn match blueNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+' contained display
syn match blueNumber '\d[[:digit:]]*[eE][\-+]\=\d\+' contained display
" Floating point like number with E and decimal point (+,-)
syn match blueNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display
syn match blueNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display

" match blue sections
syn match blueSections "^\[\+[a-zA-Z0-9_\- ]*\]\+\s*$" contained contains=blueNumber
syn match blueSectionsC "^\[\+XXX[a-zA-Z0-9_\- ]*\]\+\s*$" contained contains=blueNumber
" There must be a more sophisticated solution for this. Any suggestions?
" But for now, this is the best I could do with my limited knowledge of 
" regular expressions.
syn region blueRegionLevelEight  start=+^\[\{8}[^\[][a-zA-Z0-9_\- ]*\]\{8}$+ end=+^\(\[\{1,8}[^\[][a-zA-Z0-9_\- ]*\]\{1,8}\)\@=+ fold transparent contains=blueComment,blueSections,blueSectionsC
syn region blueRegionLevelSeven  start=+^\[\{7}[^\[][a-zA-Z0-9_\- ]*\]\{7}$+ end=+^\(\[\{1,7}[^\[][a-zA-Z0-9_\- ]*\]\{1,7}\)\@=+ fold transparent contains=blueComment,blueSections,blueSectionsC,blueRegionLevelEight
syn region blueRegionLevelSix    start=+^\[\{6}[^\[][a-zA-Z0-9_\- ]*\]\{6}$+ end=+^\(\[\{1,6}[^\[][a-zA-Z0-9_\- ]*\]\{1,6}\)\@=+ fold transparent contains=blueComment,blueSections,blueSectionsC,blueRegionLevelSeven
syn region blueRegionLevelFive   start=+^\[\{5}[^\[][a-zA-Z0-9_\- ]*\]\{5}$+ end=+^\(\[\{1,5}[^\[][a-zA-Z0-9_\- ]*\]\{1,5}\)\@=+ fold transparent contains=blueComment,blueSections,blueSectionsC,blueRegionLevelSix
syn region blueRegionLevelFour   start=+^\[\{4}[^\[][a-zA-Z0-9_\- ]*\]\{4}$+ end=+^\(\[\{1,4}[^\[][a-zA-Z0-9_\- ]*\]\{1,4}\)\@=+ fold transparent contains=blueComment,blueSections,blueSectionsC,blueRegionLevelFive
syn region blueRegionLevelThree  start=+^\[\{3}[^\[][a-zA-Z0-9_\- ]*\]\{3}$+ end=+^\(\[\{1,3}[^\[][a-zA-Z0-9_\- ]*\]\{1,3}\)\@=+ fold transparent contains=blueComment,blueSections,blueSectionsC,blueRegionLevelFour
syn region blueRegionLevelTwo    start=+^\[\{2}[^\[][a-zA-Z0-9_\- ]*\]\{2}$+ end=+^\(\[\{1,2}[^\[][a-zA-Z0-9_\- ]*\]\{1,2}\)\@=+ fold transparent contains=blueComment,blueSections,blueSectionsC,blueRegionLevelThree
syn region blueRegionLevelOne    start=+^\[\{1}[^\[][a-zA-Z0-9_\- ]*\]\{1}$+ end=+^\(\[\{1}[^\[][a-zA-Z0-9_\- ]*\]\{1}\)\@=+ fold transparent contains=blueComment,blueSections,blueSectionsC,blueRegionLevelTwo
" new approach on setting the foldlevel per line
function! SetBlueFoldlevel(lnum)
   let lnum = 1 
   let cufldlevel = 0
   while lnum <= line('$')
      if getline(a:lnum) =~# '^\s*$'
         return -1
      elseif getline(lnum) =~# '^\[\{'cufldlevel'}[^\[][a-zA-Z0-9_\- ]*\]\{'cufldlevel'}$'
         return cufldlevel
      elseif getline(lnum) =~# '^\[\{'cufldlevel+1'}[^\[][a-zA-Z0-9_\- ]*\]\{'cufldlevel+1'}$'
         let cufldlevel += 1
         return cufldlevel
      elseif getline(lnum) =~# '^\[\{'cufldlevel-1'}[^\[][a-zA-Z0-9_\- ]*\]\{'cufldlevel-1'}$'
         let cufldlevel -= 1
         return cufldlevel
      endif
      let lnum += 1
endwhile 
endfunction

hi def link blueComment     Comment
hi def link blueTodo        Todo
" hi def link blueSections    Statement 
hi def link blueNumber      Constant

highlight blueSections guifg=#87d700 gui=bold ctermfg=112 term=bold
highlight blueSectionsC guifg=#949494 gui=bold ctermfg=246 term=bold

let b:current_syntax = "blue"
