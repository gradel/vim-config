filetyp off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
filetype plugin on
syntax on

if &term =~ '^\(xterm\|screen\)$' && $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
set t_Co=256
colorscheme wombat256i

set nocompatible
set autoread
set confirm
set scrolloff=3

" set foldlevel=3
set nu
set showmode
set cursorline
set mouse=a
set wrap
set showmatch
set hidden

" --- Indentation Options

" never change tabstop from default(8), only change shiftwidth and
" softtabstop!

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific
set autoindent
set smartindent

" same (Spaces feel like Tabs)
set softtabstop=4
set shiftwidth=4

" Tab converted to spaces
set expandtab

" when at 3 spaces, and I hit > ... go to 4, not 7
set shiftround

set smarttab

" --- Folding Options

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" automatically fold code depending on syntax highlighing
set foldmethod=indent
set fillchars=vert:\|,fold:\ ,diff:-

" ##### MOVEMENT

" --- General Movement

" backspace and cursor can go lines up or down
set whichwrap+=h,l

" add < > to chars that form pairs (see % command)
set matchpairs+=<:>

" Enable error files & error jumping
set cf

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" --- Search Options

" Highlight searches
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set incsearch

" ##### COMPLETION

" Better command-line completion
set wildmenu
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov
set wildmode=list:longest

" Completion settings in insertmode
set complete=.,w,b,t,i
" TODO
set completeopt=menu,longest,preview
" set completeopt=menuone,longest,preview
" au FileType python set omnifunc=pythoncomplete#Complete
" let g:SuperTabDefaultCompletionType = \"context\"

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

let mapleader = ","

" ##### general mappings

" save with strg-a
map <c-a> <esc>:w<cr>
imap <c-a> <esc>:w<cr>

map <leader>sw :set wrap<cr>

" buffer navigation
map <c-n> :bn!<cr>
map <c-b> :bp!<cr>
noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>

nnoremap <F5> :buffers<CR>:buffer<Space>

command -nargs=? -bang  Buffer  if <q-args> != '' | exe 'buffer '.<q-args> | else | ls<bang> | let buffer_nn=input('Which one: ') | if buffer_nn != '' | exe buffer_nn != 0 ? 'buffer '.buffer_nn : 'enew' | endif | endif

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

" disable search highlighting till next search
nnoremap <silent> <leader>h :noh<CR><C-l>

" additional esc's for ins mode.
" note: ctrl [ or ctrl c work also as esc
inoremap kj <esc>
inoremap jk <esc>

" faster viewport moving
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" ##### PLUGIN SETTINGS
"
" Settings
"
" FuzzyFinder
let g:fuf_modesDisable = [ 'mrufile', 'mrucmd', ]

" tabman: side bar tab-and buffer-manager
let g:tabman_width = 25
let g:tabman_specials = 1

" buftabs: inobtrusive tab-like buffer switching
let g:buftabs_only_basename=1

let g:nerdtree_tabs_open_on_console_startup = 1

" NerdTree
let g:NERDTreeWinSize=25

" Ack
let g:ackhighlight=1
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" jslint
let g:JSLintHighlightErrorLine = 0
set makeprg=jsl\ -nologo\ -nofilelisting\ -nosummary\ -nocontext\ -conf\ '/etc/jsl.conf'\ -process\ %
"set errorformat=%f(%l):\ %m

setlocal makeprg=jslint\ %
setlocal errorformat=%-P%f,
                    \%-G/*jslint\ %.%#*/,
                    \%*[\ ]%n\ %l\\,%c:\ %m,
                    \%-G\ \ \ \ %.%#,
                    \%-GNo\ errors\ found.,
                    \%-Q

" Mappings
"
" Ack
map <silent> <leader>a :exec "Ack! ".expand("<cword>")<cr>

" FuzzyFinder
map <leader>fj :FufCoverageFile<cr>
map <leader>ff :FufFile<cr>
map <leader>fc :FufFileWithCurrentBufferDir<cr>
map <leader>fh :FufHelp<cr>
map <leader>fb :FufBuffer<cr>
map <leader>fd :FufDir<cr>
map <leader>ft :FufTag<cr>
map <leader>fa :FufBufferTagAll<cr>

" TagList
map <leader>tl :TlistToggle<CR>

"TaskList
map <leader>td <Plug>TaskList

" NerdTree and NerdTreeTabs
map <leader>nt :NERDTreeMirrorToggle<cr>
map <leader>tt :NERDTreeTabsToggle<cr>

" jslint
" make F10 call make for linting etc.
inoremap <silent> <F10> <C-O>:make<CR>
map <silent> <F10> :make<CR>
nmap <F4> :w<CR>:make<CR>:cw<CR>
map <space> za
set foldnestmax=2
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <leader>w <c-w><c-w>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter,InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" UTF-8 als Default-Encoding
" set enc=utf-8

if has('statusline')
    set laststatus=2
" Broken down into easily includeable segments
    set statusline=%<%f\   " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=\ [%{&ff}/%Y]            " filetype
"     set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{getcwd()}]          " current dir
"set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
                                " selected characters/lines in visual mode
endif

let pymode_rope_vim_completion=1
let pymode_rope_extended_complete=1
let pymode_options_other=0

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
inoremap <C-p> <C-O>:call OpenPhpFunction('<c-r><c-w>')<CR><C-O>:wincmd p<CR>
nnoremap <C-p> :call OpenPhpFunction('<c-r><c-w>')<CR>:wincmd p<CR>
vnoremap <C-p> :call OpenPhpFunction('<c-r><c-w>')<CR>:wincmd p<CR>

