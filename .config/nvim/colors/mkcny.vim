runtime colors/grb256.vim

let g:colors_name = "mkcny"

hi clear SignColumn
hi SignColumn ctermbg=8
hi GitGutterAdd ctermbg=8 ctermfg=LightGreen
hi GitGutterChange ctermbg=8 ctermfg=Yellow
hi GitGutterDelete ctermbg=8 ctermfg=Red
" not sure when this is used
" hi GitGutterChangeDelete
hi ColorColumn ctermbg=black
hi StatusLine ctermbg=black ctermfg=grey
hi VertSplit ctermbg=NONE ctermfg=black

se fillchars+=vert:\│
