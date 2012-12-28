set nocompatible               " be iMproved
filetype off                   " required until end of vundle section

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ###### VUNDLE ######

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"Bundle 'lambdalisue/vim-django-support'
Bundle 'pbrisbin/html-template-syntax'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"
Bundle 'docunext/closetag.vim'
Bundle 'majutsushi/tagbar'
Bundle 'suan/vim-instant-markdown'
Bundle 'xolox/vim-pyref'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/mru.vim'
Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'vim-scripts/compview'
Bundle 'vim-scripts/writebackup'
Bundle 'vim-scripts/utl.vim'
Bundle 'vim-scripts/buftabs'
Bundle 'vim-scripts/CSApprox'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'kien/tabman.vim'
Bundle 'xolox/vim-shell'
Bundle 'sjl/gundo.vim'
Bundle 'dradtke/VIP'
Bundle 'mattn/zencoding-vim'
Bundle 'gregsexton/MatchTag'
Bundle 'itspriddle/vim-jquery'
Bundle 'klen/python-mode'
Bundle 'kchmck/vim-coffee-script'
"Bundle 'ervandew/supertab'
"Bundle 'ivanov/vim-ipython'
"Bundle 'vim-scripts/AutoComplPop'
"Bundle 'vim-scripts/Conque-Shell'
"Bundle 'gregsexton/gitv'
"Bundle 'vim-scripts/ZoomWin'

filetype plugin indent on     " required!

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed.
"
"let verbose = 1
set hidden
"UTF-8 als Default-Encoding
set enc=utf-8

" Completion settings in insertmode
set complete=.,w,b,t,i
" TODO
set completeopt=menuone,longest,preview
"autocmd FileType python set omnifunc=pythoncomplete#Complete
set pumheight=12
" -------------------------------------------------------

" ##### ropevim #####

" Rope AutoComplete
"let ropevim_vim_completion=1
let ropevim_extended_complete=1
let g:pymode_rope_always_show_complete_menu = 1
let g:ropevim_autoimport_modules = ["os.*","traceback","django.*", "xml.etree"]

let g:pymode_lint_cwindow = 1

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>

" open/close the quickfix window (not working!)
nmap <leader>f :copen<CR>
nmap <leader>fc :cclose<CR>

" close preview window automatically when we move around
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ##### tagbar #####

let g:tagbar_autoshowtag = 1
let g:tagbar_width = 30
"autocmd FileType * nested :call tagbar#autoopen(0)

" ==========================================================
" Javascript
" ==========================================================
au BufRead *.js set makeprg=jslint\ %

" Use tab to scroll through autocomplete menus ---- this prevents snipmate to
" work
"autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"

" ##### coffeescript #####

au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" compile on save
au BufWritePost *.coffee silent CoffeeMake!


let g:acp_completeoptPreview=1

" ###### GENERAL SETTINGS ######
"
filetype plugin on
syntax enable
set title
set nocompatible
set autoread
set confirm
set scrolloff=3
set nu
set showmode
set mouse=a
set wrap
set showmatch

let mapleader = ","

if &term =~ '^\(xterm\|screen\)$' && $COLORTERM == 'gnome-terminal'
    set t_Co=256
    "colorscheme wombat256i
endif
set t_Co=256
colorscheme blackboard

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
imap <c-s> <Esc><c-s>

nmap <c-q> :q<CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter,InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

if has('statusline')
    set laststatus=2
" Broken down into easily includeable segments
    set statusline=%<%f\   " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
                                " selected characters/lines in visual mode
endif

" ###### PERSISTENT UNDO ######
"
set undodir=~/Dropbox/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
" ----------------------------------------------------------------------------

" don't know why, but deleting a buffer deletes vim
"
function! JustDeleteBuffer()
    let curbuf = bufnr("%")
    exe "bp"
    exe "bd " curbuf
endfunction

map <leader>q :call JustDeleteBuffer()<cr>
" ----------------------------------------

"  ###### INDENTATION AND TAB OPTIONS ######

" never change tabstop from default(8), only change shiftwidth and
" softtabstop!
set softtabstop=4
set shiftwidth=4

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific
set autoindent
set smartindent

" Tab converted to spaces
set expandtab

" when at 3 spaces, and I hit > ... go to 4, not 7
set shiftround

set smarttab

" ###### FOLDING OPTIONS ######

" These commands open folds
"set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" automatically fold code depending on syntax highlighing
set foldmethod=indent
set fillchars=vert:\|,fold:\ ,diff:-

