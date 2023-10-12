filetype off
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree',          { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"ColorScheme"
Plug 'xolox/vim-misc'
Plug 'bignimbus/pop-punk.vim'
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-colorscheme-switcher'
"Plug 'matsuuu/pinkmare'"
"Plug 'sonph/onehalf'"
"Plug 'rose-pine/vim'"
"Plug 'kyoz/purify', { 'rtp': 'vim' }"

"V Lang"
Plug 'ollykel/v-vim',                {'for': 'v'}

"CLOJURE"
Plug 'kovisoft/paredit',             {'for': ['clojure', 'clojurescript']}
"http://danmidwood.com/content/2014/11/21/animated-paredit.html"

Plug 'guns/vim-clojure-highlight',   {'for': 'clojure'}

Plug 'guns/vim-clojure-static',      {'for': 'clojure'}
Plug 'guns/vim-sexp',                {'for': 'clojure'}

Plug 'tpope/vim-fireplace',          {'for': 'clojure'}

Plug 'tpope/vim-classpath',          {'for': 'clojure'} "$HOME/.cache/classpath"

"ELIXIR"
Plug 'elixir-editors/vim-elixir',    {'for': 'elixir'}

"GIT"
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

"OTHER"
Plug 'kien/rainbow_parentheses.vim'
Plug 'stephpy/vim-yaml',             {'for': 'yaml'}
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-surround'
Plug 'roman/golden-ratio'

"Plug 'jiangmiao/auto-pairs'"
"Plug '~/my-prototype-plugin'"
call plug#end()

sy on

filetype plugin indent on

colorscheme pop-punk

scriptencoding utf-8

"set spell spelllang=en_us,ru_ru"
set clipboard^=unnamed,unnamedplus "Copy to sys buffer"
set grepprg=rg\ --vimgrep\ -in\ -j8\ --follow
set makeprg=make\ -j$(nproc)

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

set timeout timeoutlen=3000 ttimeoutlen=100

set shell=/bin/zsh

set title
set number
set magic
set ruler
set ttyfast
set lazyredraw

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
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]

set statusline+=\ %F
set statusline+=\ %{strftime('%c')}
set statusline+=%l,%c%V
set statusline+=\ %P
set modeline
set modelines=3
set cmdheight=7

set pastetoggle=<F12>
set textwidth=99
set colorcolumn=99,111

set wildmenu
set wildignorecase
""set wildignore=*.o,*.obj
set wildmode=list:longest,full

set formatoptions=tcqrn2
""set runtimepath^=~/.vim/plugged
"set path+=**/*"
""set path^=**4
""set path+=**3
""set path=.,/usr/include,,,**3
set termguicolors
"set omnifunc=syntaxcomplete#Complete"
set omnifunc=syntaxcomplete#Smart_TabComplete
set completeopt=longest,menu,preview

"OTHER"
imap jj <Esc>

"Buffers"
nnoremap <F4> :bnext<CR>
nnoremap <F3> :bprevious<CR>

nnoremap <F5> :bfirst<CR>
nnoremap <F6> :blast<CR>

"Start VIM with NERDTree"
func StartUpVIM() abort
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

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter     * call StartUpVIM()

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

augroup nerdtreehidecwd
 autocmd!
 autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
augroup end

"AirLine"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline_section_c = 'λ WΛWW.IO %F'
let g:airline_theme='pop_punk'

let g:airline_highlighting_cache = 1
let g:terminal_ansi_colors = pop_punk#AnsiColors()

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

"V Lang Settings"
let g:v_autofmt_bufwritepre = 1

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
autocmd FileType yaml setlocal indentkeys-=<:>

"Jenkinsfile syntax"

au! BufRead,BufNewFile *.{Jenkinsfile,jenkinsfile},Jenkinsfile,jenkinsfile set filetype=groovy
augroup groovy_autocmd
  autocmd!
  autocmd FileType groovy set autoindent
  autocmd FileType groovy set formatoptions=tcq2l
  autocmd FileType groovy set textwidth=111 shiftwidth=2
  autocmd FileType groovy set softtabstop=2 tabstop=2
  autocmd FileType groovy set expandtab
  autocmd FileType groovy set foldmethod=syntax
augroup END

"Native complete"
if has("autocmd") && exists("+omnifunc")
  autocmd FileType clojure setlocal complete+=k~/.vim/autoload/complete/clj_dict.vim
":set dictionary+=/usr/share/dict/words"
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

"""command! -nargs=1 FF let i=1
"""      \|let mm=findfile(<q-args>, '', -1)|for f in mm| echo i.':'.f|let i+=1|endfor
"""      \|let choice=input('FF: ')|exec 'e ' . mm[choice-1]"



"Socket Server"
"python3 $VIMRUNTIME/tools/demoserver.py"

"let ch = ch_open('localhost:8765')
"""let ch = ch_open('127.0.0.1:8765')
""func MyHandler(channel, msg)
""  echo "from the handler: " .. a:msg
""endfunc
""
""echo ch_evalexpr(ch, 'Some msg',{'callback': "MyHandler"})
"""echowindow ch_status(ch)

""call ch_close(ch)

"""clj -J-Dclojure.server.jvm="{:port 5555 :accept clojure.core.server/io-prepl}"

"""client clojure.core/server remote-repl host port +opts


func Date_data(param = "%c") abort
  echowindow a:param ==# "%c" ? strftime("%c") : strftime(a:param)
endfunc
":Date | :Date("%Y %b %d %X")"
command! -nargs=? Date exe ':call Date_data(<args>)'

au VimLeavePre * if v:dying | echo "\nAAAAaaaarrrggghhhh!!!\n" | endif"
"au VimLeave * :!some command <example  !ls -la> or your custom hook"
"echowindow wordcount()"
au! bufwritepost $MYVIMRC so $MYVIMRC | echowindow "Reloaded ".$MYVIMRC

"help!
"help 42
"help quotes
"help holy-grail
":smile"

"Runnig & profiling"
"vim --cmd 'profile start profile.log' --cmd 'profile func *' --cmd 'profile file *' -c 'profdel func *' -c 'profdel file *' -c 'qa!'"
"vim run as cli command with args - vim -Nu NONE -c <args>"
"vim -U NONE -X -Z -e -s -S poc -c qa"
"vim -c 'profile start vim.log' -c 'profile func *' -c 'q' - profiling by all funcs & time execution"

"https://learnvimscriptthehardway.stevelosh.com/"
"ps x -o user,pid,rss,comm | awk 'NR>1 {$3=int($3/1024)"Mb";}{ print ;}' | grep -i iterm | sort -k 3 -n"
"q: & q/"
".vim/autoload/stuff.vim - call stuff#Some_fn"
"nc -v -z -w 3 waww.io 443 &> /dev/null && echo "Port 443 [tcp/https] - OPEN" || echo "CLOSE" "
"curl wttr.in/Moscow"
"Get IP   curl icanhazip.com"
"get IP https://api.ipify.org/"
"Get info by IP  curl -sSL https://ipinfo.io/87.249.25.6 | jq '.ip,.hostname,.city,.region,.country,.loc,.org,.timezone' "
"example | curl -sSL "https://ipinfo.io/$(curl icanhazip.com)" | jq -C "'.ip,.hostname,.city,.region,.country,.loc,.org,.timezone' |"
"example | curl -# "https://ipinfo.io/$(curl icanhazip.com)" | jq -C "'.ip,.hostname,.city,.region,.country,.loc,.org,.timezone' |"
"Scanning ports nc -z -n -v -w 3 31.31.196.139  1-1000>nc.out 2>&1  "
"https://foragoodstrftime.com/ Date format"
