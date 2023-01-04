" ----------------------------------------------------------------------
" author: Roman Krusche
" last edit: 10/2021
" ----------------------------------------------------------------------
if exists("g:html_stuff")
  finish
endif
let g:html_stuff = 1

function! Init_html()
    call append(0, '<!DOCTYPE HTML>')
    call append(1, '<html lang="en-US">')
    call append(2, '<head>')
    call append(3, '    <title></title>')
    call append(4, '    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />')
    call append(5, '    <style type="text/css">')
    call append(6, '    </style>')
    call append(7, '</head>')
    call append(8, '<body>')
    call append(9, '</body>')
    call append(10, '</html>')
endfunction
