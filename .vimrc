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
    Bundle "jamessan/vim-gnupg"
    Bundle 'davidhalter/jedi-vim'
    Bundle 'aereal/jscomplete-vim'
    Bundle 'Shutnik/jshint2.vim'
    Bundle 'myhere/vim-nodejs-complete'
    Bundle 'pbrisbin/html-template-syntax'
    Bundle 'docunext/closetag.vim'
    Bundle 'majutsushi/tagbar'
    Bundle 'suan/vim-instant-markdown'
    Bundle 'xolox/vim-misc'
    Bundle 'Rykka/riv.vim'
    Bundle 'Rykka/InstantRst'
    Bundle 'xolox/vim-notes'
    Bundle 'xolox/vim-pyref'
    "Bundle 'xolox/vim-shell'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-unimpaired'
    Bundle 'tpope/vim-jdaddy'
    Bundle 'vim-scripts/L9'
    Bundle 'vim-scripts/mru.vim'
    Bundle 'vim-scripts/The-NERD-Commenter'
    Bundle 'vim-scripts/TaskList.vim'
    Bundle 'vim-scripts/writebackup'
    Bundle 'vim-scripts/utl.vim'
    Bundle 'vim-scripts/CSApprox'
    Bundle 'scrooloose/nerdtree'
    Bundle 'vim-syntastic/syntastic'
    Bundle 'jistr/vim-nerdtree-tabs'
    Bundle 'kien/rainbow_parentheses.vim'
    Bundle 'kien/tabman.vim'
    Bundle 'sjl/gundo.vim'
    Bundle 'matchit.zip'
    Bundle 'mattn/emmet-vim'
    Bundle 'mattn/calendar-vim'
    Bundle 'gregsexton/MatchTag'
    Bundle 'itspriddle/vim-jquery'
    Bundle 'kchmck/vim-coffee-script'
    Bundle 'ervandew/supertab'
    Bundle 'ivanov/vim-ipython'
    Bundle 'bling/vim-airline'
    Bundle 'vim-scripts/buftabs'
    Bundle 'vimoutliner/vimoutliner'
    "Bundle 'vimwiki/vimwiki'
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

" ==============
" local settings
" ==============

if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

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

" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
    set t_Co=256
    colorscheme blackboard
else
    colorscheme darkblue
endif

set cursorline
highlight cursorline guibg=#333333

"let verbose = 1
set hidden
"UTF-8 als Default-Encoding
set enc=utf-8

imap jj <esc>

let wordUnderCursor = expand("<cword>")

" ===============
" leader commands
" ===============
"
map <leader>a :exec "Ggrep ".expand("<cword>")<cr>
" map <leader>a  viw"+yviw <esc> :Ggrep <leader>p <cr>

" =============
" simple saving
" =============
"
nmap <leader>m :w<CR>
imap <leader>m <Esc>:w<CR>

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
" nmap <leader><leader><leader> "*y

" ===============
" quickfix window
" ===============
"
" open/close the quickfix window
nmap <leader>f :copen<CR>
nmap <leader>fc :cclose<CR>

" disable search highlighting til next search
nnoremap <silent> <leader>h :noh<CR><C-l>

map <leader>tl :TagbarToggle<CR>
map <leader>td <Plug>TaskList

map <leader>nt :NERDTreeMirrorToggle<cr>
map <leader>tt :NERDTreeTabsToggle<cr>

" =====
" Gundo
" =====
nnoremap <leader>gu :GundoToggle<CR>

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
" vim-airline
" ===========

let g:airline_powerline_fonts = 1
set laststatus=2
" tabline prevents jedi completion popup display
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'

" ====
" misc
" ====
"
" add < > to chars that form pairs (see % command)
set matchpairs+=<:>

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

" center search
nmap n nzz
nmap N Nzz

" ===================================
" COMPLETION
" ===================================

" jedi
let g:jedi#use_tabs_not_buffers = 0

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = ("<c-n>")

"" Completion settings in insertmode
set complete=.,w,b,t,i
"" TODO
set completeopt=menu,longest,preview
set pumheight=12

" jscomplete

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
" vim-gnupg
" ========

let g:GPGPreferArmor=1
let g:GPGDefaultRecipients=["gerald@hien-online.de"]

" =========
" Syntastic
" =========

let g:syntastic_auto_loc_list=1

" au BufRead *.js set makeprg=jslint\ %
"
" python:

" Available checkers: flake8 pyflakes pep8 pylint python
" Use flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="W391,W503,E401,F403,E501,E701,E722,E241,E126,E127,E128,E113,E265"'

" =======
" tagbar
" =======

let g:tagbar_autoshowtag = 1
let g:tagbar_width = 35

" ========
" TaskList
" ========
"
let g:tlTokenList = ['FIX', 'todo', 'ToDo', 'TODO', 'XX']

" =========================
" NerdTree and NerdTreeTabs
" ========================
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

