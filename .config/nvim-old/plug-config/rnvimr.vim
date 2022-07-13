" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1
let g:rnvimr_enable_picker = 1
let g:rnvim_draw_border = 1

highlight link RnvimrNormal CursorLine

nmap <space>r :RnvimrToggle<CR>
