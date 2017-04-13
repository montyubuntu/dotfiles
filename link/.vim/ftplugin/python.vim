set t_Co=256
" set term=xterm
set background=dark
" colorscheme molokai

set expandtab " see PEAR Coding Standards
set tabstop=4
set shiftwidth=4
set showmode
set showcmd
set showmatch

" make buffer switching work nicely
" (depends on bufpos plugin)
map <S-b> :bprev!<CR>
map <S-n> :bnext!<CR>

" toggle taglist
map <C-t><C-t> :TlistToggle<CR>

" toggle nerdtree
map <C-n><C-t> :NERDTreeToggle<CR>

set laststatus=2
let g:buftabs_in_statusline=1

" file type plugin
filetype plugin on
set ofu=syntaxcomplete#Complete

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

let g:vim_markdown_folding_disabled=1

autocmd BufWritePre *.py :%s/\s\+$//e

let python_highlight_all=1

autocmd BufWritePost *.py call Flake8()

" disable rope totally or set debug if rope hangs vim on write
" let g:pymode_rope = 0
" let g:pymode_debug=1

" pymod settings
let g:pymod_run=1
let g:pymode_folding=1
let g:pymode_options=1
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_slow_sync=1
let g:pymode_trim_whitespaces=1
let g:pymode_lint=0
let g:pymode_doc=0
let g:pymode_rope=0

