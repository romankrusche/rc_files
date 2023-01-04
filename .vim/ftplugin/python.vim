" ----------------------------------------------------------------------
" author: Roman Krusche
" last edit: 03/2021
" brief: this should append missing colon character upon exit, where they make
" sense
" ----------------------------------------------------------------------
if exists("g:python_syntax_check")
  finish
endif
let g:python_syntax_check = 1

function! Py_append_missing_colon() abort
   let l:lnum = 1
   let l:numlines = line('$')      " get total number of lines in file
   let l:keywordLst = ['if', 'else', 'elif', 'class', 'for', 'def', 'with']
   " echom len(keywordLst)
   " echom numlines
   while l:lnum <= l:numlines
      let l:currline = getline(l:lnum)
      for keyw in keywordLst
         " if currline =~# '^\s\+' . keyw . '\s.*'
         if currline =~# '^#.*'
            " ignore commented lines
            " echom l:lnum . ": " . keyw . ": ignore comment line"
            continue
         endif

         if currline =~# '^\s*' . keyw . '\s.*'
            echom keyw . ": " . l:currline
            if currline =~# '.*' . keyw . '.*#.*'
               " if there is a comment at the end of the line
               " if this comment includes one of the keywords TODO
               echom "comment"
            endif
         endif
      endfor
      " echom lnum
      let l:lnum += 1
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
"
" another idea: initialize python for data science
function! Py_init_datasc() abort
   execute "normal! ggjIimport numpy as np\<cr>import matplotlib.pyplot as plt\<cr>\<esc>"
endfunction
