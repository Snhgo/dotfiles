augroup denite_filter
  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
   \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
   \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
   \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
   \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
   \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
   \ denite#do_map('toggle_select').'j'
  endfunction
augroup END


" denite
nmap [denite] <Nop>
map <Space>d [denite]
nmap <silent> [denite]f :<C-u>Denite file\rec<CR>
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


