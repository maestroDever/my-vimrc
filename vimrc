"
syntax on 
set number
set noswapfile
set hidden
set cursorline

set clipboard=unnamed
set backspace=2 " make backspace work like most other apps

set nocompatible	" be improved
filetype off		" required!

" Mapping keys
"
"
" Ctrl - save
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>a

" Nerdtree
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-z> :NERDTreeCWD<CR>

" Tab navigation like firefox
nnoremap <C-a> :bprevious<CR>
nnoremap <C-b> :bnext<CR>

" Allow us to use Ctrl-s and Ctrl-q as keybinds
" silent !stty -ixon

" Restore default behaviour when leaving Vim.
autocmd VimLeave * !stty ixon

" Highlight seach
set hlsearch

"
" Tab key == 2 spaces and auto indent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" support css word with -
autocmd FileType css,scss,slim,html,eruby,coffee,javascript setlocal iskeyword+=-
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

" original repos from github
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"Plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" >>>> My bundles here >>>
Plugin 'FuzzyFinder'
Plugin 'flazz/vim-colorschemes'

" my local plugin can be added like below
" Plugin 'file:///Users/lavie/path/to/plugin'

Plugin 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/vim-scripts/Emmet.vim.git'
Plugin 'https://github.com/gregsexton/MatchTag.git'
Plugin 'https://github.com/jelera/vim-javascript-syntax.git'

" quickly comment your code, try ,cc on selected line
Plugin 'vim-scripts/The-NERD-Commenter'

" indent guides
let g:indent_guides_guide_size = 1
Plugin 'nathanaelkane/vim-indent-guides'

" git with vim
Plugin 'https://github.com/airblade/vim-gitgutter.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-ariline/vim-airline-thems'
let g:airline#extensions#tabline#enabled = 1

" Status line highlight
Plugin 'itchyny/lightline.vim'
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" Git branch name in status
Plugin 'itchyny/vim-gitbranch'

" markdown support
let g:indent_guides_guide_size = 1
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" slim template support
Plugin 'slim-template/vim-slim.git'

" hack filetype for slim
autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd BufNewFile,BufRead *.es6 set filetype=javascript

" quickly search file(s), use ctrl+p, F5 refresh
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Store|git|hg|svn)|(optimized|compiled|node_modules|bower_compenents)$'
map <c-o> :CtrlPBuffer<CR>

" sass highlight
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'isRuslan/vim-es6'

" Powerline
Plugin 'Lokaltog/vim-powerline'

" Syntastic
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en

" Turn on the WiLd menu
set wildmenu

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1

"" Monokai theme
colorscheme molokai

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



