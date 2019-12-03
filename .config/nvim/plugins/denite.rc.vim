
" nmap [denite] <Nop>
" map <Space>d [denite]
"
" nnoremap <silent> [denite]a :<C-u>Denite file buffer -split=floating file:new<CR>
" " 【Ctrl + d + b】 バッファを表示
" nnoremap <silent> [denite]b :<C-u>Denite buffer -split=floating file:new<CR>
" " 【Ctrl + d + f】 カレントディレクトリを表示
" nnoremap <silent> [denite]f :<C-u>Denite file -split=floating file:new<CR>
" " 【Ctrl + d + r】 カレントディレクトリ以下を再帰的に表示
" nnoremap <silent> [denite]r :<C-u>Denite file/rec -split=floating file:new<CR>
" " 【Ctrl + d + gr】 カレントディレクトリ以下のファイルから指定した文字列を検索
" nnoremap <silent> [denite]gr :<C-u>Denite grep -buffer-name=search<CR>
" " 【Ctrl + d + ,】 カレントディレクトリ以下のファイルからカーソル下の文字列を検索
" nnoremap <silent> [denite], :<C-u>DeniteCursorWord grep -buffer-name=search line<CR>
" " 【Ctrl + d + gs】 grepした結果を再表示
" nnoremap <silent><C-d>gs :<C-u>Denite -resume -buffer-name=search<CR>
" " 【Ctrl + d + c】 Neovim内で実行したコマンドを表示
" nnoremap <silent><C-d>c :<C-u>Denite command_history -split=floating<CR>
"
" nmap <silent> [denite]g :<C-u>Denite grep<CR>
"
" autocmd FileType denite call s:denite_my_settings()
" function! s:denite_my_settings() abort
"   nnoremap <silent><buffer><expr> <CR>
"  \ denite#do_map('do_action')
"   " 【o】 ファイルを開く
"   nnoremap <silent><buffer><expr> o
"  \ denite#do_map('do_action')
"   " 【s】 ウィンドウを水平分割してファイルを開く
"   nnoremap <silent><buffer><expr> s
"  \ denite#do_map('do_action', 'split')
"   " 【v】 ウィンドウを垂直分割してファイルを開く
"   nnoremap <silent><buffer><expr> v
"  \ denite#do_map('do_action', 'vsplit')
"   " 【d】 ファイルを削除する
"   nnoremap <silent><buffer><expr> d
"  \ denite#do_map('do_action', 'delete')
"   " 【p】 ファイルをプレビュー画面で開く
"   nnoremap <silent><buffer><expr> p
"  \ denite#do_map('do_action', 'preview')
"   " 【ESC】 / 【q】 denite.nvimを終了する
"   nnoremap <silent><buffer><expr> <Esc>
"  \ denite#do_map('quit')
"   nnoremap <silent><buffer><expr> q
"  \ denite#do_map('quit')
"   " 【i】 ファイル名で検索する
"   nnoremap <silent><buffer><expr> i
"  \ denite#do_map('open_filter_buffer')
"   " 【SPACE】 ファイルを複数選択する
"   nnoremap <silent><buffer><expr> <Space>
"  \ denite#do_map('toggle_select').'j'
" endfunction
"
" use floating
let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7
let s:denite_default_options = {
   \ 'split': 'floating',
   \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
   \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
   \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
   \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
   \ 'highlight_filter_background': 'DeniteFilter',
   \ 'prompt': '$ ',
   \ 'start_filter': v:true,
   \ }
let s:denite_option_array = []
for [key, value] in items(s:denite_default_options)
  call add(s:denite_option_array, '-'.key.'='.value)
endfor
call denite#custom#option('default', s:denite_default_options)
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>')
call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabopen>', 'noremap')
call denite#custom#map('insert', '<C-q>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#option('default', 'prompt', '>')
if executable('rg')
  call denite#custom#var('file_rec', 'command',
       \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts',
       \ ['--vimgrep', '--no-heading'])
endif


