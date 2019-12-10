
nnoremap <silent> <Space>t :<C-u>call deol#new({'command': 'fish', 'start_insert': 0})<CR>
" nnoremap <silent> <Space>t :<C-u>Denite -buffer-name=deol -split=floating -cursor-pos=`tabpagenr()-1` deol<CR>
" nnoremap <silent><Space>t :<C-u>Deol -split=floating<CR>
" 【ESC】 ターミナルモードから抜ける
tnoremap <ESC>   <C-\><C-n>
tnoremap <silent> <C-q> <C-\><C-n>:q<cr>

imap <buffer> <C-c> <Plug>(deol_quit)

