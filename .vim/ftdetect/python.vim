" ----------------------------------------------------------------------
" author: Roman Krusche
" last edit: 03/2021
" brief: this should append missing semi-colon upon exit, where they make
" sense
" ----------------------------------------------------------------------
if exists("g:python_syntax_check")
  finish
endif
let g:python_syntax_check = 1

function! Append_missing_colon() abort
   let lnum = 1
   let numlines = line('$')      " get total number of lines in file
   while lnum <= numlines
      let currline = getline(lnum)
      if currline =~# '^if .*'

      endif

      let lnum += 1
   endwhile
endfunction
" TODO
" recognize if, else, elif
" class (subclasses/inheritance)
" def funcname():
" for all of these recognise comment at end of line, check if last character
" before the comment character # that is not whitespace is a ":" or not else
" append it
"
"
" for the future regonisze unclosed parenths. 
