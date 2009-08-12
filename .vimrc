set tags=/u/dev/tags

" I don't really like this
"set t_Co=256

color murphy
syntax on
set showtabline=2
set nu!
set smartindent
set incsearch
set ignorecase
set smartcase
set scrolloff=2
"set foldmethod=indent


" I hate accidentally hitting F1
map <F1> <Esc>
imap <F1> <Esc>


"Sick of holding down shift a nanosecond longer than I should and trying to quit with :Q instead of :q !!!
command Q q
command W w


" tabs (ie multiple buffers, not tab stops)
" there's no <CR> on these two because you might want to specify a filename to open in the new tab.
nmap <C-t> :tabnew 
map! <C-t> <Esc>:tabnew 

nmap <C-y> :tabnext<CR>
map! <C-y> <Esc>:tabnext<CR>


"tabs (t'other kind)
set tabstop=4
set shiftwidth=4
set expandtab

"abbreviations
ab fbb fb(__FUNCTION__.' in '.__FILE__.' at line '.__LINE__);

if bufwinnr(1)
    nmap <kPlus> <C-W>>
    map! <kPlus> <C-W>>

    nmap <kMinus> <C-W><
    map! <kMinus> <C-W><

    map <kDivide> <C-W>+
    map <kMultiply> <C-W>-
endif

"determined effort to get mouse support working inside screen, inside putty
set ttymouse=xterm2
set mouse=a

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

hi TabLineSel cterm=bold ctermfg=9 ctermbg=4
hi TabLine term=underline cterm=bold,underline ctermfg=1 ctermbg=15
hi TabLineFill   term=reverse cterm=bold ctermbg=0

set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %=lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
set laststatus=2

set wildmenu
set wildmode=list:longest

"set listchars=tab:>-,trail:^,eol:$
"set list

 map <F8> <Plug>Cvsdiff<CR>
 map <F7> <Plug>Cvsdiffv<CR>
