filetype off
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"ColorScheme"
"Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'bignimbus/pop-punk.vim'


"DART | FLUTTER"
"Plug 'dart-lang/dart-vim-plugin', {'for': 'dart'}""

"RUST"
"Plug 'rust-lang/rust.vim', {'for': 'rust'}"

"CLOJURE"
Plug 'kien/rainbow_parentheses.vim'
Plug 'guns/vim-clojure-highlight', {'for': 'clojure'}
Plug 'tpope/vim-fireplace',        {'for': 'clojure'}
Plug 'guns/vim-clojure-static',    {'for': 'clojure'}
Plug 'bhurlow/vim-parinfer',       {'for': ['clojure', 'clojurescript']}
Plug 'clojure-vim/async-clj-omni', {'for': 'clojure'}
"Plug 'kovisoft/paredit',           {'for': 'clojure'}"

"SBCL"
"Plug 'vlime/vlime', {'rtp': 'vim/'}"
"Plug kovisoft/slimv, {'for': 'lisp'}"

"ERLANG"
"Plug 'vim-erlang/vim-erlang-omnicomplete', {'for': 'erlang'}

"ELIXIR"
Plug 'elixir-editors/vim-elixir', {'for': 'elixir'}

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
Plug 'mattn/emmet-vim' ,   {'on': 'Emmet'}
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


let &t_ZH="\e[3m"
let &t_ZR="\e[23m"


set exrc
set secure

set encoding=utf-8
scriptencoding utf-8
set termencoding=utf-8
set fileencoding=utf-8

set background=dark
set shell=/bin/zsh

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
set cmdheight=7
set laststatus=2
set shiftwidth=2
set softtabstop=2
set tabstop=2


set pastetoggle=<F12>
set textwidth=99
set colorcolumn=99,111
set wildmode=longest,list
set guifont=Fira\ Code:h12
set completeopt=menu,preview
set formatoptions=tcqrn2
set pumheight=33
set runtimepath^=~/.vim/plugged


set termguicolors
set omnifunc=syntaxcomplete#Complete
let g:indentLine_char = '⦙'


"fireplace"
nnoremap <C-e> :Eval<CR>
nnoremap E :%Eval<CR>
"ctrl-e & shift-e"

" Switch Buffs"
"map <C-J> :bnext<CR>
"map <C-K> :bprev<CR>


"CLJ Comp"

au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'async_clj_omni',
    \ 'whitelist': ['clojure'],
    \ 'completor': function('async_clj_omni#sources#complete'),
    \ })

"OTHER"
imap jj <Esc>
au! bufwritepost $MYVIMRC source $MYVIMRC

"hi Cursor ctermfg=White ctermbg=Yellow cterm=bold"

hi CursorColumn ctermfg=NONE ctermbg=Magenta  cterm=bold
"hi CursorLine ctermfg=NONE ctermbg=0  cterm=bold

"hi CursorLine term=bold cterm=bold  ctermbg=Magenta guibg=NONE
hi StatusLine ctermbg=0 cterm=NONE

hi ExtraWhitespace ctermbg=red guibg=darkred

match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

"VIM AIRLINE"
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_section_c = 'λ %F'
let g:airline_theme='pop_punk'

let g:terminal_ansi_colors = pop_punk#AnsiColors()


"NerdTree Settings & dorks"
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
"let g:netrw_banner       = 0
"let g:netrw_liststyle    = 3
"let g:netrw_browse_split = 2
"let g:netrw_winsize      = 25
"map <silent> <F8>   :Explore<CR>
"map <silent> <S-F8> :sp +Explore<CR>
"map <silent> <F10>  :bw<CR>


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
  autocmd FileType json set textwidth=111 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=2
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

"YAML"
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
"au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab"
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
  echo system("ls -la")
endfunction

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
"hi OverLength ctermbg=darkred ctermfg=white
hi OverLength ctermbg=138 ctermfg=white
"hi ColorColumn ctermfg=White ctermbg=darkred cterm=bold

match OverLength /\%>111v.\+/
au BufWinEnter * call matchadd('CursorColumn', '\%>'.&l:textwidth.'v.\+', -1)

"Plug"
let g:plug_timeout=120
let g:plug_threads=32
let g:plug_retries=3
let g:plug_shallow=1

