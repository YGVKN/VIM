filetype off
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"ColorScheme"
Plug 'bignimbus/pop-punk.vim'
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
"Plug 'sonph/onehalf'"
"Plug 'rose-pine/vim'"
"Plug 'kyoz/purify', { 'rtp': 'vim' }"

"CLOJURE"
Plug 'bhurlow/vim-parinfer',       {'for': ['clojure', 'clojurescript']}
Plug 'kien/rainbow_parentheses.vim'

Plug 'guns/vim-clojure-highlight', {'for': 'clojure'}

Plug 'guns/vim-clojure-static',    {'for': 'clojure'}
Plug 'guns/vim-sexp',              {'for': 'clojure'}

Plug 'tpope/vim-fireplace',        {'for': 'clojure'}

Plug 'tpope/vim-classpath',        {'for': 'clojure'} "$HOME/.cache/classpath"
Plug 'Lattay/slimy.vim',           {'for': 'clojure'}
"Plug 'tpope/vim-salve',            {'for': 'clojure'}
"Plug 'tpope/vim-dispatch',         {'for': 'clojure'}


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
"Plug 'mattn/emmet-vim' ,   {'on': 'Emmet'}"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'jiangmiao/auto-pairs'"

"Plug '~/my-prototype-plugin'"
call plug#end()

sy on

filetype plugin indent on

colorscheme pop-punk

scriptencoding utf-8

set clipboard^=unnamed,unnamedplus "Copy to sys buffer"
"set makeprg=<make -j$(nproc) something>"
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
set lazyredraw

set autoread
set wildmenu

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

set hlsearch
set ignorecase
set smartcase
set incsearch

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set cindent

set t_Co=256
set mps+=<:>
set iskeyword+=-
set listchars=tab:..,trail:.,nbsp:_
set fillchars+=vert:\  
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]

set modeline
set modelines=3
set cmdheight=7
set laststatus=2

set pastetoggle=<F12>
set textwidth=99
set colorcolumn=99,111
set wildmode=list:longest,full
set formatoptions=tcqrn2
set runtimepath^=~/.vim/plugged

set termguicolors

"set omnifunc=syntaxcomplete#Complete"
set omnifunc=syntaxcomplete#Smart_TabComplete
set completeopt=longest,menu,preview

"OTHER"
imap jj <Esc>

"Buffers"
nnoremap <F3> :bprevious<CR>
nnoremap <F4> :bnext<CR>
nnoremap <F5> :bfirst<CR>
nnoremap <F6> :blast<CR>

function! StartUpVIM()
    if !argc() && !exists("s:std_in")
        NERDTree | wincmd l | wincmd c
    end
    if argc() > 0 || exists("s:std_in")
       execute 'NERDTree' argv()[0] | wincmd p
    end
    if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in')
      execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | wincmd l | wincmd c
    end
endfunction
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * call StartUpVIM()

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

augroup nerdtreehidecwd
	autocmd!
	autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
augroup end

"NerdTree settings start & "
"if empty(argv())
"if (argc() )
"if empty(argc()) && !exists("s:std_in")
"  au Vimenter * NERDTree | wincmd l | wincmd c
"else
"  au VimEnter * NERDTree | wincmd p
"endif

"Native complete"
if has("autocmd") && exists("+omnifunc")
  autocmd FileType clojure set complete+=k~/.vim/autoload/complete/clj_dict.vim
endif
"TODO"
"if has("autocmd") && exists("+omnifunc")
"  autocmd Filetype *
"          \	if &omnifunc == "" |
"          \		setlocal omnifunc=syntaxcomplete#Complete |
"          \	endif
"endif


"VIM AIRLINE"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline_section_c = 'λ %F'
let g:airline_theme='pop_punk'

let g:terminal_ansi_colors = pop_punk#AnsiColors()
let g:airline_highlighting_cache = 1

"NERDTree"
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

let g:NERDTreeGitStatusIndicatorMapCustom = {
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
func! OutHandler(ch,msg)
  echom a:msg
endfunc

func! JobCallback(ch,msg)
    echom a:msg
endfunc

func! ErrHandler(ch,msg)
  echom a:msg
endfunc

func! ExitHandler(job,status)
  echom a:job
  echom a:status
endfunc

func! Run_Job()
  let s:cmd = ['/bin/zsh', '-c', '{curl https://api.github.com/users/ygvkn}']
  let s:job = job_start(s:cmd, {"out_io": "buffer", "out_name": "out_buffer", "exit_cb": "ExitHandler"})
  echom job_status(s:job)
  echom job_info(s:job)
endfunc
"{'out_io': 'buffer', 'out_name': 'mybuffer'}
"{'out_io': 'file', 'out_name': '/tmp/file.txt'}

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


hi MatchParen ctermbg=181 ctermfg=DarkMagenta guibg=magenta

hi ExtraWhitespace ctermbg=181 guibg=darkred

au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

match ExtraWhitespace /\s\+$/

"OverLength"
highlight ColorColumn cterm=italic  ctermbg=magenta guibg=#1a1a1a ctermfg=DarkMagenta
match ErrorMsg '\%>111v.\+'
match ColorColumn /\%>111v.\+/
au BufWinEnter * call matchadd('CursorColumn', '\%>'.&l:textwidth.'v.\+', -1)

"Visual mode change color"
hi Visual term=reverse cterm=reverse ctermbg=NONE ctermfg=NONE gui=NONE guibg=Magenta

"Plug"
let g:plug_timeout=120
let g:plug_threads=32
let g:plug_retries=3
let g:plug_shallow=1

"source ~/.vim/autoload/stuff/other.vim"

autocmd! bufwritepost $MYVIMRC source $MYVIMRC | echom "Reloaded $MYVIMRC"
"help uganda
"help!
"help 42
"help quotes
"help holy-grail
":smile"
"pipe - <bar> help <Bar>
