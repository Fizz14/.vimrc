"Use jj to go into normal mode, in the console and in insertmode
inoremap kj <Esc>
tnoremap kj <C-w>N

"Don't get lazy!
noremap <Esc> nop

"Formating
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

"Ctrl+T will duplicate the current tab, in either mode
nnoremap <C-t> :tab split<CR>
inoremap <C-t> <Esc>:tab split<CR>

"Use L and : to change tabs
nnoremap L gT
nnoremap : gt

"Use space to enter commands
nnoremap <space> :
xnoremap <space> :

"Recenter the camera after finding next occurance with /
nnoremap n nzz
nnoremap N Nzz
"nnoremap Y y$

noremap l h
noremap ; l
set backspace=indent,eol,start
noremap h /
set timeoutlen=300

"Treat jkl; as hjkl
tnoremap <C-w>l <C-w>h
tnoremap <C-w>; <C-w>l
tnoremap <C-w>L <C-w>H
tnoremap <C-w>: <C-w>L

nnoremap <C-w>l <C-w>h
nnoremap <C-w>; <C-w>l
nnoremap <C-w>L <C-w>H
nnoremap <C-w>: <C-w>L

"Open a terminal with Ctrl+space, open a browser with ctrl+k
nnoremap <C-@> :bo term<CR>
nnoremap <C-k> :E<CR>

"Shift+k is go to context in a new tab
nnoremap K <C-w><C-]><C-w>T

"Move tabs with Alt+arrowkey
noremap <A-Left>  :-tabmove<cr>
noremap <A-Right> :+tabmove<cr>

"Hidden folds for {}
set foldmethod=syntax
set foldlevel=99

"Preferences
set scrolloff=10
colorscheme gruvbox
set bg=dark
let g:netrw_banner=0
let &t_SI = "\<Esc>[2 q"
let &t_SR = "\<Esc>[2 q"
let &t_EI = "\<Esc>[2 q"
set belloff=all
set number

"Better searching
set ignorecase
set smartcase
set incsearch


"Nice tabses titles
function! Tabline() abort
    let l:line = ''
    let l:current = tabpagenr()

    for l:i in range(1, tabpagenr('$'))
        if l:i == l:current
            let l:line .= '%#TabLineSel#'
        else
            let l:line .= '%#TabLine#'
        endif

        let l:label = fnamemodify(
            \ bufname(tabpagebuflist(l:i)[tabpagewinnr(l:i) - 1]),
            \ ':t'
        \ )

        let l:line .= '%' . i . 'T' " Starts mouse click target region.
        let l:line .= '  ' . l:label . '  '
    endfor

    let l:line .= '%#TabLineFill#'
    let l:line .= '%T' " Ends mouse click target region(s).

    return l:line
endfunction

set tabline=%!Tabline()

"Use s instead of <C-w> to go into splitmode
noremap s <C-w>
noremap sj <C-w>j
noremap sk <C-w>k
noremap s; <C-w>l
noremap sl <C-w>h
noremap sJ <C-w>J
noremap sK <C-w>K
noremap s: <C-w>L
noremap sL <C-w>H

"Get s to work in netrw (finally)
augroup netrw_mapping
  autocmd!
  autocmd FileType netrw call NetrwMapping()
augroup END

function! NetrwMapping() abort
  noremap <buffer> s <C-w>
  noremap <buffer> T :ls<CR>
  noremap <buffer> t :b<Space>
  noremap <buffer> R :buffer delete<Spa
  noremap <buffer> r :buffer add<Space>
endfunction

"Paste won't write to the register
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

"Easy buffers
noremap T :ls<CR>
noremap t :b<Space>
noremap R :buffer delete<Space>
noremap r :buffer add<Space>

"Use Ctrl+space to exit command mode instead of reaching for esc (or ctrl-c)
cmap <C-space> <C-c>


"Statusline
set statusline=
set statusline +=\ %n\            "buffer number
"set statusline +=%5*%{&ff}%*            "file format
"set statusline +=%3*%y%*                "file type
"set statusline +=%4*\ %<%F%*            "full path
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%L%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04B\ %*          "character under cursor
set statusline+=\ \ %t\ %m%*\ \%F\ \ \ \%=\%{strftime('%a\ %b\ %d\ %Y')}\ \ \ \%{strftime('%H:%M')}\ \ 
"Show statusline even if there's only one split
set laststatus=2

"--------Only external plugins below this line

"Replace f with sneak, treat sneak as an quick, instant
"gesture, if i want more i will use /
map f <Plug>Sneak_s
map F <Plug>Sneak_S
"map s <Plug>SneakNext
"map S <Plug>SneakPrevious
highlight link Sneak none
let g:sneak#use_ic_scs = 1

"Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'vim-airline/vim-airline'
"Plugin 'valloric/youcompleteme'
"Plugin 'enricobacis/vim-airline-clock'

call vundle#end()            " required
filetype plugin indent on    " required

