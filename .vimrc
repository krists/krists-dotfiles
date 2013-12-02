 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required!
 Bundle 'gmarik/vundle'

 " My Bundles here:
 Bundle 'tpope/vim-sensible'
 Bundle 'tpope/vim-fugitive'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'goldfeld/vim-seek'
 Bundle 'chriskempson/base16-vim'
 Bundle 'kien/ctrlp.vim'
 Bundle 'tpope/vim-commentary'
 Bundle 'tpope/vim-endwise'
 Bundle 'kchmck/vim-coffee-script'
 Bundle 'tpope/vim-haml'
 Bundle 'tpope/vim-surround'
 Bundle 'tsaleh/vim-matchit'
 Bundle 'othree/html5.vim'
 Bundle 'othree/xml.vim'
 Bundle 'plasticboy/vim-markdown'
 Bundle 'jinfield/vim-nginx'
 Bundle 'jpalardy/vim-slime'
 Bundle 'kien/rainbow_parentheses.vim'
 Bundle 'guns/vim-clojure-static'
 Bundle 'thoughtbot/vim-rspec'
 Bundle 'AutoTag'

 " ZEN Code HTML
 " Bundle 'mattn/emmet-vim'

 " Snipmate and dependencies
 Bundle 'MarcWeber/vim-addon-mw-utils'
 Bundle 'tomtom/tlib_vim'
 Bundle 'garbas/vim-snipmate'
 Bundle 'honza/vim-snippets'
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

set background=dark

if has("gui_running")
  set guioptions-=T
  set guioptions-=m
  set guifont=Dejavu\ Sans\ Mono:h14
  set linespace=4
  set guiheadroom=0 " The number of pixels subtracted from the screen height when fitting the GUI window on the screen.
  set cursorline
  set cursorcolumn
  colorscheme base16-default
else
  set t_Co=256
  colorscheme smyck
endif

if has('mouse')
  set mouse=
endif

" Don’t add empty newlines at the end of files
set binary
set noeol

" No backup and swap files
set noswapfile
set nobackup
set nowritebackup

if has('persistent_undo') && exists("&undodir")
  set undodir=$HOME/.vim/undo/
  set undofile
  set undolevels=500
  set undoreload=10000
endif

set smartindent

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Line numbers
set number
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

" Folding
set foldmethod=indent
set foldnestmax=9
set nofoldenable

set nowrap " Do not wrap words (view)
set nowrapscan

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

set matchpairs+=<:>
set hlsearch

set equalalways " When on, all the windows are automatically made the same size after splitting or closing a window

if has("autocmd")
  autocmd BufRead,BufNewFile Gemfile set filetype=ruby
  autocmd BufRead,BufNewFile *.jbuilder set filetype=ruby
endif

nmap Q <NOP> " Disable entering Ex-Mode
set complete-=t " don't scan tags

let g:ctrlp_working_path_mode = 2
let g:ctrlp_root_markers = ['Gemfile', '.bashrc', '.git', 'project.clj', 'package.json', 'Gruntfile.js']
let g:ctrlp_dotfiles = 0

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby-extras'

set wildignore+=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set wildignore+=coverage,coverage.data,node_modules,.sass-cache,.tmp

imap jj <Esc>
imap hh =>

" Whitespace Wizardry
set list
set listchars=tab:▶\ 
set listchars+=trail:·
set listchars+=extends:❯
set listchars+=precedes:❮


let g:netrw_localmkdir= "mkdir"
let g:netrw_localrmdir= "rmdir"
let g:netrw_quiet = 1

let g:vim_markdown_folding_disabled=1

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let mapleader=','

" Slime config
let g:slime_target = "tmux"
let g:slime_no_mappings = 1
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeMotionSend
nmap <leader>ss <Plug>SlimeLineSend

map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>t <C-W>T

" Easy copy to system clipboard
vmap <Leader>y "+y

" Paste from system clipboard
vmap <Leader>p "+p
nmap <Leader>p "+p
nmap <Leader>P "+P

nmap <Leader>op o<ESC>"+p
nmap <Leader>Op O<ESC>"+p

" Easy blank line insert
nmap <Leader><SPACE> o<ESC>
nmap <Leader><S-SPACE> O<ESC>

" Easy line removal
nmap <Leader>d jddk
nmap <Leader>D kddj

let g:user_emmet_leader_key = '<C-z>'

nmap <A-t> :call RunCurrentSpecFile()<CR>
nmap <A-s> :call RunNearestSpec()<CR>
nmap <A-l> :call RunLastSpec()<CR>
nmap <A-a> :call RunAllSpecs()<CR>
let g:rspec_command = "!rspec  --format progress --no-color {spec}"

ca Gb Gblame
set noeb vb t_vb= " No bells