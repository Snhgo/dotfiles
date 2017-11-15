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
nnoremap <C-h> 0
nnoremap <C-l> $
vnoremap <C-h> 0
vnoremap <C-l> $

" neoterm
nnoremap <silent> ,rc :TREPLSendFile<cr>
nnoremap <silent> ,rl :TREPLSendLine<cr>
vnoremap <silent> ,rl :TREPLSendSelection<cr>
nnoremap <silent> <Space>t :Ttoggle<cr><C-w>ji
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

nnoremap [nerdtree] <Nop>
nmap <Space>n [nerdtree]
nnoremap <silent>[nerdtree]n :NERDTreeToggle<CR>
nnoremap <silent>[nerdtree]f :NERDTreeFind<CR>

" git
nnoremap [fugitive] <Nop>
nmap <Space>g [fugitive]
nnoremap <silent> [fugitive]s :<C-u>Gstatus<CR>
nnoremap <silent> [fugitive]d :<C-u>Gdiff<CR>
nnoremap <silent> [fugitive]b :<C-u>Gblame<CR>
nnoremap <silent> [figitive]l :<C-u>Glog<CR>

" denite
nmap [denite] <Nop>
map <Space>d [denite]
nmap <silent> [denite]f :<C-u>Denite file_rec<CR>
nmap <silent> [denite]l :<C-u>Denite line<CR>
nmap <silent> [denite]g :<C-u>Denite grep<CR>
nmap <silent> [denite]u :<C-u>Denite file_mru<CR>
nmap <silent> [denite]t :<C-u>Denite filetype<CR>
nmap <silent> [denite]y :<C-u>Denite neoyank<CR>
nmap <silent> [denite]r :<C-u>Denite -resume<CR>
nmap <silent> [denite]d :<C-u>Denite directory_rec -default-action=cd<CR>

" denite-all
nmap [dn-all] <Nop>
map <Space>a [dn-all]
nmap <silent> [dn-all]f :<C-u>DeniteProjectDir file_rec<CR>
nmap <silent> [dn-all]l :<C-u>DeniteProjectDir line<CR>
nmap <silent> [dn-all]g :<C-u>DeniteProjectDir grep<CR>
nmap <silent> [dn-all]d :<C-u>DeniteProjectDir directory_rec -default-action=cd<CR>

" denite-preview
nmap [dn-pv] <Nop>
map <Space>p [dn-pv]
nmap <silent> [dn-pv]f :<C-u>Denite -auto_preview file_rec<CR>
nmap <silent> [dn-pv]l :<C-u>Denite -auto_preview line<CR>
nmap <silent> [dn-pv]g :<C-u>Denite -auto_preview grep<CR>
nmap <silent> [dn-pv]u :<C-u>Denite -auto_preview file_mru<CR>

" denite-word
nmap [dn-word] <Nop>
map <Space>w [dn-word]
nmap <silent> [dn-word]f :<C-u>DeniteCursorWord -auto_preview file_rec<CR>
nmap <silent> [dn-word]l :<C-u>DeniteCursorWord -auto_preview line<CR>
nmap <silent> [dn-word]g :<C-u>DeniteCursorWord -auto_preview grep<CR>

" 補完周り
imap <expr><TAB> pumvisible() ? "\<C-N>" : neosnippet#jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" tagbar
nnoremap <silent> <C-m> :TagbarToggle<CR>
vnoremap <silent> <C-m> :TagbarToggle<CR>

" GNU Global
nmap [Gtags] <Nop>
map <Space>b [Gtags]
nmap <silent> [Gtags]b :<C-u>exe("Gtags ".expand('<cword>'))<CR>
nmap <silent> [Gtags]r :<C-u>exe("Gtags -r ".expand('<cword>'))<CR>
nmap <silent> [Gtags]f :<C-u>exe("Gtags -f ".expand('<cword>'))<CR>
nmap <silent> [Gtags]l :<C-u>Gtags -f %<CR>
nmap <silent> [Gtags]c :<C-u>GtagsCursor<CR>
nmap <silent> [Gtags]g :<C-u>Gtags -g<CR>
noremap <C-j> :<C-u>cn<CR>
noremap <C-k> :<C-u>cp<CR>
noremap <C-c> :<C-u>cclose<CR>

