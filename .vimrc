syntax on

""Use kj to go into normal mode, in the console and in insertmode
inoremap kj <Esc>
tnoremap kj <C-w>N
xnoremap kj <Esc>
cnoremap kj <Esc>

"Don't use Esc
inoremap <Esc> <Nop>
cnoremap <Esc> <Nop>
cnoremap <Esc> <Nop>

noremap J 7gj
noremap K 7gk

noremap j gj
noremap k gk

noremap <C-j> ]'
noremap <C-k> ['

"Use g for directory searching
noremap gg gg
function! GlobalSearch()
  let st = input('Enter string for global search:')
  execute ":vimgrep /".st."/ **/*.cpp\<CR>"
  execute ":copen"
endfunction

//noremap g :vimgrep /input('Enter search term: ')./ **/*.cpp<left><left><left><left><left><left><left><left><left><left><CR>:cw<CR>
noremap g :call GlobalSearch()<CR>

"Formating
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

"Ctrl+T will duplicate the current tab, in either mode
nnoremap <C-t> :tab split<CR>
inoremap <C-t> <Esc>:tab split<CR>

nnoremap <C-i> I<Esc>
nnoremap <C-a> A<Esc>

"Easier vertical movemnt
"nnoremap J 24<C-e>
"nnoremap K 24<C-y>

"Easy commenting/uncommenting
xnoremap I <c-v>$o0I

"Consistent searching
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

"resizing is abit faster
noremap s+ :resize +5<CR>
noremap s- :resize -5<CR>
noremap s< :vertical:resize -5<CR>
noremap s> :vertical:resize +5<CR>

nnoremap sd :resize +10<CR>
nnoremap sf :vertical:resize +10<CR>

"Use L and : to change tabs
nnoremap L gT
nnoremap : gt

"Use space to enter commands
nnoremap <space> :
xnoremap <space> :

"Recenter the camera after finding next occurance with /
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap Y y$

noremap l h
noremap ; l
set backspace=indent,eol,start
nnoremap df /
nnoremap DF ?
nnoremap h :set invhlsearch<CR>
"noremap H ?

"x to toggle wordwrap
"noremap x :set wrap!<CR>
"noremap c :set number!<CR>

set timeoutlen=300

"Print date
"noremap DD :r! date "+\%a \%d \%b \%Y"<CR>kdd

"Treat jkl; as hjkl
tnoremap <C-w>l <C-w>h
tnoremap <C-w>; <C-w>l
tnoremap <C-w>L <C-w>H
tnoremap <C-w>: <C-w>L

tnoremap sl <C-w>h
tnoremap s; <C-w>l
tnoremap sj <C-w>j
tnoremap sk <C-w>k
tnoremap sv <C-w>v
tnoremap ss <C-w>s
tnoremap sd <C-w>s
tnoremap sf <C-w>N
tnoremap kj <C-w>N

nnoremap <C-w>l <C-w>h
nnoremap <C-w>; <C-w>l
nnoremap <C-w>L <C-w>H
nnoremap <C-w>: <C-w>L

"Open a terminal with Ctrl+space, open a browser with ctrl+k
nnoremap <C-@> :term<CR>
nnoremap <C-L> :E<CR>
set splitbelow

"Shift+k is go to context in a new tab
nnoremap <C-l> <C-w><C-]><C-w>T

"Move tabs with Alt+arrowkey
noremap <A-Left>  :-tabmove<cr>
noremap <A-Right> :+tabmove<cr>

""Hidden folds for {}
"disabled because it slowens vim with large files
"set foldmethod=syntax
"set foldlevel=99
noremap zf zf%

"Crafty fuzzyfinder
"nnoremap <c-P> :vs **/*
"set wildmenu
"set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico*.pdf,*.psd,*.xcf,*.wav,*.ogg
"set wildignore+=node_modules
"set autochdir

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
set hlsearch


"Nice tab titles
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
nnoremap s <C-w>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap s; <C-w>l
nnoremap sl <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap s: <C-w>L
nnoremap sL <C-w>H

"Get s to work in netrw (finally)
augroup netrw_mapping
  autocmd!
  autocmd FileType netrw call NetrwMapping()
augroup END

