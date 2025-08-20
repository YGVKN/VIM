filetype off
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree',          { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"ColorScheme"
Plug 'bignimbus/pop-punk.vim'
""Plug 'xolox/vim-misc'
""Plug 'flazz/vim-colorschemes'
""Plug 'xolox/vim-colorscheme-switcher'
"Plug 'matsuuu/pinkmare'"
"Plug 'sonph/onehalf'"
"Plug 'rose-pine/vim'"
"Plug 'kyoz/purify', { 'rtp': 'vim' }"

"CLOJURE"
Plug 'bhurlow/vim-parinfer',         {'for': ['lisp', 'clojure', 'clojurescript']}
Plug 'guns/vim-clojure-highlight',   {'for': ['clojure', 'clojurescript']}

Plug 'fabiodomingues/clj-depend',    {'for': ['clojure', 'clojurescript', 'edn']}
Plug 'guns/vim-clojure-static',      {'for': 'clojure'}
Plug 'guns/vim-sexp',                {'for': 'clojure'}

Plug 'tpope/vim-fireplace',          {'for': 'clojure'}

Plug 'tpope/vim-classpath',          {'for': 'clojure'}
Plug 'venantius/vim-cljfmt',         {'for': 'clojure'}

Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-dispatch',           {'for': 'clojure'}

"ELIXIR"
Plug 'elixir-editors/vim-elixir',    {'for': 'elixir'}

"GIT"
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

"OTHER"
Plug 'kien/rainbow_parentheses.vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'elzr/vim-json', {'for': ['json', 'jsonp']}
Plug 'roman/golden-ratio'
Plug 'yegappan/taglist',             {'for': ['clojure', 'clojurescript']}
Plug 'junegunn/fzf',                 { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'rhysd/vim-healthcheck'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'echuraev/translate-shell.vim', { 'do': 'wget -O ~/.vim/translate git.io/trans && chmod +x ~/.vim/translate' }
call plug#end()

sy on

filetype plugin indent on

colorscheme pop-punk

scriptencoding utf-8

set clipboard^=unnamed,unnamedplus
set grepprg=ag\ --vimgrep
set makeprg=make\ -j$(nproc)

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

set re=0
set ffs=unix,mac
set exrc
set secure
set history=1000
set viminfo='100,\"20000,:2000,%,n~/.viminfo

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

set background=dark

set updatetime=400
set timeout timeoutlen=3000 ttimeoutlen=100

set shell=$SHELL
set tags=./.tags,$HOME
set number
set magic
set ruler
set ttyfast
set ttyscroll=3
set lazyredraw
set synmaxcol=1111

set autoread

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

set t_Co=256
set mps+=<:>
set iskeyword+=-
set listchars=tab:..,trail:.,nbsp:_
set fillchars+=vert:\  
set laststatus=2

set statusline=%F%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]
set modeline
set modelines=2
set cmdheight=2

set pastetoggle=<F12>
set textwidth=99
set colorcolumn=99,111

