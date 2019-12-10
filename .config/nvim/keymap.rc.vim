inoremap <silent> <C-q> <ESC>
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

nnoremap <C-k> :bprev
nnoremap <C-j> :bnext


" nnoremap ; :
nnoremap <C-h> 0
nnoremap <C-l> $
vnoremap <C-h> 0
vnoremap <C-l> $

" バッファ
nnoremap <silent><C-j> :bp<CR>
nnoremap <silent><C-k> :bn<CR>

" neoterm
" nnoremap <silent> ,rc :TREPLSendFile<cr>
" nnoremap <silent> ,rl :TREPLSendLine<cr>
" vnoremap <silent> ,rl :TREPLSendSelection<cr>
" nnoremap <silent> <Space>t :Ttoggle<cr><C-w>ji
" nnoremap <silent> vs :terminal<cr>
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> <C-q> <C-\><C-n>:q<cr>
" pythonを実行
nnoremap @p :T python %<CR><C-w>j


" コメント
" 行の最初の文字の前にコメント文字をトグル
nmap <Space>c <Plug>(caw:hatpos:toggle)
vmap <Space>c <Plug>(caw:hatpos:toggle)
" 行頭にコメントをトグル
nmap <Space>, <Plug>(caw:zeropos:toggle)
vmap <Space>, <Plug>(caw:zeropos:toggle)

" git
nnoremap [fugitive] <Nop>
nmap <Space>g [fugitive]
nnoremap <silent> [fugitive]s :<C-u>Gstatus<CR>
nnoremap <silent> [fugitive]d :<C-u>Gdiff<CR>
nnoremap <silent> [fugitive]b :<C-u>Gblame<CR>
nnoremap <silent> [figitive]l :<C-u>Glog<CR>

" 補完周り
imap <expr><TAB> pumvisible() ? "\<C-N>" : neosnippet#jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

runtime! plugins/denite-keymap.rc.vim