set foldlevel=3
set foldnestmax=3
set foldcolumn=2

" ###### MOVEMENT ######

" --- General Movement
" Easy switch between windows
nmap <tab><tab> <C-w>w

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" jump to last cursor position when opening files
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" backspace and cursor can go lines up or down
"set whichwrap+=h,l

" add < > to chars that form pairs (see % command)
set matchpairs+=<:>

" Enable error files & error jumping
"set cf

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" ###### SEARCH OPTIONS
"
" Highlight searches
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set incsearch

" ###### COMPLETION ######

" Better command-line completion
set wildmenu
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov
set wildmode=list:longest


let python_highlight_all = 1

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" ######  MAPPINGS  ######

noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>

nnoremap <F5> :buffers<CR>:buffer<Space>

command -nargs=? -bang  BB  if <q-args> != '' | exe 'buffer '.<q-args> | else | ls<bang> | let buffer_nn=input('Which one: ') | if buffer_nn != '' | exe buffer_nn != 0 ? 'buffer '.buffer_nn : 'enew' | endif | endif

" window navigation
map <c-j> <C-W>j
map <c-k> <C-W>k
map <c-l> <C-W>l
map <c-h> <C-W>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode ) not working!
"imap <C-W> <C-O><C-W>

" vim-utl
nmap <leader>y :Utl ol<cr>
nmap <Leader>uhs :let g:utl_cfg_hdl_scm_http=g:utl_cfg_hdl_scm_http_system<cr>
nmap <Leader>uhw :let g:utl_cfg_hdl_scm_http=g:utl_cfg_hdl_scm_http__wget<cr>


"inoremap <Leader>o <C-o>:Open<CR>
nnoremap <Leader>o :Open<CR>

map <leader>w :set wrap<cr>

map ,,, <esc>:b /home/gerald/Dropbox/outline/vot.otl<cr>zM

" Ack
map <leader>a :exec "Ack! ".expand("<cword>")<cr>

" TagList
map <leader>tl :TagbarToggle<CR>

"TaskList
map <leader>td <Plug>TaskList

" ###### NerdTree and NerdTreeTabs ######
"
map <leader>nt :NERDTreeMirrorToggle<cr>
map <leader>tt :NERDTreeTabsToggle<cr>
"
let g:NERDTreeWinSize=25
let g:nerdtree_tabs_open_on_gui_startup = 0

" for outlining
map <space> za

" fugitive
if has ("autocmd")
autocmd User fugitive if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' | nnoremap <buffer> .. :edit %:h<CR> endif
"autocmd BufReadPost fugitive://* set bufhidden=delete
endif

set wildchar=<Tab> wildmenu wildmode=full

set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" while wrapping lines move screen-linewise
nnoremap j gj
nnoremap k gk

" Copy Paste
map <leader>p "+p
cmap <leader>p <C-R>+
vnoremap <leader>y "+y

" disable search highlighting til next search
nnoremap <silent> <leader>h :noh<CR><C-l>

" additional esc's for ins mode.
" note: ctrl [ or ctrl c work also as esc
"inoremap kj <esc>
"inoremap jk <esc>

" ############  PLUGIN SETTINGS  ############
"
" ###### dbext ######
"let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd=taxi173:dbname=vimdb'

" ####### ConqueTerm ############
"let g:ConqueTerm_Color = 2
"let g:ConqueTerm_CWInsert = 1
"let g:ConqueTerm_ExecFileKey = '<F4>'
"let g:ConqueTerm_SendFileKey = '<F6>'

" ###### utl ######
"
" systems http client
let g:utl_cfg_hdl_scm_http_system = "!xdg-open %u"
" let g:utl_cfg_hdl_scm_http_system = "silent !firefox -remote 'ping()' && firefox -remote 'openURL( %u#%f )' || firefox '%u#%f' &"
"
" pdf handler
let g:utl_cfg_hdl_mt_application_pdf = ':silent !evince %p &'

"nmap <Leader>uhs :let g:utl_cfg_hdl_scm_http=g:utl_cfg_hdl_scm_http_system<cr>
"nmap <Leader>uhw :let g:utl_cfg_hdl_scm_http=g:utl_cfg_hdl_scm_http__wget<cr>
" [id=utl_cfg_hdl_scm_http__wget]
let g:utl_cfg_hdl_scm_http__wget="call Utl_if_hdl_scm_http__wget('%u')"
"
" mailto handler
let g:utl_cfg_hdl_scm_mailto = "silent !thunderbird '%u' &"
"
" ###### buftabs: inobtrusive tab-like buffer switching ######
"
let g:buftabs_only_basename=1