" ===
" Utl
" ===
"
" the use of silent clears my vim screen. Look also here:
" https://vi.stackexchange.com/questions/2809/silent-makes-my-vim-go-blank
" and :h :silent. CTRL-L has no effect (on my machine).
"
" handlers
"
let g:utl_cfg_hdl_mt_generic = "!xdg-open %p &"
let g:utl_cfg_hdl_scm_mailto = "silent !thunderbird '%u' &"
let g:utl_cfg_hdl_scm_http_system = "!firefox -remote 'ping()' && firefox -remote 'openURL( %u )' || firefox '%u#%f' &"
nmap <Leader>uhs :let g:utl_cfg_hdl_scm_http=g:utl_cfg_hdl_scm_http_system<cr>
nmap <Leader>uhw :let g:utl_cfg_hdl_scm_http=g:utl_cfg_hdl_scm_http__wget<cr>
" [id=utl_cfg_hdl_scm_http__wget]
"let g:utl_cfg_hdl_scm_http__wget="call Utl_if_hdl_scm_http__wget('%u')"
" pdf handler
" let g:utl_cfg_hdl_mt_application_pdf = '!evince %p &'
"
"
" mappings
"
nmap <leader>l :Utl<cr>
nmap <Leader>uhs :let g:utl_cfg_hdl_scm_http=g:utl_cfg_hdl_scm_http_system<cr>
nmap <Leader>uhw :let g:utl_cfg_hdl_scm_http=g:utl_cfg_hdl_scm_http__wget<cr>
"
" debug: 1
"
let utl_opt_verbose=0
"
" =======
" buftabs
" =======
"
let g:buftabs_only_basename=1

" ==========
" javascript
" ==========
"
au BufRead *.js set makeprg=jshint\ %
let jshint2_save = 1


" ============
" coffeescript
" ============

au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" compile on save
au BufWritePost *.coffee silent make!

" ==========
" make files
" =========
"
if has ("autocmd")
    autocmd filetype make setlocal noexpandtab
    autocmd filetype make setlocal nosmarttab
endif

" ======================
" restructured text reST
" ======================
"
augroup filetypedetect_rst
    au!
    " Headings
    au FileType rst nnoremap <leader>h1 ^yypv$r=o<cr><esc>
    au FileType rst inoremap <leader>h1 <esc>^yypv$r=o<cr>

    au FileType rst nnoremap <leader>h2 ^yypv$r-o<cr><cr><cr><cr><cr><cr><esc>kkkk
    au FileType rst inoremap <leader>h2 <esc>^yypv$r-o<cr><cr><cr><cr><cr><cr><esc>kkkki

    au FileType rst nnoremap <leader>h3 ^yypv$r+o<cr><cr><cr><cr><cr><cr><esc>kkkk
    au FileType rst inoremap <leader>h3 <esc>^yypv$r+o<cr><cr><cr><cr><cr><cr><esc>kkkki

    au FileType rst nnoremap <leader>h4 ^yypv$r~o<cr><cr><cr><cr><cr><cr><esc>kkkk
    au FileType rst inoremap <leader>h4 <esc>^yypv$r~o<cr><cr><cr><cr><cr><cr><esc>kkkki

    au FileType rst nnoremap <leader>h5 ^yypv$r*o<cr><cr><cr><cr><cr><cr><esc>kkkk
    au FileType rst inoremap <leader>h5 <esc>^yypv$r*o<cr><cr><cr><cr><cr><cr><esc>kkkki
    "
    """Make Link (ml)
    " Highlight a word or phrase and it creates a link and opens a split so
    " you can edit the url separately. Once you are done editing the link,
    " simply close that split.
    au FileType rst vnoremap <leader>cl yi`<esc>gvvlli`_<esc>:vsplit<cr><C-W>l:$<cr>o<cr>.. _<esc>pA: http://TODO<esc>vb
    """Make footnote (ml)
    au FileType rst iabbrev mfn [#]_<esc>:vsplit<cr><C-W>l:$<cr>o<cr>.. [#] TODO
    au FileType rst set spell
    "Create image
    au FileType rst iabbrev iii .. image:: TODO.png<cr>    :scale: 100<cr>:align: center<cr><esc>kkkeel
    "Create figure
    "au FileType rst iabbrev iif .. figure:: TODO.png<cr>    :scale: 100<cr>:align: center<cr>:alt: TODO<cr><cr><cr>Some brief description<esc>kkkeel

    "Create note
    au FileType rst iabbrev nnn .. note:: 
    "Start or end bold text inline
    au FileType rst inoremap <leader>bb **
    "Start or end italicized text inline
    au FileType rst inoremap <leader>ii *
    "Start or end preformatted text inline
    au FileType rst inoremap <leader>pf ``

    " Fold settings
    "au FileType rst set foldmethod=marker

    " Admonitions
    au FileType rst iabbrev adw .. warning::
    au FileType rst iabbrev adn .. note::
augroup END

" vim-wiki
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_tags': 1}]

""""""""""
" calendar
""""""""""
"
let g:calendar_monday = 1

" inlude personal stuff
if has ("autocmd")
    try
        source ~/.vim/custom-vimrc
    catch
    endtry
endif

let g:syntastic_rst_checkers = ['sphinx']