function! NetrwMapping() abort
  "noremap <buffer> s <C-w>
  "noremap <buffer> T :ls<CR>
  "noremap <buffer> t :b<Space>
   noremap <buffer> t :ls<CR>:b<Space>
   noremap <buffer> T :CtrlPBuffer<CR>
   noremap <buffer> R :ls<CR>:bdelete<Space>
   noremap <buffer> r :ls<CR>:badd<Space>
endfunction

"Paste won't write to the register
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

"Easy buffers
"
"noremap T :ls<CR>
nnoremap t :ls<CR>:b<Space>
nnoremap T :CtrlPBuffer<CR>
"noremap T :CtrlPMRU<CR>
nnoremap R :ls<CR>:bdelete<Space>
nnoremap r :ls<CR>:badd<Space>

"What does this do? I forget
nnoremap aj ]`
nnoremap ak [`

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
set statusline+=\ \ %t\ %m%*\ \%F\ \ \ \%P\ \%=\%{strftime('%a\ %b\ %d\ %Y')}\ \ \ \%{strftime('%H:%M')}\ \ 
"Show statusline even if there's only one split
set laststatus=2

"This could be better
"cnoremap hhh echo $MYVIMRC
"cnoremap ggg source $(MYVIMRC)

let g:ctrlp_switch_buffer = 0

let g:ctrlp_prompt_mappings = {
     \ 'PrtBS()':              ['<bs>', '<c-]>'],
     \ 'PrtDelete()':          ['<del>'],
     \ 'PrtDeleteWord()':      ['<c-w>'],
     \ 'PrtClear()':           ['<c-u>'],
     \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
     \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
     \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
     \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
     \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
     \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
     \ 'PrtHistory(-1)':       ['<c-n>'],
     \ 'PrtHistory(1)':        ['<c-p>'],
     \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
     \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
     \ 'AcceptSelection("t")': ['<c-t>'],
     \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
     \ 'ToggleFocus()':        ['<s-tab>'],
     \ 'ToggleRegex()':        ['<c-r>'],
     \ 'ToggleByFname()':      ['<c-d>'],
     \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
     \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
     \ 'PrtExpandDir()':       ['<tab>'],
     \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
     \ 'PrtInsert()':          ['<c-\>'],
     \ 'PrtCurStart()':        ['<c-a>'],
     \ 'PrtCurEnd()':          ['<c-e>'],
     \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
     \ 'PrtCurRight()':        ['<c-l>', '<right>'],
     \ 'PrtClearCache()':      ['<F5>'],
     \ 'PrtDeleteEnt()':       ['<F7>'],
     \ 'CreateNewFile()':      ['<c-y>'],
     \ 'MarkToOpen()':         ['<c-z>'],
     \ 'OpenMulti()':          ['<c-o>'],
     \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-b>', 'kj'],
     \ }

"--------Only external plugins below this line

"Replace f with sneak, treat sneak as an quick, instant
"gesture, so it's different from /
"map f <Plug>Sneak_s
"map F <Plug>Sneak_S
"map s <Plug>SneakNext
"map S <Plug>SneakPrevious
"highlight link Sneak none
"let g:sneak#use_ic_scs = 1

function! Sneak1Down()
   let a = nr2char(getchar())
   execute "normal /" . a . "\<CR>"
   let @/= a
endfunction

function! Sneak1Up()
   let a = nr2char(getchar())
   execute "normal ?" . a . "\<CR>"
   let @/= a
endfunction

"What about a crafty vimsneak?
function! Sneak2Down()
   let a = nr2char(getchar())
   let b = nr2char(getchar())
   if (a!='k'||b!='j')
     execute "normal /" . a . b . "\<CR>"
     let @/= a.b
   endif
endfunction

function! Sneak2Up()
   let a = nr2char(getchar())
   let b = nr2char(getchar())
   if (a!='k'||b!='j')
     execute "normal ?" . a . b . "\<CR>"
     let @/= a.b
   endif
endfunction

nnoremap f :call Sneak1Down()<CR>
nnoremap F :call Sneak1Up()<CR>

"nnoremap d :set hlsearch<CR> <bar> :call Sneak2Down()<CR>
"nnoremap D :set hlsearch<CR> <bar> :call Sneak2Up()<CR>

nnoremap d :call Sneak2Down()<CR>
nnoremap D :call Sneak2Up()<CR>

noremap r d
noremap rr dd
noremap R D

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'

"Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on
