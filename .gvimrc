colorscheme darkblue

"When the GUI starts, t_vb is reset to its default value.
"Reassert that no flash or beep is wanted.
"set visualbell t_vb=

" no menu/toolbar
set guioptions-=m
set guioptions-=T

" FOLDING
"set foldmethod=syntax
"highlight folded guibg=purple4 guifg=white

" color background of current line
"set cursorline
"set cursorcolumn
" change it to a color fitting to your theme :)
"highlight cursorline guibg=black
"highlight cursorcolumn guibg=black

"Color Visual Text Selection
"highlight Visual guibg=steelblue guifg=white

"au InsertEnter * hi iCursor guifg=black guibg=red
"au InsertLeave * hi Cursor guifg=black guibg=green

"highlight statusline guibg=black guifg=grey
"au InsertEnter * hi statusline guibg=darkred
"au InsertLeave * hi statusline guibg=black
