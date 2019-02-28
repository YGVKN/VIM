set nocompatible
call plug#begin('~/.vim/plugged')
"LISP"
Plug 'bhurlow/vim-parinfer',{'for': ['lisp','clojure','clojurescript','scheme','racket']}
Plug 'kovisoft/paredit'
Plug 'jpalardy/vim-slime'
Plug 'kien/rainbow_parentheses.vim'
"COMMON LISP"
Plug 'l04m33/vlime',{'for': 'lisp'}
"SCHEME"
"RACKET"
Plug 'wlangstroth/vim-racket',{'for': 'racket'}
"nav|search"
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim',{'on': 'CtrlP'}
Plug 'scrooloose/nerdcommenter'
"HASKEL"
"PURESCRIPT"
"OCAML"
"REASON"
"PROLOG"
Plug 'mxw/vim-prolog',    {'for': 'prolog'}
Plug 'adimit/prolog.vim', {'for': 'prolog'}
"^%CLOJURE%$"
Plug 'guns/vim-clojure-highlight',{'for': 'clojure'}
Plug 'tpope/vim-fireplace',       {'for': 'clojure'}
Plug 'guns/vim-clojure-static',   {'for': 'clojure'}
Plug 'tpope/vim-classpath',       {'for': ['clojure','clojurescript','lisp']}
Plug 'tpope/vim-salve',           {'for': 'clojure'}
"CLOJURESCRIPT"
"ERLANG"
Plug 'vim-erlang/vim-erlang-omnicomplete' ,{'for': 'erlang'}
"ELIXIR"
Plug 'elixir-editors/vim-elixir',{'for':'elixir'}
Plug 'slashmili/alchemist.vim',  {'for':'elixir'}
"JULIA"
Plug 'JuliaEditorSupport/julia-vim',{'for': 'julia'}
"markup"
Plug 'mattn/emmet-vim' ,{'on': 'Emmet'}
"ELM"
Plug 'ElmCast/elm-vim',     {'for': 'elm'}
Plug 'lambdatoast/elm.vim', {'for': 'elm'}
"PHP"
Plug 'stanangeloff/php.vim',{'for': 'php'}
"GIT"
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
"HTML"
Plug 'othree/html5.vim',   {'for': 'html'}
Plug 'alvan/vim-closetag'
"Plug 'gregsexton/MatchTag'
"CSS"
Plug 'hail2u/vim-css3-syntax',    {'for': 'css'}
Plug 'gorodinskiy/vim-coloresque',{'for': 'css'}
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
Plug 'jiangmiao/auto-pairs'
"PYTHON"
Plug 'klen/python-mode', {'for': 'python'}
"RUBY"
Plug 'vim-ruby/vim-ruby',{'for': 'ruby'}
"CRYSTAL"
Plug 'rhysd/vim-crystal',{'for':'crystal'}
"JS"
Plug 'pangloss/vim-javascript',     {'for': 'javascript'}
Plug 'jelera/vim-javascript-syntax',{'for': 'javascript'}
Plug 'isruslan/vim-es6',            {'for': 'javascript'}
"SCALA"
Plug 'derekwyatt/vim-scala',{'for': 'scala'}
"colorSchemes"
"OTHER"
Plug 'tpope/vim-surround'
Plug 'elzr/vim-json',{'for': 'json'}
Plug 'roman/golden-ratio'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

filetype plugin indent on
scriptencoding utf-8
colorscheme solarized
set langmenu=en_US.UTF-8
let $LANG = 'en_US'
set spell spelllang=en_us,ru_ru
set background=dark
set encoding=utf-8
set shell=bash
set splitright
set splitbelow
set ttyfast
set title
set number
set cursorline
set cursorcolumn
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set listchars=tab:..,trail:.,nbsp:_
set et
set ai
set lz
set wildmenu
set wildmode=full
set list
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set laststatus=2
set ruler
set smartindent
set wrap
set linebreak
set nowrapscan
set showmode
set showcmd
set mps+=<:>
set confirm
set t_Co=256
"set paste
set pastetoggle=<F12>
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]
set fillchars+=vert:\ 
set textwidth=99
set colorcolumn=+1,+12
set iskeyword+=-
set mouse= 
set autoread
set lazyredraw
set pumheight=33
"set termguicolors
"set relativenumber
"set foldcolumn=13
set omnifunc=syntaxcomplete#Complete
set completeopt=noinsert,menuone
set backspace=indent,eol,start
set nrformats=
set nofoldenable
set history=888
set suffixesadd+=.rb,.cr,.php,.py,.clj,.cljs,.erl,.ex,.exs,.elm,.js,.html,.css,.hs,.lisp,.scm,.rkt
set path=.
set runtimepath^=~/.vim/plugged/vim-erlang-omnicomplete
inoremap jj <Esc>
sy on
map <silent> <F8>   :Explore<CR>
map <silent> <S-F8> :sp +Explore<CR>
"REPL"
let g:slime_target = "vimterminal"
"common lisp sbcl vlime settings"
let g:vlime_enable_autodoc  = v:true
let g:vlime_window_settings = {'sldb': {'pos': 'belowright', 'vertical': v:true}, 'inspector': {'pos': 'belowright', 'vertical': v:true}, 'preview': {'pos': 'belowright', 'size': v:null, 'vertical': v:true}}
"nerd settings"
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
    \ "Clean"     : "*",
    \ 'Ignored'   : "💎",
    \ "Unknown"   : "λ"
    \ }
"NETRW"
let g:netrw_banner       = 0
let g:netrw_liststyle    = 3
let g:netrw_browse_split = 2
let g:netrw_winsize      = 25
"airline"
let g:airline_theme = 'atomic'
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"highlight whitespace etc"
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
  autocmd FileType json set textwidth=99 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=2
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END
"******************"
"Background Color"
hi! Normal  ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
"colorscheme settings"
"autocmd BufEnter * colorscheme solarized
autocmd BufEnter *.html colorscheme solarized8
"LineLength"
match ErrorMsg '\%99v.\+'
autocmd BufWinEnter * call matchadd('ErrorMsg', '\%>'.&l:textwidth.'v.\+', -1)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

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
"other ..."
"au BufNewFile,BufRead,BufReadPost *.markdown,*.md set syntax=lisp
"###########################################"
augroup l
	au!
	autocmd BufNewFile,BufRead *.l set syntax=lisp
augroup END
"VIMCSS settings"
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css set iskeyword+=-
augroup END
hi VendorPrefix guifg=#00ffff gui=bold
match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/
"""""""""""
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType ruby       set omnifunc=rubycomplete#Complete
autocmd FileType htmlset    set omnifunc=htmlcomplete#CompleteTags
autocmd FileType cssset     set omnifunc=csscomplete#CompleteCSS
autocmd FileType PHPset     set omnifunc=phpcomplete#CompletePHP
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd Filetype erlang     set omnifunc=erlang_complete#Complete

autocmd BufWrite *.php  :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.css  :call DeleteTrailingWS()
autocmd BufWrite *.js   :call DeleteTrailingWS()
autocmd BufWrite *.py   :call DeleteTrailingWS()
autocmd BufWrite *.rb   :call DeleteTrailingWS()

"rainbow_parentheses"
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
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"Disable Arrow
map  <up>     <nop>
map  <down>   <nop>
map  <left>   <nop>
map  <right>  <nop>
imap <up>     <nop>
imap <down>   <nop>
imap <left>   <nop>
imap <right>  <nop>

