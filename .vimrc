filetype off
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"VIM Async run code ..."
"Plug 'skywind3000/asyncrun.vim'"
"Plug 'tpope/vim-dispatch'"


"ColorScheme"
Plug 'bignimbus/pop-punk.vim'
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
"Plug 'kyoz/purify', { 'rtp': 'vim' }

"CLOJURE"
Plug 'bhurlow/vim-parinfer',       {'for': ['clojure', 'clojurescript']}
Plug 'kien/rainbow_parentheses.vim'

Plug 'guns/vim-clojure-highlight', {'for': 'clojure'}
Plug 'guns/vim-clojure-static',    {'for': 'clojure'}

Plug 'tpope/vim-fireplace',        {'for': 'clojure'}
Plug 'Lattay/slimy.vim',           {'for': 'clojure'}
"Plug 'tpope/vim-salve',            {'for': 'clojure'}
"Plug 'tpope/vim-dispatch',         {'for': 'clojure'}
"Plug 'jpalardy/vim-slime',         {'for': 'clojure'}

"Plug 'lattay/vim-slime'
" ... or git clone [Fireplace & vim-dispatch & vim-salve] -> ~/.vim/pack/tpope/start/"

"Plug 'clojure-vim/vim-jack-in',    {'for': 'clojure'}"


"ELIXIR"
Plug 'elixir-editors/vim-elixir', {'for': 'elixir'}

"GOLANG"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"GIT"
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'


"TERRAFORM"
Plug 'hashivim/vim-terraform', {'for': 'terraform'}
Plug 'juliosueiras/vim-terraform-completion', {'for': 'terraform'}

"OTHER"
Plug 'stephpy/vim-yaml', {'for': 'yaml'}
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-surround'
Plug 'roman/golden-ratio'
"Plug 'mattn/emmet-vim' ,   {'on': 'Emmet'}"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'jiangmiao/auto-pairs'"


"JS & NODEJS"
Plug 'pangloss/vim-javascript', {'for': 'javascript'}

"Plug '~/my-prototype-plugin'"
call plug#end()

filetype plugin indent on

colorscheme pop-punk
sy on

scriptencoding utf-8

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

set re=0
set exrc
set secure
set history=1000
set viminfo='100,\"20000,:2000,%,n~/.viminfo

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

set background=dark
set shell=/bin/zsh

set title
set number
set magic
set ruler
set ttyfast
set lazyredraw "redraw & redraw!"
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
set cmdheight=7
set laststatus=2
set shiftwidth=2
set softtabstop=2
set tabstop=2


set pastetoggle=<F12>
set textwidth=99
set colorcolumn=99,111
set wildmode=list:longest,full
set guifont=Fira\ Code:h12
set formatoptions=tcqrn2
set pumheight=33
set runtimepath^=~/.vim/plugged

set termguicolors

set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menu,preview

set omnifunc=clojurecomplete#CompleteClojure

"OTHER"
imap jj <Esc>
au! bufwritepost $MYVIMRC source $MYVIMRC
"Cursor &"
"hi CursorColumn ctermfg=NONE ctermbg=Magenta  cterm=bold
"hi CursorLine term=bold cterm=bold  ctermbg=Magenta guibg=DarkMagenta
hi StatusLine ctermbg=0 cterm=NONE

"VIM AIRLINE"
"let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_section_c = 'λ %F'
let g:airline_theme='pop_punk'

let g:terminal_ansi_colors = pop_punk#AnsiColors()

autocmd VimEnter * NERDTree
autocmd VimEnter * NERDTree | wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"NerdTree settings start & "
"if empty(argv())
"  au Vimenter * NERDTree | wincmd l | wincmd c
"else
"  au VimEnter * NERDTree
"endif

let g:NERDTreeDirArrowExpandable   = "λ"
let g:NERDTreeDirArrowCollapsible  = ">"
let g:NERDTreeDirArrows = 1
let NERDTreeShowHidden  = 1
let NERDTreeIgnore = ['*.DS_Store']
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

"VIM Slimy"
let g:slimy_config = {
\    '*': {
\         'cmd': 'zsh'
\    },
\    'clojure': {
\         'cmd': 'lein repl',
\         'confirm': 1
\    }
\}

let g:slimy_terminal_config = {"term_finish": "close"}


"Plugin Fireplace"
"Evaluate Clojure buffers on load"
autocmd BufRead *.clj try | silent! Require  | catch /^Fireplace/ | endtry
autocmd BufRead *.clj try | silent! Require! | catch /^Fireplace/ | endtry

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
let g:rainbow#pairs = [['(', ')'],['[',']'],['{','}'],['<','>']]
let g:rainbow#blacklist = [233, 234]

au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces
au Syntax   * RainbowParenthesesLoadChevrons


"JSON"
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=111 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=2
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

"YAML"
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
augroup yaml_fix
    autocmd!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>
augroup END
autocmd FileType yaml setl indentkeys-=<:>


"TERRAFORM"
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1
autocmd BufRead,BufNewFile *.hcl set filetype=terraform

"Functions"
function! Exec_Shell()
  echo system("curl https://api.github.com/users/ygvkn")
endfunction
"dispatch plugin"
"function! Exec_Repl()
"  execute ':Start lein repl | lolcat'
"endfunction

"Tab compl"
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



hi MatchParen ctermbg=darkred ctermfg=DarkMagenta guibg=magenta


hi ExtraWhitespace ctermbg=red guibg=darkred

au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

match ExtraWhitespace /\s\+$/

"OverLength"
highlight ColorColumn ctermbg=magenta guibg=Magenta ctermfg=DarkMagenta
match ErrorMsg '\%>111v.\+'
match ColorColumn /\%>111v.\+/
au BufWinEnter * call matchadd('CursorColumn', '\%>'.&l:textwidth.'v.\+', -1)
"call matchadd('ColorColumn', '\%99v', 111)
"hi Normal guibg=NONE ctermbg=NONE  opacity background

"Plug"
let g:plug_timeout=120
let g:plug_threads=32
let g:plug_retries=3

let g:plug_shallow=1

"VIM Async run code"
":call job_start(['/bin/bash', '-c', '{ sleep 2 && printf "Done."; }']) & job_status()"
