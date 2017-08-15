inoremap <silent> <C-q> <ESC>
nnoremap <silent> <C-e> :NERDTreeTabsToggle<CR>
" 改行
nnoremap 0 :<C-u>call append(expand('.'), '')<Cr>j

" インサートモード時の移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" タブ移動
nnoremap <C-n> gt
nnoremap <C-p> gT

nnoremap ; :
nnoremap ; :

" neoterm
nnoremap <silent> ,rc :TREPLSendFile<cr>
nnoremap <silent> ,rl :TREPLSendLine<cr>
vnoremap <silent> ,rl :TREPLSendSelection<cr>
nnoremap <silent> vt :Ttoggle<cr>
nnoremap <silent> vs :terminal<cr>

" コメント
" 行の最初の文字の前にコメント文字をトグル
nnoremap <Leader>c <Plug>(caw:hatpos:toggle)
vnoremap <Leader>c <Plug>(caw:hatpos:toggle)
" 行頭にコメントをトグル
nnoremap <Leader>, <Plug>(caw:zeropos:toggle)
vnoremap <Leader>, <Plug>(caw:zeropos:toggle)

