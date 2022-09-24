inoremap jf <Esc>
inoremap fj <Esc>
tnoremap jf <C-w>N
tnoremap fj <C-w>N
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set scrolloff=10
nnoremap <C-t> :tab split<CR>
inoremap <C-t> <Esc>:tab split<CR>
nnoremap L gT
nnoremap : gt
nnoremap <space> :
nnoremap n nzz
nnoremap N Nzz
nnoremap Y y$
noremap l h
noremap ; l
set backspace=indent,eol,start
noremap h /
set timeoutlen=300

tnoremap <C-w>l <C-w>h
tnoremap <C-w>; <C-w>l
tnoremap <C-w>L <C-w>H
tnoremap <C-w>: <C-w>L

nnoremap <C-w>l <C-w>h
nnoremap <C-w>; <C-w>l
nnoremap <C-w>L <C-w>H
nnoremap <C-w>: <C-w>L

inoremap <C-a> <Esc>A
inoremap <C-i> <Esc>I
nnoremap <C-a> A<Esc>
nnoremap <C-i> I<Esc>

nnoremap <C-@> :bo term<CR>
nnoremap K <C-w><C-]><C-w>T
noremap <A-Left>  :-tabmove<cr>
noremap <A-Right> :+tabmove<cr>

set foldmethod=syntax

colorscheme gruvbox
set bg=dark
let g:netrw_banner=0
let &t_SI = "\<Esc>[2 q"
let &t_SR = "\<Esc>[2 q"
let &t_EI = "\<Esc>[2 q"
set belloff=all
set number
set ignorecase
set smartcase
set incsearch
map f <Plug>Sneak_s
map F <Plug>Sneak_S
map s <Plug>SneakNext
map S <Plug>SneakPrevious

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

nnoremap s <C-w>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap s; <C-w>l
nnoremap sl <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap s: <C-w>L
nnoremap sL <C-w>H
au FileType netrw noremap s <C-w>
