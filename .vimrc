" vim settings 
" author: roman krusche
" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
syntax on                              " activate syntax highlighting
" There is no need to do :filetype on after :syntax on
"filetype on                            " activate filetype detection
let $BASH_ENV="~/.vim/vim_bash"        " expand aliases in running external bash commands

" %% =========================================================== %% 
" Plugins {{{

" eather source a file containing all plugin definitions: source ~/.vim/plugin/plugins.vim
" or do this right here

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise' 
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'

call plug#end()

" }}}

" %% =========================================================== %% 
" Plugin Related Mappings {{{

" vmath.vim -- by Damian Conway --
xnoremap <silent><expr>  ++  VMATH_YankAndAnalyse()
nnoremap <silent>        ++  vip++                 

" easy-align.vim -- by junegunn --
" Start interactive EasyAlign in visual mode (e.g. vipga)
xnoremap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)

" }}}

" %% =========================================================== %% 
" Optics {{{

colorscheme sublimemonokai
"colorscheme gruvbox
"colorscheme desert
"colorscheme atomified
"colorscheme argonaut
"colorscheme archman
"colorscheme blackboard

set relativenumber                     " activate relative line numbers
set nu
"set number relativenumber             " turn hybrid line numbers on
"set nu rnu
set nowrap                             " long lines are not wraped
set laststatus=2                       " permanently show the filename at bottom line
" create custom statusline content
set statusline=%f\ -\ FileType:\ %y\ -\ Buffer\ Nr:\ %n%=\L:\ %4l/%L\ (%%%p)\ C:\ %c
"set cursorline                         " highlight current cursor line
set cursorcolumn                       " highlight current cursor column

" }}}

" %% =========================================================== %% 
" Leader Mappings {{{

map <Space> <leader>
nnoremap <Leader>h :tabp<CR>
nnoremap <Leader>l :tabn<CR>
nnoremap <Leader>q :qall<CR>

" toggle scrollbind on/off for synch scrolling (ss) in split windows
nnoremap <Leader>ss :windo set scrollbind!<CR>    

" switch vsplit to hsplit
nnoremap <Leader>H <C-w>K<CR>
" switch hsplit to vsplit
nnoremap <Leader>V <C-w>H<CR>              

nnoremap <Leader>mk :setlocal foldmethod=marker<CR>

" using vim-commentary on selected lines
vnoremap <Leader>c gc

" edit & source the vimrc
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>tev :tabedit $MYVIMRC<CR>
nnoremap <Leader>sor :source $MYVIMRC<CR> 

" open NERD Tree side bar
nnoremap <Leader>nt :NERDTree<CR> 

" move through buffers
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>

" show filetype
nnoremap <Leader>ft :set filetype?<CR>

" }}}

" %% =========================================================== %% 
" Editing {{{

set expandtab shiftwidth=3 tabstop=3   " replace tab with white spaces, and set indentation to 3 spaces
set showcmd                            " this shows every command at bottom line
set smartindent
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap { {}<Esc>ha
inoremap jk <Esc>
inoremap kj <Esc>
inoremap < <><Esc>ha

" move over a closing parentheses in insert mode
inoremap <C-l> <esc>la
inoremap <C-h> <esc>ha

" move current line down 
nnoremap - ddp
" move current line up
nnoremap _ ddkP

" convert last contiguous string to upper case letters
inoremap <C-u> <esc>viWUea
nnoremap <C-u> mmviWU`m

" }}}

" %% =========================================================== %% 
" Operator-Pending Mappings {{{

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap il[ :<c-u>normal! F]vi[<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>

" }}}

" %% =========================================================== %% 
" Abbreviations {{{

"augroup filetype_section_autocomplet
"   autocmd!       " when this file is sourced again, this will unlink and re-attach the augroup
"   autocmd FileType python :iabbrev <buffer> ifc if:<left>
"   autocmd FileType sh :iabbrev <buffer> ifc if;<space>then<CR><CR>fi<up><up><right>
"augroup END

"cnoremap :regex<CR> :tabedit ~/Documents/00_dotfiles/vim_regex_cheatsheet.txt<CR>

" }}}

" %% =========================================================== %% 
" Search behaviour {{{

set hlsearch                           " Highlight search results
set ignorecase smartcase               " Search queries intelligently set case
set incsearch                          " Show search results as you type

" }}}

" %% =========================================================== %% 
" Splits {{{

set splitright                         " Open new splits to the right
set splitbelow                         " Open new splits to the bottom
" resize vertical splits to factor of current winwidth
nnoremap <silent> <Leader>v< :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>v> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
" increment vertical split winwidth by 10 columns
nnoremap <silent> <Leader>vi :vertical resize +10<CR>
nnoremap <silent> <Leader>vd :vertical resize -10<CR>
" resize horizontal splits to factor of current winheight
"nnoremap <silent> <Leader>h+ :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> <Leader>h- :exe "resize " . (winheight(0) * 2/3)<CR>

" }}}

" %% =========================================================== %% 
" backup, undo, swap files {{{

set undodir=~/.vim/undo/
set backupdir=~/.vim/backup/
"set nobackup nowritebackup noswapfile " Turn off backup files
set hidden        " this keeps closed files in a hidden buffer (even unsaved)

" }}}

" %% =========================================================== %% 
" Code folding {{{

" automatically save view of made folds and loading those when file is opened again
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

" }}}

" %% =========================================================== %% 
" File Find {{{

" use * for fuzzy find tab-completion
" :b lets you tab-complete any open buffers
set path+=**                           " search down into subfolders. provide tab-completion for all file-related tasks
set wildmenu                           " display all matching files when using tab-complet. Wildcards can be used.

" Ignored files/directories from autocomplete
set wildignore+=*.zip
set wildignore+=*.pdf
set wildignore+=*.tar.gz
set wildignore+=*.synctex.gz
set wildignore+=*.docx
set wildignore+=*.docm
set wildignore+=*.xlsx
set wildignore+=*.xlsm
set wildignore+=*.pptx
set wildignore+=*.pptm
"set wildignore+=*/tmp/*

" }}}

" %% =========================================================== %% 
" Functions {{{

" Highlight a column in csv text.
" :Csv 1    " highlight first column
" :Csv 12   " highlight twelfth column
" :Csv 0    " switch off highlight
function! CSVH(colnr)
  if a:colnr > 1
    let n = a:colnr - 1
    execute 'match Keyword /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
    execute 'normal! 0'.n.'f,'
  elseif a:colnr == 1
    match Keyword /^[^,]*/
    normal! 0
  else
    match
  endif
endfunction
command! -nargs=1 Csv :call CSVH(<args>)

" }}}
