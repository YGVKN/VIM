set nocompatible
call plug#begin('~/.vim/plugged')

"LISP"
Plug 'bhurlow/vim-parinfer',{'for': ['lisp','clojure','clojurescript','scheme','racket']}
"nav|search"
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'

"PROLOG"
Plug 'mxw/vim-prolog'
Plug 'adimit/prolog.vim'
"CLOJURE"
Plug 'tpope/vim-fireplace'
"ELIXIR"
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
"JULIA"
Plug 'JuliaEditorSupport/julia-vim'
"template|preproc etc"
Plug 'mattn/emmet-vim',{'for': ['*','html','javascript','php','ruby','erlang','python','clojure','elixir']}

"elm"
Plug 'ElmCast/elm-vim',{'for': 'elm'}
Plug 'lambdatoast/elm.vim',{'for': 'elm'}

"PHP"
Plug 'stanangeloff/php.vim',{'for': 'php'}

"scope langs"
Plug 'sheerun/vim-polyglot'

"GIT"
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
"HTML"
Plug 'othree/html5.vim',{'for': 'html'}
Plug 'alvan/vim-closetag',{'for': 'html'}
Plug 'gregsexton/MatchTag',{'for': 'html'}
"CSS"
Plug 'gorodinskiy/vim-coloresque',{'for': 'css'}
Plug 'lepture/vim-css'
Plug 'jiangmiao/auto-pairs'
"Python"
Plug 'klen/python-mode',{'for': 'python'}

"RUBY"
Plug 'vim-ruby/vim-ruby',{'for': 'ruby'}
"CRYSTAL"
Plug 'rhysd/vim-crystal'
"JS"
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'isruslan/vim-es6'
"RUST"
Plug 'rust-lang/rust.vim'

"colorSchemes"
Plug 'TroyFletcher/vim-colors-synthwave'


"OTHER"
Plug 'oblitum/rainbow'

call plug#end()
syntax on
filetype on
filetype plugin indent on

colorscheme synthwave
set background=dark
set encoding=utf8
set title
set number
set cursorline
set cursorcolumn
set wildmenu
set list
set listchars=tab:..
set tabstop=2
set softtabstop=2
set shiftwidth=2
set laststatus=2
set ruler
set smartindent
set wrap
set linebreak
set showcmd
set hlsearch
set incsearch
set nowrapscan
set mps+=<:>
set showmatch
set smartcase
set ignorecase
set confirm
set t_Co=256
"set paste
set pastetoggle=<F12>
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]
set fillchars+=vert:\ 
set textwidth=111
set colorcolumn=111
set belloff=all
"set termguicolors
"set relativenumber
"set foldcolumn=13

"rainbow pairs brackets"
let g:rainbow_active=1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex'  , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.clj'  , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.cljs' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.lisp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.css'  , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.scss' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'magenta', 'yellow', 'red', 'magenta']
"nerd settings"
let g:NERDTreeDirArrowExpandable="λ"
let g:NERDTreeDirArrowCollapsible=">"
let g:NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
hi NERDTreeClosable ctermfg=5
hi NERDTreeOpenable ctermfg=lightmagenta
"lang scope settings"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

"highlight whitespace etc"
highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

"cursorline settings"
"hi CursorLine   cterm=underline ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi Cursor ctermfg=Red ctermbg=Red cterm=bold guifg=red guibg=red gui=bold
"hi CursorColumn ctermfg=Blue ctermbg=Yellow cterm=bold guifg=red guibg=yellow gui=bold
hi CursorLine   guibg=#ff0000
hi LineNr       guifg=#ff0000
"Background Color"
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
"lineLength"
:match ErrorMsg '\%111v.\+'

function! Smart_TabComplete()
  let line = getline('.')

  let substr = strpart(line, -1, col('.')+1)


  let substr = matchstr(substr, "[^ \t]*$")
  if (strlen(substr)==0)
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1
  let has_slash = match(substr, '\/') != -1
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
inoremap <tab> <c-r>=InsertTabWrapper ('forward')<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ('forward')<cr>
"other setting"

"highlight syntax picolisp as classic lisp"

"au BufNewFile,BufRead,BufReadPost *.somEextensin set syntax=yourExtension"
augroup l
	au!
	autocmd BufNewFile,BufRead *.l set syntax=lisp
augroup END
"completing..."

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType htmlset    set omnifunc=htmlcomplete#CompleteTags
autocmd FileType cssset     set omnifunc=csscomplete#CompleteCSS
autocmd FileType PHPset     set omnifunc=phpcomplete#CompletePHP
autocmd FileType python     set omnifunc=pythoncomplete#Complete
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.php  :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()
autocmd BufWrite *.css  :call DeleteTrailingWS()
autocmd BufWrite *.js   :call DeleteTrailingWS()
autocmd BufWrite *.py   :call DeleteTrailingWS()
autocmd BufWrite *.rb   :call DeleteTrailingWS()
"TODO"

"autoload"
autocmd vimenter * NERDTree
