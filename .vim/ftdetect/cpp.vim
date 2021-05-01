" ----------------------------------------------------------------------
" author: Roman Krusche
" last edit: 03/2021
" brief: this should append missing semi-colon upon exit, where they make
" sense
" ----------------------------------------------------------------------
if exists("g:cpp_semicolon_append")
  finish
endif
let g:cpp_semicolon_append = 1

" TODO, think this through
" function! NextNonBlankLine(lnum)
"     let numlines = line('$')
"     let current = a:lnum

"     while current <= numlines
"         if getline(current) =~? '\v\S'
"             return current
"         endif

"         let current += 1
"     endwhile

"     return -2
" endfunction

function! Append_missing_semi_colon() abort
   " save current location of cursor
   let save_cursor = getcurpos()   
   let lnum = 1
   let numlines = line('$')      " get total number of lines in file
   while lnum <= numlines
      let currline = getline(lnum)
      
      " exclude multi line comments, empty lines, lines containing ";" or normal
      " comments
      " TODO There might be lines where there is code before a multi line
      " comment starts. These also need to be checked for semi colon existance
      if currline =~# '[^\*]*\/\*.*' && currline =~# '.*\*\/'     " begin and end of multi line comment in same line
         let lnum +=1
         continue
      elseif currline =~# '[^\*]*\/\*.*'
         let isMultComment = 1 
         let lnum +=1
         continue
      elseif isMultComment && currline !~# '.*\*\/'
         let lnum +=1
         continue
      elseif isMultComment && currline =~# '.*\*\/'
         let isMultComment = 0
         let lnum +=1
         continue
      elseif currline =~# '^\s*$' || currline =~# '.*;.*$' || currline =~# '^\s*\/\/.*$' 
         " exclude empty lines, lines that end in semi-colon, and beginning
         " with //
         let lnum +=1
         continue
      elseif currline =~# '.*{\s*$'
         let lnum +=1
         continue
      elseif currline =~# 'template<.*>'
         let lnum +=1
         continue
      elseif currline =~# 'class [a-zA-Z0-9_]'
         " check if this line or next has "{"
         " if so, find the closing one check if it is followed by a ";"
         " if not, append it. 
         " if next line or this one do not have a {, this is only a declaration
         " not the implementation of the class, this needs to finish with ";"
      endif
      
      " if 

      "    " the individual cases 
      "    if currline !~# '^template<.*>'                " template not followed by ;
      "          \ || currline !~# '^class .*\{\s*$'      " class definition TODO: for classes there muss be a ; after the closing scope }
      "          \ || currline !~# '^\s*\{\s*$'            " this is the beginning of a new scope in a new line
      "       echo lnum ": " currline
      "       sleep 80m
      "    endif
      " endif

      let lnum += 1
   endwhile 

   " resore cursor postion
   call setpos('.', save_cursor)
endfunction

" function! Append_semicolon() abort
"    a:goto_line G 
"    let s:line = getline('.')
"    if =~# '.*//.*'
"       " if there is a comment at the end, first the correct pos in the line
"       " must be found
"       " TODO -> how to get the character below the cursor?
"    else
"       A;<Esc> 
"    endif
" endfunction


" function! Append_colon(a:goto_line) abort

" endfunction
"TODO when does this not make sense?
" ^.*{$
"
" ^.*($    
"
" if there is a "{" without matching "}" if there is not the keyword class befor "{" 
"
"
" member initializer list(^\s*:.*$) regex might look like this:
" ^.*(.*)\s*:.*(,.*)* --> for online member init list. TODO for multipline
" member init list
" 
" template <typename T>
"
" if there is a "//" comment in a line, check if there is a ; before the //
" and adjascent to the last character that was not whitespace
"
" lines containing a return, "=" or function() declaration (so no {} following
" "()" need a ";" at the end)
"
" not behind keywords like private:, public:... BUT:
" inside any class also append ":" behind public & private keyword, if missing
