set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'

" Colorschemes
Plugin 'chriskempson/base16-vim'
Plugin 'whatyouhide/vim-gotham'

" Syntax pluginx
Plugin 'vim-jp/cpp-vim'
Plugin 'jinfield/vim-nginx'
Plugin 'tpope/vim-haml'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'othree/xml.vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'othree/html5.vim'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()
filetype plugin indent on

set background=dark

set t_Co=256
colorscheme default


set synmaxcol=300 " Stop syntax coloring after column 300

if has('mouse')
  set mouse=
endif

set viminfo=""

" Don’t add empty newlines at the end of files
set binary
set noeol

" No backup and swap files
set noswapfile
set nobackup
set nowritebackup

if has('persistent_undo')
  set noundofile
endif

set smartindent

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Line numbers
set number

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
  autocmd BufRead,BufNewFile *.jbuilder set filetype=ruby
endif

nmap Q <NOP> " Disable entering Ex-Mode
set complete-=t " don't scan tags


set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

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

set noeb vb t_vb= " No bells