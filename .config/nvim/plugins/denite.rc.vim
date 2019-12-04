
hi Sample1 guibg=#8fbcbb

augroup NormalFloatBG
  autocmd!
  autocmd BufWinEnter * highlight NormalFloat guibg=gray
augroup END
" use floating
let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7
let s:denite_default_options = {
   \ 'split': 'floating',
   \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
   \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
   \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
   \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
   \ 'prompt': '$ ',
   \ 'start_filter': v:true,
   \ 'source_names': 'short',
   \ 'highlight_matched_char': 'WildMenu',
   \ 'highlight_preview_line': 'NormalFloat',
  \ 'highlight_matched_range': 'Visual',
  \ 'highlight_window_background': 'NormalFloat',
  \ 'highlight_filter_background': 'StatusLine',
  \ 'highlight_prompt': 'StatusLine',
  \ 'vertical_preview': 1,
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

" ripgrepがある場合
if executable('rg')
  call denite#custom#var('file/rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep', '--no-heading'])
else
  call denite#custom#var('file/rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

hi ActiveWindow guibg=#17252c
hi InactiveWindow guibg=#0D1B22
    hi Hoge guifg=#2e3440 guibg=#ebcb8b

augroup transparent-windows
  autocmd!
  autocmd FileType denite call s:denite_window_bg_setting()
  function! s:denite_window_bg_setting() abort
    set winblend=10
" Hoge をデフォルトのハイライトにする（Normal の代わりに使う）。
set winhighlight=Normal:Hoge
  endfunction

  autocmd FileType denite-filter set winblend=10
augroup END
