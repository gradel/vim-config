" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    filetype off " required until end of vundle section
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required!
    Bundle 'gmarik/vundle'

    " My Bundles here:
    "
    " original repos on github
    Bundle "waylan/vim-markdown-extra-preview"
    Bundle 'davidhalter/jedi-vim'
    Bundle 'teramako/jscomplete-vim'
    Bundle 'myhere/vim-nodejs-complete'
    Bundle 'pbrisbin/html-template-syntax'
    Bundle 'docunext/closetag.vim'
    Bundle 'majutsushi/tagbar'
    Bundle 'suan/vim-instant-markdown'
    Bundle 'xolox/vim-misc'
    Bundle 'xolox/vim-notes'
    Bundle 'xolox/vim-pyref'
    Bundle 'xolox/vim-shell'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-unimpaired'
    Bundle 'vim-scripts/L9'
    Bundle 'vim-scripts/mru.vim'
    Bundle 'vim-scripts/The-NERD-Commenter'
    Bundle 'vim-scripts/TaskList.vim'
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
    Bundle 'sjl/gundo.vim'
    Bundle 'mattn/zencoding-vim'
    " XML/HTML tags navigation
    Bundle 'matchit.zip'
    Bundle 'gregsexton/MatchTag'
    Bundle 'itspriddle/vim-jquery'
    Bundle 'klen/python-mode'
    Bundle 'kchmck/vim-coffee-script'
    Bundle 'Rykka/riv.vim'
    Bundle 'curist/ConqueTerm'
    "Bundle 'lambdalisue/vim-django-support'
    Bundle 'ervandew/supertab'
    Bundle 'ivanov/vim-ipython'
    "Bundle 'vim-scripts/AutoComplPop'
    "Bundle 'gregsexton/gitv'
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end

" NOTE: comments after Bundle command are not allowed.

filetype plugin indent on     " required!

set nocompatible               " be iMproved
"
" ===================================
" GENERAL SETTINGS
" ===================================
"
filetype plugin on
filetype on
syntax enable
syntax on
let python_highlight_all = 1
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

set t_Co=256
colorscheme blackboard
set cursorline
highlight cursorline guibg=#333333

"let verbose = 1
set hidden
"UTF-8 als Default-Encoding
set enc=utf-8

imap jj <esc>

map <leader>a :exec "Ggrep ".expand("<cword>")<cr>

let wordUnderCursor = expand("<cword>")

" =============
" simple saving
" =============
"
nmap <leader>m :w<CR>
imap <leader>m <Esc>:w<CR>

" ========================
" show trailing whitespace
" ========================
"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter,InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" ==========================
" Delete trailing whitespace
" ==========================

"fun! <SID>StripTrailingWhitespaces()
    "let l = line(".")
    "let c = col(".")
    "%s/\s\+$//e
    "call cursor(l, c)
"endfun

"autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" ===========
" status line
" ===========
"
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

" ====
" misc
" ====
"
" add < > to chars that form pairs (see % command)
set matchpairs+=<:>

nnoremap <Leader>o :Open<CR>
map <leader>w :set wrap<cr>

" ==============
" copy and paste
" ==============
"
map <leader>p "+p
cmap <leader>p <C-R>+
vnoremap <leader>y "+y

nmap <leader><leader> viw"+yviw

" ===============
" quickfix window
" ===============
"
" open/close the quickfix window
nmap <leader>f :copen<CR>
nmap <leader>fc :cclose<CR>

" close preview window automatically when we move around
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ================================================
" INDENTATION AND TAB OPTIONS
" ================================================

" never change tabstop from default(8), only change shiftwidth and
" softtabstop!
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
" Tab converted to spaces
set expandtab
" when at 3 spaces, and I hit > ... go to 4, not 7
set shiftround
set smarttab

" ================================================
" FOLDING OPTIONS
" ================================================

" These commands open folds
"set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" automatically fold code depending on syntax highlighing
set foldmethod=indent
set fillchars=vert:\|,fold:\ ,diff:-

set foldlevel=3
set foldnestmax=3
set foldcolumn=2

" Toggle folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" Vim commands for creating and deleting folds are not very useful and are
"potentially dangerous when typed accidentally.
" Disable commands for creating and deleting folds.
noremap zf <Nop>
noremap zF <Nop>
noremap zd <Nop>
noremap zD <Nop>
noremap zE <Nop>

" ================================================
" buffer, file and cursor movement
" ================================================

" window navigation
map <c-j> <C-W>j
map <c-k> <C-W>k
map <c-l> <C-W>l
map <c-h> <C-W>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode ) not working!
"imap <C-W> <C-O><C-W>

" Easy switch between windows
nmap <tab><tab> <C-w>w

" while wrapping lines move screen-linewise
nnoremap j gj
nnoremap k gk

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" make tab in v mode ident code
vnoremap <tab> >gv
vnoremap <s-tab> <gv

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

" switch buffers
noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>

