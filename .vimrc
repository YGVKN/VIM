filetype off
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'scrooloose/nerdcommenter'"

"ColorScheme"
Plug 'kyoz/purify', { 'rtp': 'vim' }"
"Plug 'lifepillar/vim-solarized8'"

"LISP"
Plug 'kien/rainbow_parentheses.vim'
Plug 'bhurlow/vim-parinfer',{'for': ['lisp', 'clojure', 'clojurescript', 'scheme', 'racket']}
"Plug 'kovisoft/paredit'"
"Plug 'jiangmiao/auto-pairs'"

"CLOJURE"
Plug 'tpope/vim-fireplace'       ,{'for': 'clojure'}
Plug 'guns/vim-clojure-highlight',{'for': 'clojure'}
Plug 'guns/vim-clojure-static',   {'for': 'clojure'}
Plug 'tpope/vim-classpath',       {'for': ['clojure', 'clojurescript']}
Plug 'tpope/vim-salve',           {'for': 'clojure'}
Plug 'guns/vim-sexp',             {'for': 'clojure'}

"SBCL"

"ELIXIR"
Plug 'elixir-editors/vim-elixir', {'for': 'elixir'}

"GIT"
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

"OTHER"
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-surround'
Plug 'roman/golden-ratio'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim' ,   {'on': 'Emmet'}
Plug 'gregsexton/matchtag'
Plug 'junegunn/fzf', {'do': './install --all' }
Plug 'junegunn/fzf.vim'



"Plug '~/my-prototype-plugin'"
call plug#end()

filetype plugin indent on

sy on
colorscheme purify


scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

set background=dark
set shell=zsh

set title
set number
set magic
set ruler
set ttyfast
set lazyredraw
set autoindent
set autoread
set wildmenu
set modeline
set linebreak
set nowrapscan
set wrap
set confirm
set list
set noshiftround

set nofoldenable
set nojoinspaces

set splitright
set splitbelow

set cursorline
set cursorcolumn

set showmode
set showcmd
set showmatch

set incsearch
set hlsearch

set ignorecase
set smartcase
set smartindent
set expandtab
set smarttab

set t_Co=256
set mps+=<:>
set iskeyword+=-
set listchars=tab:..,trail:.,nbsp:_
set fillchars+=vert:\   
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]


set linespace=3
set modelines=3
set cmdheight=2
set laststatus=2
set shiftwidth=2
set softtabstop=2
set tabstop=2


set pastetoggle=<F12>
set textwidth=88
set colorcolumn=88,99
set wildmode=longest,list
set guifont=Fira\ Code:h12
set completeopt=menu,preview
set formatoptions=tcqrn2
set pumheight=33
set runtimepath^=~/.vim/plugged
set omnifunc=syntaxcomplete#Complete

"OTHER"
imap jj <Esc>
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
hi Cursor ctermfg=White ctermbg=Yellow cterm=bold
hi CursorColumn ctermfg=White ctermbg=Yellow cterm=bold
hi StatusLine ctermbg=0 cterm=NONE
hi ExtraWhitespace ctermbg=red guibg=darkred
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

"NerdTree Settings"
if empty(argv())
  au Vimenter * NERDTree | wincmd l | wincmd c
else
  au VimEnter * NERDTree
endif


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
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


"NETRW"
let g:netrw_banner       = 0
let g:netrw_liststyle    = 3
let g:netrw_browse_split = 2
let g:netrw_winsize      = 25
map <silent> <F8>   :Explore<CR>
map <silent> <S-F8> :sp +Explore<CR>
map <silent> <F10>  :bw<CR>


"AriLines"
let g:airline_theme='purify'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"Rainbow Parentheses"
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

hi MatchParen ctermbg=darkred ctermfg=white


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

"YAML"
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
au FileType yaml setlocal ts=1 sts=1 sw=1 expandtab


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

"OverLength"
hi OverLength ctermbg=darkred ctermfg=white
hi ColorColumn ctermfg=White ctermbg=Yellow cterm=bold

match OverLength /\%>88v.\+/
au BufWinEnter * call matchadd('CursorColumn', '\%>'.&l:textwidth.'v.\+', -1)
call matchadd('ColorColumn', '\(\%88v\|\%99v\)')

