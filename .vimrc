"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call pathogen
call pathogen#infect()

" Open and close the NERDTree
map <F10> :NERDTreeToggle<CR>
map <F11> :NERDTreeClose<CR>
map <F1> <Esc>
imap <F1> <Esc>
let NERDTreeWinPos="left"
let NERDTreeWinSize=35
" fold the numbers column
map <F2> :set invnumber<CR>

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <LocalLeader><cr> :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
noremap <C-n> :tabnext<CR>                                            
noremap <C-p> :tabprev<CR>
set guicursor=a:block-blinkoff1

" Add tab support
map <F9> :tabp<Enter>
map <F10> :tabn<Enter>

" operational settings
syntax on
set tabpagemax=50
set modeline
set scrolloff=8
set ruler                     " show the line number on the bar
set autoread                  " watch for file changes
set noautowrite               " don't automagically write on :next
set nocompatible              " vim, not vi
set autoindent 
set nosmartindent    " auto/smart indent
set expandtab                 " expand tabs to spaces (except java, see autocmd below)
set softtabstop=2
set smarttab                  " tab and backspace are smart
set tabstop=2                 " 2 spaces
set shiftwidth=2              " shift width
set backspace=indent,eol,start  " backspace over all kinds of things
set showfulltag               " show full completion tags
set noerrorbells              " no error bells please
set undolevels=500            " 500 undos
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
let mapleader=','
let maplocalleader=','        " all my shortcuts start with ,
set whichwrap+=<,>,h,l        " backspaces and cursor keys wrap to
set visualbell t_vb=          " Disable ALL bells
set cursorline                " show the cursor line
"set list                      " show whitespace where I care
set matchpairs+=<:>           " add < and > to match pairs

"don't use the backup files or swap files, they are annoying to look at
set nobackup
set nowritebackup
set noswapfile
set ai
set textwidth=0
set comments=b:#

" jump to the beginning and end of functions

nnoremap [[ ?{<CR>w99[{
nnoremap ][ /}<CR>b99]}
nnoremap ]] j0[[%/{<CR>
nnoremap [] k$][%?}<CR>


set dictionary=/usr/share/dict/words " more words!

if has("gui_running")
      "colorscheme rdark
      "colorscheme Mustang
      ""colorscheme solarized   " yum candy
      colorscheme zenburn   " yum candy
      let rdark_current_line=1  " highlight current line
      set background=dark
      set noantialias
      set guioptions-=T        " no toolbar
      set guifont=Inconsolata\ Medium\ 12
      set guioptions-=l        " no left scrollbar
      set guioptions-=L        " no left scrollbar
      set guioptions-=r        " no right scrollbar
      set guioptions-=R        " no right scrollbar
      set lines=40
      set columns=115

end

set t_Co=256 

" Settings for taglist.vim
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=0
let Tlist_Enable_Fold_Column=0
let Tlist_Show_One_File = 1         " Only show tags for current buffer
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1

" Settings for VimClojure
let g:vimclojure#HighlightBuiltins=1   " Highlight Clojure's builtins
let g:vimclojure#ParenRainbow=1        " Rainbow parentheses'!
let g:vimclojure#DynamicHighlighting=1 " Dynamically highlight functions
let vimclojure#SplitPos = "right"
"let vimclojure#SplitSize = 15
"let g:clj_want_gorilla=1            " Bananas! (Make sure nailgun in is your path)
"let vimclojure#WantNailgun=1
"let vimclojure#NailgunClient = "/home/murbanski/bin/ng"



" Showmarks settings
let g:showmarks_ignore_type="hmprq"
let g:showmarks_enable=0

" Changes.vim settings
let g:changes_autocmd=1      " Autoshow changes on cursorpause
let g:changes_verbose=0      " Don't show what symbols mean
" ---------------------------------------------------------------------------
" status line 
set laststatus=2
if has('statusline')
      function! SetStatusLineStyle()
            let &stl="%F%m%r%h%w\ [%{&ff}]\ [%Y]\ %P\ %=[a=\%03.3b]\ [h=\%02.2B]\ [%l,%v]"
      endfunc
      " Not using it at the moment, using a different one
      call SetStatusLineStyle()

      if has('title')
            set titlestring=%t%(\ [%R%M]%)
      endif

endif

" ---------------------------------------------------------------------------
"  searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set smartcase                 " Ignore case when searching lowercase
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

" ---------------------------------------------------------------------------
"  mouse stuffs
set mousehide                 " hide the mouse when typing
" this makes the mouse paste a block of text without formatting it 
" (good for code)
map <MouseMiddle> <esc>"*p

" ---------------------------------------------------------------------------
"  backup options
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
set history=2000

" ---------------------------------------------------------------------------
" spelling...
if v:version >= 700

      setlocal spell spelllang=en
      nmap <LocalLeader>ss :set spell!<CR>

endif
" default to no spelling
set nospell

"Shortcuts using <LocalLeader>
map <LocalLeader>sn ]s
map <LocalLeader>sp [s
map <LocalLeader>sa zg
map <LocalLeader>s? z=
" When I'm pretty sure that the first suggestion is correct
map <LocalLeader>st 1z=


" ---------------------------------------------------------------------------
" Turn on omni-completion for the appropriate file types.
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1  " Rails support

" ---------------------------------------------------------------------------
" some useful mappings
" Y yanks from cursor to $
map Y y$
" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>
" change directory to that of current file
nmap <LocalLeader>cd :cd%:p:h<cr>
" change local directory to that of current file
nmap <LocalLeader>lcd :lcd%:p:h<cr>
" correct type-o's on exit
nmap q: :q
" save and build
nmap <LocalLeader>wm  :w<cr>:make<cr>
" open all folds
nmap <LocalLeader>o  :%foldopen!<cr>
" close all folds
nmap <LocalLeader>c  :%foldclose!<cr>
" ,tt will toggle taglist on and off
nmap <LocalLeader>tt :Tlist<cr>
" q: sucks
nmap q: :q
" If I forgot to sudo vim a file, do that with :w!!
cmap w!! w !sudo tee %
" Fix the # at the start of the line
inoremap # X<BS>#
" When I forget I'm in Insert mode, how often do you type 'jj' anyway?:
" imap jj <Esc>

" ---------------------------------------------------------------------------
      autocmd BufReadPost *
                        \ if line("'\"") > 0|
                        \       if line("'\"") <= line("$")|
                        \               exe("norm '\"")|
                        \       else|
                        \               exe "norm $"|
                        \       endif|
                        \ endif

      " configure various extensions
      let git_diff_spawn_mode=2

      " improved formatting for markdown
      " http://plasticboy.com/markdown-vim-mode/
      autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:>

" set list to activate whitespace detection mode
au BufNewFile,BufRead *.less set filetype=less

" CoffeeScript compiler stuff
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

"swap colors in solarized

" For the conque shell plugin
nnoremap <LocalLeader>te :ConqueTermSplit bash<CR>                            

" Don't go into insert mode when the buffer is focused
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_TERM = 'xterm'

" Tagbar plugin
nnoremap <silent> <LocalLeader>f :TagbarToggle<CR>

" change tab completion to ctrl-space
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

" show line numbers
set number

" Disable the one PEP8 rule that should not be
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,W503,W504,E127,E722,E251,E203'

set spell spelllang=en_us

vnoremap <Del> d