command -nargs=? -bang  BB  if <q-args> != '' | exe 'buffer '.<q-args> | else | ls<bang> | let buffer_nn=input('Which one: ') | if buffer_nn != '' | exe buffer_nn != 0 ? 'buffer '.buffer_nn : 'enew' | endif | endif

set wildchar=<Tab> wildmenu wildmode=full

" backspace and cursor can go lines up or down
"set whichwrap+=h,l

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" ===================================
" SEARCH OPTIONS
" ===================================
"
" Highlight searches
set hlsearch
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set incsearch
" disable search highlighting til next search
nnoremap <silent> <leader>h :noh<CR><C-l>

" center search
nmap n nzz
nmap N Nzz

" ===================================
" COMPLETION
" ===================================

" jedi
let g:jedi#use_tabs_not_buffers = 0

let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = ("<c-x><c-n>")

"" Completion settings in insertmode
set complete=.,w,b,t,i
"" TODO
set completeopt=menuone,longest,preview
set pumheight=12

let g:nodejs_complete_config = {
\  'js_compl_fn': 'jscomplete#CompleteJS',
\  'max_node_compl_len': 15
\}

set wildmenu
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov
set wildmode=list:longest

" ==============================================
" PLUGIN SETTINGS
" ==============================================

" =========
" vim-notes
" =========
"

let g:notes_directories = ['~/Dropbox/vim-notes',]
let g:notes_tab_indents = 0
let g:notes_tagsindex   = '~/Dropbox/vim-notes-tags'

" =======
" tagbar
" =======

let g:tagbar_autoshowtag = 1
let g:tagbar_width = 35

map <leader>tl :TagbarToggle<CR>

" ========
" TaskList
" ========
"
map <leader>td <Plug>TaskList
let g:tlTokenList = ['FIX', 'todo', 'ToDo', 'TODO', 'XX']

" =========================
" NerdTree and NerdTreeTabs
" ========================
"
map <leader>nt :NERDTreeMirrorToggle<cr>
map <leader>tt :NERDTreeTabsToggle<cr>
"
let g:NERDTreeWinSize=25
let g:nerdtree_tabs_open_on_gui_startup = 0

" ========
" fugitive
" ========
"
if has ("autocmd")
autocmd User fugitive if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' | nnoremap <buffer> .. :edit %:h<CR> endif
"autocmd BufReadPost fugitive://* set bufhidden=delete
endif

" =====
" Gundo
" =====
nnoremap <leader>gu :GundoToggle<CR>

" =======
" python-mode
" =======

" Rope AutoComplete
let g:pymode_lint_checker = "pyflakes,mccabe"
let g:ropevim_vim_completion=0
let g:ropevim_extended_complete=0
"let g:pymode_rope_always_show_complete_menu = 1
"let pymode_rope_autoimport_modules = ["os.*","traceback","django.*", "xml.etree", "abyss.*", "carrier.*", "magnet.*", "moonid.*", "payment.*"]
let g:pymode_lint_cwindow = 1
" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>
let g:pymode_run_key='R'

" Auto fix vim python paths if virtualenv enabled
let g:pymode_virtualenv = 1


" utl
" ===
"
" systems http client
let g:utl_cfg_hdl_scm_http_system = "!xdg-open %u"
" let g:utl_cfg_hdl_scm_http_system = "silent !firefox -remote 'ping()' && firefox -remote 'openURL( %u#%f )' || firefox '%u#%f' &"
" pdf handler
let g:utl_cfg_hdl_mt_application_pdf = ':silent !evince %p &'
" mailto handler
let g:utl_cfg_hdl_scm_mailto = "silent !thunderbird '%u' &"
"
"nmap <Leader>uhs :let g:utl_cfg_hdl_scm_http=g:utl_cfg_hdl_scm_http_system<cr>
"nmap <Leader>uhw :let g:utl_cfg_hdl_scm_http=g:utl_cfg_hdl_scm_http__wget<cr>
" [id=utl_cfg_hdl_scm_http__wget]
"let g:utl_cfg_hdl_scm_http__wget="call Utl_if_hdl_scm_http__wget('%u')"
"
nmap <leader>l :Utl ol<cr>
nmap <Leader>uhs :let g:utl_cfg_hdl_scm_http=g:utl_cfg_hdl_scm_http_system<cr>
nmap <Leader>uhw :let g:utl_cfg_hdl_scm_http=g:utl_cfg_hdl_scm_http__wget<cr>

" =======
" buftabs
" =======
"
let g:buftabs_only_basename=1

" ==========
" javascript
" ==========
"
au BufRead *.js set makeprg=jslint\ %

" ============
" coffeescript
" ============

au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" compile on save
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow

" ==========
" virtualenv
" ==========
"
" Add the virtualenv's site-packages to vim path
"
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

" ==================
" ranger filemanager
" ==================
"
fun! RangerChooser()
  exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
  if filereadable('/tmp/chosenfile')
    exec 'edit ' . system('cat /tmp/chosenfile')
    call system('rm /tmp/chosenfile')
  endif
  redraw!
endfun
map <leader>r :call RangerChooser()<CR>
