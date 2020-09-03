" Vim syntax file
" Language: pps_blue
" Maintainer: roman krusche
" Latest Revision: 31.08.2020
"
" note: that using \v as the the beginning of any regular expression will
" trigger the "very magic" regex parsing engine.
" note: match longer patterns after samller ones, since groups defined later have
" priority over groups fefined earlier.
" =============================================================================

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "blue"

" match yes/no keywords
syn keyword blueBoolean contained yes no
" match TODOs
syn keyword blueTodo contained TODO FIXME
syn match blueComment "\v#.*$" contains=blueTodo

" match numbers 
" Regular int like number with - + or nothing in front
syn match celNumber '\v\d\+' contained display
syn match celNumber '\v[-+]\d\+' contained display
" Floating point number with decimal no E or e (+,-)
syn match celNumber '\v\d\+\.\d*' contained display
syn match celNumber '\v[-+]\d\+\.\d*' contained display
" Floating point like number with E and no decimal point (+,-)
syn match celNumber '\v[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+' contained display
syn match celNumber '\v\d[[:digit:]]*[eE][\-+]\=\d\+' contained display
" Floating point like number with E and decimal point (+,-)
syn match celNumber '\v[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display
syn match celNumber '\v\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display

" match blue sections
syn match blueSections "\v^\[\+.*\]\+\s*$"

" There must be a more sophisticated solution for this. Any suggestions?
" But for now, this is the best I could do with my limited knowledge of 
" regular expressions.
" some blue sections contain white spaces, maybe: ^\[\{1}[^\[].*\]\{1}$
" do the regions(any variables) contain lists of [...]? this makes the matching of the region
" more difficult. But matching the end of line $ might help with that.
syn region blueRegionLevel4 start=+\v^\[\{4}[^\[].*\]\{4}$+ end=+\v^\[\{4}+ fold transparent contained 
syn region blueRegionLevel3 start=+\v^\[\{3}[^\[].*\]\{3}$+ end=+\v^\[\{3}+ fold transparent contained contains=blueRegionLevel4
syn region blueRegionLevel2 start=+\v^\[\{2}[^\[].*\]\{2}$+ end=+\v^\[\{2}+ fold transparent contained contains=blueRegionLevel3
syn region blueRegionLevel1 start=+\v^\[\{1}[^\[].*\]\{1}$+ end=+\v^\[\{1}+ fold transparent contains=blueRegionLevel2

" match commented blue section
"syn keyword blueComment ^\[\+XXX.*\]\+$

" ======================================================================
" set highlight
hi def link blueTodo        Todo
hi def link blueSections    Statement 
hi def link blueComment     Comment
hi def link blueBoolean     Boolean
" set highlighting for region to gray if commented using XXX
