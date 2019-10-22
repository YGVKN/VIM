set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'lifepillar/vim-solarized8'

"LISP"
Plug 'bhurlow/vim-parinfer',{'for': ['lisp', 'clojure', 'clojurescript', 'scheme', 'racket']}
Plug 'kovisoft/paredit'
Plug 'kien/rainbow_parentheses.vim'
Plug 'jiangmiao/auto-pairs'

"CLOJURE"
Plug 'guns/vim-clojure-highlight',{'for': 'clojure'}
Plug 'tpope/vim-fireplace',       {'for': 'clojure'}
Plug 'guns/vim-clojure-static',   {'for': 'clojure'}
Plug 'tpope/vim-classpath',       {'for': ['clojure', 'clojurescript']}
Plug 'tpope/vim-salve',           {'for': 'clojure'}

Plug 'guns/vim-sexp',    {'for': 'clojure'}

"ELIXIR"
Plug 'elixir-editors/vim-elixir',{'for': 'elixir'}

"GIT"
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

"HTML"
Plug 'othree/html5.vim',   {'for': 'html'}
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim' ,{'on': 'Emmet'}
"Plug 'gregsexton/MatchTag'

"CSS"
Plug 'hail2u/vim-css3-syntax',    {'for': 'css'}
Plug 'gorodinskiy/vim-coloresque',{'for': 'css'}
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}


"JS"
Plug 'pangloss/vim-javascript',     {'for': 'javascript'}
Plug 'jelera/vim-javascript-syntax',{'for': 'javascript'}
Plug 'isruslan/vim-es6',            {'for': 'javascript'}

"PHP"
Plug 'stanangeloff/php.vim',{'for': 'php'}

"PYTHON"
Plug 'klen/python-mode', {'for': 'python'}

"JULIA"
Plug 'JuliaEditorSupport/julia-vim',{'for': 'julia'}

"RUBY"
Plug 'vim-ruby/vim-ruby',{'for': 'ruby'}

"CRYSTAL"
Plug 'rhysd/vim-crystal',{'for':'crystal'}

"OTHER"
Plug 'tpope/vim-surround'
Plug 'elzr/vim-json',{'for': 'json'}
Plug 'roman/golden-ratio'
Plug 'liuchengxu/vim-clap'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
colorscheme solarized8_flat
filetype plugin indent on
sy on
scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set background=dark
set langmenu=en_US.UTF-8
set wildmenu
set wildmode=full
set shell=zsh
set title
set ttyfast
set autoread
set lazyredraw
set number
set ruler
set cursorline
set cursorcolumn
set colorcolumn=+1,+12
set splitright
set splitbelow
set modelines=0
set laststatus=2
set showmode
set showcmd
set showmatch
set ignorecase
set incsearch
set hlsearch
set magic
set smartcase
set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set formatoptions=tcqrn1
set textwidth=88
set history=888
set linebreak
set nowrapscan
set confirm
set mouse=
set wrap
set tags=tags
set completeopt=noinsert,menuone
set backspace=indent,eol,start
set nrformats=
set nofoldenable
set pumheight=33
set pastetoggle=<F12>
set t_Co=256
set list
set esckeys
set mps+=<:>
set fillchars+=vert:\ 
set listchars=tab:..,trail:.,nbsp:_
set iskeyword+=-
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]
"set paste
"set termguicolors
"set relativenumber
"set foldcolumn=13
set path=.
set runtimepath^=~/.vim/plugged
set omnifunc=syntaxcomplete#Complete

"Settings"
inoremap jj <Esc>
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"NerdTree settings"
autocmd vimenter * NERDTree
let g:NERDTreeDirArrowExpandable   = "λ"
let g:NERDTreeDirArrowCollapsible  = ">"
let g:NERDTreeDirArrows = 1
let NERDTreeShowHidden  = 1
let NERDTreeIgnore = ['.DS_Store']
let NERDTreeShowBookmarks       = 0
let NERDTreeHighlightCursorline = 1
let NERDTreeShowLineNumbers     = 0
let NERDTreeMinimalUI  = 0
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
hi  NERDTreeClosable ctermfg=DarkMagenta
hi  NERDTreeOpenable ctermfg=Magenta
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "?",
    \ "Staged"    : "🍒",
    \ "Untracked" : "¿",
    \ "Renamed"   : "👠",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "🎗",
    \ "Dirty"     : "💋",
    \ "Clean"     : "_",
    \ 'Ignored'   : "💎",
    \ "Unknown"   : "λ"
    \ }

"NETRW"
let g:netrw_banner       = 0
let g:netrw_liststyle    = 3
let g:netrw_browse_split = 2
let g:netrw_winsize      = 25
map <silent> <F8>   :Explore<CR>
map <silent> <S-F8> :sp +Explore<CR>
map <silent> <F10>  :bw<CR>

"Airline"
let g:airline_theme = 'atomic'
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"Highlighting whitespaces"
highlight ExtraWhitespace ctermbg=red guibg=darkred
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

hi CursorLine   guibg=#ff1493
hi LineNr       ctermfg=5

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"JSON"
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=88 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=2
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

"Background Color"
hi! Normal  ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE


"LineLength"
match ErrorMsg '\%88v.\+'
autocmd BufWinEnter * call matchadd('ErrorMsg', '\%>'.&l:textwidth.'v.\+', -1)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
"""autocmd BufWrite *.lisp  :call DeleteTrailingWS()

"Auto compl"
function! Smart_TabComplete()
  let line = getline('.')
  let substr = strpart(line, -1, col('.')+1)
  let substr = matchstr(substr, "[^ \t]*$")
  if (strlen(substr)==0)
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1
  let has_slash  = match(substr, '\/') != -1
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"
  elseif ( has_slash )
    return "\<C-X>\<C-F>"
  else
    return "\<C-X>\<C-O>"
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

function! InsertTabWrapper(direction)
 let col = col('.')-1
 if !col || getline('.')[col - 1] !~ '\k'
  return "\<tab>"
 elseif "backward" == a:direction
  return "\<c-p>"
 else
  return "\<c-n>"
 endif
endfunction
inoremap <tab>   <c-r>=InsertTabWrapper   ('forward')<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper   ('forward')<cr>

augroup l
 au!
 autocmd BufNewFile,BufRead *.l set syntax=lisp
augroup END

"Rainbow_parentheses"

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3' ],
    \ ['Darkblue',    'SeaGreen3'  ],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3' ],
    \ ['darkcyan',    'RoyalBlue3' ],
    \ ['darkred',     'SeaGreen3'  ],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3' ],
    \ ['gray',        'RoyalBlue3' ],
    \ ['black',       'SeaGreen3'  ],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3' ],
    \ ['darkgreen',   'RoyalBlue3' ],
    \ ['darkcyan',    'SeaGreen3'  ],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3' ],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
let g:rainbow#pairs = [['(', ')'], ['[', ']'],['{','}']]
let g:rainbow#blacklist = [233, 234]
au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces

"""LISP Settings"""



autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType PHP        set omnifunc=phpcomplete#CompletePHP
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType ruby       set omnifunc=rubycomplete#Complete
autocmd Filetype erlang     set omnifunc=erlang_complete#Complete

"Disable Arrow"
map  <up>     <nop>
map  <down>   <nop>
map  <left>   <nop>
map  <right>  <nop>
imap <up>     <nop>
imap <down>   <nop>
imap <left>   <nop>
imap <right>  <nop>

