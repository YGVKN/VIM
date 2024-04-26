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

"Janet"
Plug 'bakpakin/janet.vim',           {'for': 'janet'}

"CLOJURE"
Plug 'bhurlow/vim-parinfer',         {'for': ['clojure', 'clojurescript', 'edn', 'janet']}

Plug 'guns/vim-clojure-highlight',   {'for': 'clojure'}

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

"VLANG"
Plug 'ollykel/v-vim',                {'for': 'vlang'}

"GIT"
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

"OTHER"
Plug 'kien/rainbow_parentheses.vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'roman/golden-ratio'
Plug 'fladson/vim-kitty'
Plug 'yegappan/taglist',             {'for': ['clojure', 'clojurescript']}
Plug 'junegunn/fzf',                 { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'rhysd/vim-healthcheck'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'echuraev/translate-shell.vim', { 'do': 'wget -O ~/.vim/trans git.io/trans && chmod +x ~/.vim/trans' }
call plug#end()

sy on

filetype plugin indent on
"Kitty terminal"
" Mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''
"Kitty terminl"
colorscheme pop-punk

scriptencoding utf-8
"set spell spelllang=en_us,ru_ru"
set clipboard^=unnamed,unnamedplus "Copy to sys buffer"
""set grepprg=rg\ --vimgrep\ --color=always\ --hidden\ --heading\ --max-depth=8\ -Lin\ -j$(nproc)
set  grepprg=ag\ --vimgrep

"Usage :vimgrep "zh"  ~/.vimrc | cw"

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
""set title titlelen=333
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
set smartindent
set cindent

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
set wildignore=*.swp,*.o
set wildignore+=*/node_modules/*,.git

set formatoptions=tcqrn2
set runtimepath^=~/.vim/plugged
set termguicolors
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
  \ 'cmd': {server_info->[&shell, &shellcmdflag, 'java -jar ~/YGVKN/LSP/clj-kondo-lsp-server-2024.03.05-standalone.jar ']},
  \ 'allowlist': ['clojure', 'clojurescript']
  \ })

if executable('vim-language-server')
  augroup LspVim
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'vim-language-server',
        \ 'cmd': {server_info->['vim-language-server', '--stdio']},
        \ 'whitelist': ['vim'],
        \ 'initialization_options': {
        \   'vimruntime': $VIMRUNTIME,
        \   'runtimepath': &rtp,
        \ }})
  augroup END
endif

if executable('bash-language-server')
  augroup LspBash
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'bash-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
          \ 'allowlist': ['sh','zsh'],
          \ })
  augroup END
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
  augroup LspYaml
   autocmd!
   autocmd User lsp_setup call lsp#register_server({
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
  augroup END
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
    " refer to doc to add more commands
endfunc

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    au User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

au! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:lsp_log_verbose = 1
let g:lsp_fold_enabled = 0
let g:lsp_use_event_queue = 1
let g:lsp_max_buffer_size = 10000000
let g:lsp_max_buffer_size = -1

let g:lsp_log_file = expand('/tmp/vim-lsp.log')

let g:asyncomplete_log_file = expand('/tmp/asyncomplete.log')
let g:asyncomplete_auto_completeopt = 1

"V Lang"
let g:v_autofmt_bufwritepre = 1

"OTHER"
imap jj <Esc>

"Lambda λ"
imap <C-j> <C-k>l*

let g:mapleader = ","

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

augroup nerdtreehidecwd
 au!
 au FileType nerdtree setl conceallevel=3 | syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
augroup end

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
let $FZF_DEFAULT_COMMAND = 'ag --ignore .git --hidden --depth 8 -i -f -l -g ""'

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

au FileType clojure,edn let b:slime_vimterminal_cmd = 'clojure -Sdeps "{:deps {com.bhauman/rebel-readline {:mvn/version \"0.1.4\"}}}" -M -m rebel-readline.main'

""autocmd FileType clojure let b:slime_vimterminal_cmd = 'clj -J-Dclojure.server.vim-prepl="{:port '.$REPL_PORT.' :accept clojure.core.server/io-prepl}"'
""clj -Sdeps '{:deps {cider/cider-nrepl {:mvn/version "0.44.0"} }}' -M -m nrepl.cmdline --color --interactive -h "localhost" -b "127.0.0.1" -p 8765

"Parinfer"
let g:vim_parinfer_filetypes = ["clojure","clojurescript","edn"]

"Translate"
let g:trans_bin = "~/.vim"
let g:trans_default_direction="en:ru"

"JSON"
au! BufReadPost,BufNewFile *.json set filetype=json
augroup json_autocmd
  au!
  au FileType json set autoindent
  au FileType json set formatoptions=tcq2l
  au FileType json set textwidth=111 shiftwidth=2
  au FileType json set softtabstop=2 tabstop=2
  au FileType json set expandtab
  au FileType json set foldmethod=syntax
augroup END

"Jenkinsfile syntax"
au! BufReadPost,BufNewFile *.{Jenkinsfile,jenkinsfile},Jenkinsfile,jenkinsfile set filetype=groovy
augroup groovy_autocmd
  au!
  au FileType groovy set autoindent
  au FileType groovy set formatoptions=tcq2l
  au FileType groovy set textwidth=111 shiftwidth=2
  au FileType groovy set softtabstop=2 tabstop=2
  au FileType groovy set expandtab
  au FileType groovy set foldmethod=syntax
augroup END

"Native complete"
""if has("autocmd") && exists("+omnifunc")
""  au FileType clojure setl complete+=k~/.vim/autoload/complete/clj_dict.vim
""  au FileType * setl complete+=k~/.vim/autoload/dicts/history_words.vim
""":set dictionary+=/usr/share/dict/words"
"""add repl history"
""endif

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

runtime autoload/scratch.vim

"Custom stuff"
func! s:now(param = "%c") abort
  echon a:param ==# "%c" ? strftime("%c") : strftime(a:param)
endfunc
":Date | :Date("%Y %b %d %X")"
com! -nargs=? Date exe 'call s:now(<args>)'
"Scratch buffer"
com! -nargs=? Scratch exe 'call Scratch()'

au VimLeavePre * if v:dying | echowindow "\nAAAAaaaarrrggghhhh!!!\n" | endif
""au VimLeave * exe 'call system("cat $HOME/.zsh_history | cut -c16- > $HOME/.vim/autoload/dicts/history_words.vim")'
au VimLeave * echowindow "Exit value is " .. v:exiting

au! bufwritepost $MYVIMRC so $MYVIMRC | echon "Reloaded ".$MYVIMRC
