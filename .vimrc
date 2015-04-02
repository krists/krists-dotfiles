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
 Bundle 'goldfeld/vim-seek'
 Bundle 'kien/ctrlp.vim'
 Bundle 'tpope/vim-commentary'
 Bundle 'tpope/vim-endwise'
 Bundle 'tpope/vim-surround'
 Bundle 'craigemery/vim-autotag'
 Bundle 'rking/ag.vim'

 " Colorschemes
 Bundle 'chriskempson/base16-vim'

 " Syntax pluginx
 Bundle 'vim-jp/cpp-vim'
 Bundle 'mxw/vim-jsx'
 Bundle 'jinfield/vim-nginx'
 Bundle 'tpope/vim-haml'
 Bundle 'digitaltoad/vim-jade'
 Bundle 'plasticboy/vim-markdown'
 Bundle 'othree/xml.vim'
 Bundle 'slim-template/vim-slim.git'
 Bundle 'othree/html5.vim'
 Bundle 'kchmck/vim-coffee-script'
 Bundle 'guns/vim-clojure-static'

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

set t_Co=256
colorscheme smyck

set synmaxcol=300 " Stop syntax coloring after column 300

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
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

" Folding
set foldmethod=indent
set foldnestmax=9
set nofoldenable

set nowrap " Do not wrap words (view)
set showbreak=↪
set nowrapscan

if !&scrolloff
  set scrolloff=3
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

set matchpairs+=<:>
set hlsearch

set equalalways " When on, all the windows are automatically made the same size after splitting or closing a window

if has("autocmd")
  autocmd BufRead,BufNewFile Gemfile set filetype=ruby
  autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
  autocmd BufRead,BufNewFile Berksfile set filetype=ruby
  autocmd BufRead,BufNewFile *.jbuilder set filetype=ruby
endif

nmap Q <NOP> " Disable entering Ex-Mode
set complete-=t " don't scan tags

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['Gemfile', '.bashrc', '.git', 'project.clj', 'package.json', 'Gruntfile.js']
let g:ctrlp_by_filename = 1
let g:ctrlp_dotfiles = 0

set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby-extras'

set wildignore+=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set wildignore+=coverage,coverage.data,node_modules,.sass-cache,.tmp,dist,tmp

noremap ; :


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

let mapleader=','

map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>t <C-W>T

" Easy copy to system clipboard
vmap <Leader>y "+y

" Paste from system clipboard
vmap <Leader>p "+p
nmap <Leader>p "+p
nmap <Leader>P "+P

nmap <Leader>sd cs'"
nmap <Leader>ss cs"'

nmap <Leader>op o<ESC>"+p
nmap <Leader>Op O<ESC>"+p

" Easy blank line insert
nmap <Leader><SPACE> o<ESC>
nmap <Leader><S-SPACE> O<ESC>

" Easy line removal
nmap <Leader>d jddk
nmap <Leader>D kddj

"Easier window navigation, control+letter moves in that direction
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Firefox-style tab selection with command+number, mac only
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>
imap <D-1> <esc>1gt
imap <D-2> <esc>2gt
imap <D-3> <esc>3gt
imap <D-4> <esc>4gt
imap <D-5> <esc>5gt
imap <D-6> <esc>6gt
imap <D-7> <esc>7gt
imap <D-8> <esc>8gt
imap <D-9> <esc>9gt
imap <D-0> <esc>:tablast<CR>

ca Gb Gblame
set noeb vb t_vb= " No bells