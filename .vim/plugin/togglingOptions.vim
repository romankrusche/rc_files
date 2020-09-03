" this is an example how to toggle options
" from the book "Learn Vimscript the Hard Way" chapter 38
" for this to work, this file must be placed in ~/.vim/plugin/

" foldcolumn {{{

" this toggles the presence of the  foldcolumn

nnoremap <leader>f :call <SID>FoldColumnToggle()<CR>

function! s:FoldColumnToggle()
   if &foldcolumn
      setlocal foldcolumn=0
   else
      setlocal foldcolumn=4
   endif
endfunction

" }}}

" quickfix{{{

" this one I don't use, also it overwrites the qall mapping 
" I have in my .vimrc
" nnoremap <leader>q :call QuickfixToggle()<CR>

" let g:quickfix_is_open = 0

" function! QuickfixToggle()
"    if g:quickfix_is_open
"       cclose
"       let g:quickfix_is_open = 0
"       execute g:quickfix_return_to_window . "wincmd w"
"    else
"       " save current window number before opening quickfix window
"       let g:quickfix_return_to_window = winnr()
"       copen
"       let g:quickfix_is_open = 1
"    endif
" endfunction

" }}}


