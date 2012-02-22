"colorscheme darkblue
set guifont=Ubuntu\ Mono\ 13
"When the GUI starts, t_vb is reset to its default value.
"Reassert that no flash or beep is wanted.
set visualbell t_vb=

" no toolbar
set guioptions-=T
set guioptions-=r

" Disable all blinking:
:set guicursor+=a:blinkon0
" Remove previous setting:
":set guicursor-=a:blinkon0
" Restore default setting:
":set guicursor&

set cursorline
" change it to a color fitting to your theme :)
highlight cursorline guibg=black

"highlight statusline guibg=black guifg=grey
au InsertEnter * hi statusline guibg=darkred
au InsertLeave * hi statusline guibg=black
