augroup denite_settings_g
  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
   \ denite#do_map('do_action')
    " 【o】 ファイルを開く
    nnoremap <silent><buffer><expr> o denite#do_map('do_action')
    " 【s】 ウィンドウを水平分割してファイルを開く
    nnoremap <silent><buffer><expr> s denite#do_map('do_action', 'split')
    " 【v】 ウィンドウを垂直分割してファイルを開く
    nnoremap <silent><buffer><expr> v denite#do_map('do_action', 'vsplit')
    " 【d】 ファイルを削除する
    nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
    " 【p】 ファイルをプレビュー画面で開く
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
    " 【ESC】 / 【q】 denite.nvimを終了する
    nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
    nnoremap <silent><buffer><expr> <C-q> denite#do_map('quit')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    " 【i】 ファイル名で検索する
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    " 【SPACE】 ファイルを複数選択する
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'

  endfunction

  autocmd FileType denite-filter call s:denite_filter_settings()
  function! s:denite_filter_settings() abort
    imap <silent><buffer> <C-f> <Plug>(denite_filter_quit)
    " <CR>でカーソルのあるファイルorディレクトリを開く
    imap <silent><buffer> <CR> <Plug>(denite_filter_quit)<CR>
    imap <silent><buffer> <C-q> <Plug>(denite_filter_quit)q
  endfunction

augroup END


" denite
nmap [denite] <Nop>
map <Space>d [denite]
nmap <silent> [denite]f :<C-u>Denite file/rec<CR>
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

" denite-word
nmap [dn-word] <Nop>
map <Space>w [dn-word]
nmap <silent> [dn-word]f :<C-u>DeniteCursorWord -auto_preview file_rec<CR>
nmap <silent> [dn-word]l :<C-u>DeniteCursorWord -auto_preview line<CR>
nmap <silent> [dn-word]g :<C-u>DeniteCursorWord -auto_preview grep<CR>