" ###### Ack ######
"
let g:ackhighlight=1
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Vim commands for creating and deleting folds are not very useful and are
"potentially dangerous when typed accidentally.
" Disable commands for creating and deleting folds.
noremap zf <Nop>
noremap zF <Nop>
noremap zd <Nop>
noremap zD <Nop>
noremap zE <Nop>

" ############ END PLUGINS ############
"

" ###### php Plugin ######
"
function! OpenPhpFunction (keyword)
  let proc_keyword = substitute(a:keyword , '_', '-', 'g')
  " create new preview split or switch to existing.
  "   vim has a Preview split which is a singleton,
  "   one per tab. This is perfect for repeated
  "   uses of the manual feature.
  " for some reason, I was getting errors
  " when trying to open a preview window.
  " but I'm unable to reproduce. Who knows...
  " try opening a new preview window.
  try
    exe 'pedit'
    " sometimes seems to throw an error
  catch /.*/
  endtry
  " switch to the preview
  exe 'wincmd P'
  " edit a new buffer
  exe 'enew'

  " don't associate any file or swap file
  " with this buffer. http://vim.wikia.com/wiki/VimTip135
  " the first command automatically names
  " the buffer [Scratch]. We could use this
  " to reuse the scratch window.
  exe "set buftype=nofile"
  exe "setlocal noswapfile"

  "call browser and fetch the file. we use lynx here.
  "php actually has a great script that fetches
  "info on lots of things other than functions.
  "so let it do its thing.
  exe 'silent r!lynx -dump -nolist http://php.net/'.proc_keyword

  " now we format the results:
  " enter normal mode and go to top of manual entry
  exe 'norm gg'
  " 1. this was given by original author
  "    at http://vim.wikia.com/wiki/PHP_online_help
  "    Problem: doesn't search far enough down the page
  "    exe 'call search ("' . a:keyword .'")'
  " 2. I came up with this to remove stuff at top of
  "    file for function retrievals.
  "    Idea: search down to Description. Then go up 8 lines.
  "    Problem: doesn't work for non-function man pages.
  "    exe 'call search("Description")'
  "    exe 'norm 8kdgg'
  " 3. Best idea so far: search down to a really long underscore.
  "    This will be the search box if your underscore is short.
  "    If it's long enough, you'll match on the horizontal line
  "    that is above the definition we really want.
  exe 'call search("____________________________________")'
  exe 'norm dgg'
  " delete the user notes at the bottom. it's a lot of text,
  " and they are almost completely useless.
  exe 'call search("User Contributed Notes")'
  exe 'norm dGgg'
endfunction

" manual lookup is mapped to ctrl-p
" ctrl-o is used to jump out of insert mode for one command.
" - jump out for one command <C-O>
" - call OpenPhpFunction with the word under cursor
" - CR seems to indicate end of fcn call
" - <C-O> again - we are in insert mode in the man page
" - this time, we jump back to previous window.
" - at the end of the day, we are still in insert mode,
"   the cursor is in exactly the same spot, and the man
"   page for php is visible
"inoremap <C-p> <C-O>:call OpenPhpFunction('<c-r><c-w>')<CR><C-O>:wincmd p<CR>
"nnoremap <C-p> :call OpenPhpFunction('<c-r><c-w>')<CR>:wincmd p<CR>
"vnoremap <C-p> :call OpenPhpFunction('<c-r><c-w>')<CR>:wincmd p<CR>
syntax on

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

"""""""""" HASKELL """"""""""""""

" You may already have the following two on, please check
syntax on
filetype plugin on

" This assumes that ghc is in your path, if it is not, or you
" wish to use a specific version of ghc, then please change
" the ghc below to a full path to the correct one
au BufEnter *.hs compiler ghc

" For this section both of these should be set to your
" browser and ghc of choice, I used the following
" two vim lines to get those paths:
" :r!which google-chrome
" :r!which ghc
let g:haddock_browser = "/usr/bin/firefox"
let g:ghc = "/usr/bin/ghc"
let g:haddock_docdir = "/usr/share/doc/ghc-doc/html/"

fun! RangerChooser()
  exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
  if filereadable('/tmp/chosenfile')
    exec 'edit ' . system('cat /tmp/chosenfile')
    call system('rm /tmp/chosenfile')
  endif
  redraw!
endfun
map <leader>r :call RangerChooser()<CR>
