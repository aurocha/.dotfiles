set guifont=Monospace\ 12
colorscheme koehler
set number
set wrap linebreak

nmap <F3> i<C-R>=strftime("%a, %d %b %Y")<CR><Esc>
imap <F3> <C-R>=strftime("%a, %d %b %Y")<CR>