set wildmenu
set wildignorecase
set wildmode=list:longest,full
set wildignore=*.swp,*.pdf,*.png,*.jpeg,*.gif
set wildignore+=*/node_modules/*,.git,.clj-kondo,.lsp,.cpcache

set termguicolors
set formatoptions=tcqrn2
set runtimepath^=~/.vim/plugged
set omnifunc=syntaxcomplete#Smart_TabComplete
set complete+=k
set complete+=d
set complete+=U
set completeopt=menuone,noinsert,noselect
""set completeopt=longest,menu,preview
""set completeopt=menuone,noinsert,noselect,preview

"Usage > https://github.com/prabirshrestha/vim-lsp/wiki/Servers-Clojure"
"LSP"
au User lsp_setup call lsp#register_server({
      \ 'name': 'clojure-lsp',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'clojure-lsp']},
      \ 'allowlist': ['clojure', 'clojurescript'],
      \ })

au User lsp_setup call lsp#register_server({
  \ 'name': 'clj-kondo',
  \ 'cmd': {server_info->[&shell, &shellcmdflag, 'java -jar ~/YGVKN/LSP/clj-kondo-lsp-server-2025.06.05-standalone.jar']},
  \ 'allowlist': ['clojure', 'clojurescript']
  \ })

if executable('vim-language-server')
  aug LspVim
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'vim-language-server',
        \ 'cmd': {server_info->['vim-language-server', '--stdio']},
        \ 'whitelist': ['vim'],
        \ 'initialization_options': {
        \   'vimruntime': $VIMRUNTIME,
        \   'runtimepath': &rtp,
        \ }})
  aug END
endif

if executable('bash-language-server')
  aug LspBash
    au!
    au User lsp_setup call lsp#register_server({
          \ 'name': 'bash-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
          \ 'allowlist': ['sh'],
          \ })
  aug END
endif

let g:lsp_settings = {
\   "yaml-language-server": {
\     "workspace_config": {
\       "yaml": {
\         "customTags": [
\           "!reference sequence"
\         ]
\       }
\     }
\   }
\ }

if executable('yaml-language-server')
  aug LspYaml
   au!
   au User lsp_setup call lsp#register_server({
       \ 'name': 'yaml-language-server',
       \ 'cmd': {server_info->['yaml-language-server', '--stdio']},
       \ 'allowlist': ['yml', 'yaml', 'yaml.ansible'],
       \ 'workspace_config': {
       \   'yaml': {
       \     'validate': v:true,
       \     'hover': v:true,
       \     'completion': v:true,
       \     'customTags': ["!reference sequence"],
       \     'schemas': {},
       \     'schemaStore': { 'enable': v:true },
       \   }
       \ }
       \})
  aug END
endif

func! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K  <plug>(lsp-hover)
  nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
  nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

  let g:lsp_format_sync_timeout = 1111
  au! BufWritePre *.{clj,cljs,cljc,edn,vim,sh,yml,yaml} call execute('LspDocumentFormatSync')
endfunc

aug lsp_install
    au!
    au User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
aug END

au! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:lsp_log_verbose = 1
let g:lsp_fold_enabled = 0
let g:lsp_use_event_queue = 1
let g:lsp_max_buffer_size = 10000000
let g:lsp_max_buffer_size = -1

let g:lsp_log_file = expand('/tmp/vim-lsp.log')

let g:asyncomplete_log_file = expand('/tmp/asyncomplete.log')
let g:asyncomplete_auto_completeopt = 1

"OTHER"
imap jj <Esc>

"Lambda λ"
imap <C-j> <C-k>l*

let mapleader="\<Space>"

"Buffers"
nnoremap <F3> :bnext<CR>
nnoremap <F4> :bprevious<CR>

nnoremap <F5> :bfirst<CR>
nnoremap <F6> :blast<CR>

"Start VIM with NERDTree"
func! StartUpVIM() abort
  if !argc() && !exists("s:std_in")
      NERDTree | wincmd l | wincmd c
  end
  if argc() > 0 || exists("s:std_in")
     exe 'NERDTree' argv()[0] | wincmd p
  end
  if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in')
    exe 'NERDTree' argv()[0] | wincmd p | enew | exe 'cd '.argv()[0] | wincmd l | wincmd c
  end
endfunc

let g:NERDTreeBookmarksFile = !empty($NERDTREE_BOOKMARKS) && filereadable($NERDTREE_BOOKMARKS) ? $NERDTREE_BOOKMARKS : ''

aug nerdtreehidecwd
 au!
 au FileType nerdtree setl conceallevel=3 | syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
aug end

au BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

au StdinReadPre * let s:std_in=1
au VimEnter     * call StartUpVIM()

"AirLine"
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline_section_c = 'λ  WΛWW | ZHUZHA CORP %F '
let g:airline_theme='pop_punk'

let g:airline_highlighting_cache = 1
let g:terminal_ansi_colors = pop_punk#AnsiColors()

"FZF"
let $FZF_DEFAULT_COMMAND = 'ag --ignore .git --hidden --depth 5 -i -f -l -g ""'

"Ctags"
let tlist_clojure_settings = 'Clojure;n:namespace;d:definition;c:definition;f:function;m:macro;i:inline;a:multimethod;b:multimethod;s:struct;v:intern'

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
    \ "Ignored"   : '☒',
    \ "Unknown"   : "?"
    \ }

"NetRW"
let g:netrw_keepdir = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4

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

"VIM Slime"
"https://github.com/jpalardy/vim-slime/blob/main/doc/vim-slime.txt"
"Start Slime to vimterminal"
"<c-c>v CTRL-C v | :SlimeConfig"
"Send to REPL visual mode CTRL-C CTRL-C"

let g:slime_target = "vimterminal"
let g:slime_vimterminal_cmd = &shell
let g:slime_paste_file = "$HOME/.slime_paste"
let b:slime_bracketed_paste = 1
let g:slime_vimterminal_config = {"term_finish": "close", "term_name": "vim-terminal"}

"Parinfer"
let g:vim_parinfer_filetypes = ["lisp", "clojure", "clojurescript", "edn"]

"Translate"
let g:trans_bin = $VIM_HOME
let g:trans_default_direction="en:ru"

"JSON Plugin"
let g:vim_json_syntax_conceal = 0

"Jenkinsfile syntax"
au! BufReadPost,BufNewFile *.{Jenkinsfile,jenkinsfile},Jenkinsfile,jenkinsfile set filetype=groovy
aug groovy_autocmd
  au!
  au FileType groovy set autoindent
  au FileType groovy set formatoptions=tcq2l
  au FileType groovy set textwidth=111 shiftwidth=2
  au FileType groovy set softtabstop=2 tabstop=2
  au FileType groovy set expandtab
  au FileType groovy set foldmethod=syntax
aug END

"Native complete"
if has("autocmd") && exists("+omnifunc")
  au FileType * setl complete+=k$VIM_HOME/stock.vim
  "au FileType clojure setl complete+=k~/.vim/autoload/complete/clj_dict.vim"
endif

"Tab compl"
func Smart_TabComplete()
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
endfunc

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

func InsertTabWrapper(direction)
 let col = col('.')-1
 if !col || getline('.')[col - 1] !~ '\k'
  return "\<tab>"
 elseif "backward" == a:direction
  return "\<c-p>"
 else
  return "\<c-n>"
 endif
endfunc
inoremap <tab>   <c-r>=InsertTabWrapper   ('forward')<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper   ('forward')<cr>

hi MatchParen ctermbg=187  ctermfg=DarkMagenta guibg=magenta

hi ExtraWhitespace ctermbg=red guibg=red

au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

match ExtraWhitespace /\s\+$/

"OverLength"
hi ColorColumn cterm=italic  ctermbg=magenta guibg=#1a1a1a ctermfg=DarkMagenta

match ErrorMsg '\%>113v.\+'
match ColorColumn '\%>111v.\+'

au BufWinEnter * call matchadd('CursorColumn', '\%>'.&l:textwidth.'v.\+', -1)

"Visual mode - changed color"
hi Visual term=reverse cterm=reverse ctermbg=NONE ctermfg=NONE gui=NONE guibg=Magenta

"Plug"
let g:plug_timeout=120
let g:plug_threads=32
let g:plug_retries=3
let g:plug_shallow=1

"Custom stuff"

"runtime autoload/scratch.vim"

func! s:now(param = "%c") abort
  echowindow a:param ==# "%c" ? strftime("%c") : strftime(a:param)
endfunc
":Date | :Date("%Y %b %d %X")"
com! -nargs=? Date exe 'call s:now(<args>)'
"Scratch buffer"
com! -nargs=? Scratch exe 'call Scratch()'

au VimLeavePre * if v:dying | echowindow "\nAAAAaaaarrrggghhhh!!!\n" | endif
au VimLeave * exe 'call system("cat $HOME/.zsh_history | cut -c16- > $VIM_HOME/shared_hist.vim")'
au VimLeave * echowindow "Exit value is " .. v:exiting

au! bufwritepost $MYVIMRC so $MYVIMRC | echowindow "RELOADED ".$MYVIMRC
