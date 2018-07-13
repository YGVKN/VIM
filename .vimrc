set nocompatible
call plug#begin('~/.vim/plugged')

"nav|search&NERD"
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
"CLOJURE"
Plug 'tpope/vim-fireplace'

"template|preproc etc"
Plug 'mattn/emmet-vim',{'for':['html','css','php','ruby','eruby','jruby','python','clojure']}

"elm"
Plug 'ElmCast/elm-vim',{'for': 'elm'}
Plug 'lambdatoast/elm.vim',{'for': 'elm'}

"PHP"
Plug 'stanangeloff/php.vim',{'for': 'php'}

"scope lang"
Plug 'sheerun/vim-polyglot'

"GIT"
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"HTML|*"
Plug 'othree/html5.vim',{'for': 'html'}
Plug 'alvan/vim-closetag',{'for': 'html'}
Plug 'gregsexton/MatchTag',{'for': 'html'}
"CSS|*"
Plug 'lepture/vim-css',{'for': 'css'}
Plug 'jiangmiao/auto-pairs'

"Python"
Plug 'klen/python-mode',{'for': 'python'}

"Ruby"
Plug 'vim-ruby/vim-ruby',{'for': 'ruby'}

"JS"
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'isruslan/vim-es6'

"colorSchemes"
Plug 'TroyFletcher/vim-colors-synthwave'

call plug#end()
syntax on
filetype on
filetype plugin indent on
colorscheme synthwave
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
set pastetoggle= 
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]
set fillchars+=vert:\ 
set textwidth=77
set colorcolumn=77
set belloff=all
hi Cursor ctermfg=Red ctermbg=Yellow cterm=bold guifg=red guibg=yellow gui=bold
hi CursorColumn ctermfg=Red ctermbg=Yellow cterm=bold guifg=red guibg=yellow gui=bold 
"nerd settings"
let g:NERDTreeDirArrowExpandable="λ"
let g:NERDTreeDirArrowCollapsible=">"
let g:NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

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
"lineLength"
:match ErrorMsg '\%77v.\+'

"tab complete"
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

"completing..."
autocmd FileType htmlset omnifunc=htmlcomplete#CompleteTags
autocmd FileType cssset omnifunc=csscomplete#CompleteCSS
autocmd FileType PHPset omnifunc=phpcomplete#CompletePHP

"autoload"
autocmd vimenter * NERDTree
