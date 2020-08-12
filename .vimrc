" vim settings 
" author: roman krusche
" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
syntax on                              " activate syntax highlighting
filetype on                            " activate filetype detection

" %% =========================================================== %% 
" Plugins {{{
" eather source a file containing all plugin definitions: source ~/.vim/plugin/plugins.vim
" or do this right here

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise' 
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'

call plug#end()

" source stuff from Damian Conway
"source ~/.vim/plugged/hlnext.vim
"source ~/.vim/plugged/dragvisuals.vim
"source ~/.vim/plugged/vmath.vim

" }}}

" %% =========================================================== %% 
" Plugin Related Mappings {{{

" vmath.vim -- by Damian Conway --
xmap <silent><expr>  ++  VMATH_YankAndAnalyse()
nmap <silent>        ++  vip++                 

" easy-align.vim -- by junegunn --
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
set rnu
"set number relativenumber             " turn hybrid line numbers on
"set nu rnu
set nowrap                             " long lines are not wraped
set laststatus=2                       " permanently show the filename at bottom line
"set cursorline                         " highlight current cursor line
set cursorcolumn                       " highlight current cursor column

" }}}

" %% =========================================================== %% 
" Leader Mappings {{{

map <Space> <leader>
nmap <Leader>h :tabp<CR>
nmap <Leader>l :tabn<CR>
nmap <Leader>q :qall<CR>
nmap <Leader>ss :windo set scrollbind!<CR>    " toggle scrollbind on/off for synch scrolling (ss) in split windows
nmap <Leader>H <C-w>K<CR>              " switch vsplit to hsplit
nmap <Leader>V <C-w>H<CR>              " switch hsplit to vsplit
nmap <Leader>mk :setlocal foldmethod=marker<CR>
vmap <Leader>c gc

" }}}

" %% =========================================================== %% 
" Editing {{{
set expandtab shiftwidth=3 tabstop=3   " replace tab with white spaces, and set indentation to 3 spaces
set showcmd                            " this shows every command at bottom line
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap { {}<Esc>ha
inoremap jk <Esc>
inoremap kj <Esc>
inoremap < <><Esc>ha
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
" }}}

" %% =========================================================== %% 
" backup, undo, swap files {{{
set undodir=~/.vim/undo/
set backupdir=~/.vim/backup/
"set nobackup nowritebackup noswapfile " Turn off backup files
" }}}

" %% =========================================================== %% 
" Code folding {{{
" automatically save view of made folds and loding those when file is opened again
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
"function filetypeDependentComment()
"   if &filetype=='vim'
"      vnoremap ,c 
"   elseif (&filetype=='xml' || &filetype=='html')
"
"   elseif &filetype=='tex'
"
"   elseif (&filetype=='cpp' || &filetype=='c' || &filetype=='cc') 
"
"   elseif (&filetype=='sh' || &filetype=='py')
"
"   endif
"
"endfunction
" }}}
