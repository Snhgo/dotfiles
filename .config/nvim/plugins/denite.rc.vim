
" use floating
let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7
let s:winwidth = float2nr(&columns * s:denite_win_width_percent)
let s:wincol = float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2)
let s:winheight = float2nr(&lines * s:denite_win_height_percent)
let s:winrow = float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2)

hi WINHI_BG guibg=NONE
let s:denite_default_options = {
      \ 'split': 'floating',
      \ 'winwidth': s:winwidth,
      \ 'wincol': s:wincol,
      \ 'winheight': s:winheight,
      \ 'winrow': s:winrow,
      \ 'prompt': '$ ',
      \ 'highlight_matched_char': 'WildMenu',
      \ 'highlight_preview_line': 'NormalFloat',
      \ 'highlight_window_background': 'WINHI_BG',
      \ 'highlight_matched_range': 'Visual',
      \ 'fighlight_filter_background': 'StatusLine',
      \ 'highlight_prompt': 'StatusLine',
      \ 'start_filter': v:true,
      \ 'source_names': 'short',
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

let g:denite_winid = -1
let g:frame_float_winid = -1
augroup transparent-windows
  autocmd!
  autocmd FileType denite call s:open_frame_float_win()
  autocmd FileType denite call s:denite_window_bg_setting()
  function! s:denite_window_bg_setting() abort
    set winblend=10
    let g:denite_winid = win_getid()

    hi CursorLine  guibg=#434343
  endfunction

  " autocmd FileType denite-filter set winblend=10

  autocmd BufWinLeave * call s:denite_quit()
  function! s:denite_quit() abort
    if g:denite_winid > 0 && g:denite_winid == win_getid()
      call s:close_frame_float_win()
      let g:denite_winid = -1
    endif
  endfunction

  "deniteのfloat windowの枠用float window ----------------------
  function! s:open_frame_float_win() abort

    " 複数表示を避ける
    if g:frame_float_winid > 0
      return
    endif

    let width = s:winwidth + 6
    let top_edge_frame_str = ' |'
    let top_margin_frame_str = ' '
    let bottom_edge_frame_str = ' |'
    let bottom_margin_frame_str = ' '
    let frame_str = ' |'
    let i = 0
    let width_length = width - 4
    while i < width_length
      let top_edge_frame_str = top_edge_frame_str . '‾'
      let top_margin_frame_str = top_margin_frame_str . ' '
      let bottom_edge_frame_str = bottom_edge_frame_str . '_'
      let bottom_margin_frame_str = bottom_margin_frame_str . ' '
      let frame_str = frame_str . ' '
      let i += 1
    endwhile
    let top_edge_frame_str = top_edge_frame_str . '| '
    let bottom_edge_frame_str = bottom_edge_frame_str . '| '
    let frame_str = frame_str . '| '

    " 上下マージンと上下ラインとdenite filter windowの分が5
    let height = s:winheight + 5
    let buf = nvim_create_buf(v:false, v:true)

    let list = []
    let i = 0
    while i < height
      if i == 0
        call add(list, top_margin_frame_str)
      elseif i == 1
        call add(list, top_edge_frame_str)
      elseif i < height - 2
        call add(list, frame_str)
      elseif i < height - 1
        call add(list, bottom_edge_frame_str)
      else
        call add(list, bottom_margin_frame_str)
      endif
      let i += 1
    endwhile

    call nvim_buf_set_lines(buf, 0, -1, v:true, list)
    let opts = {'relative': 'editor',
          \ 'width': width,
          \ 'height': height,
          \ 'col': s:wincol - 3,
          \ 'row': s:winrow - 2,
          \ 'style': 'minimal'}
    let g:frame_float_winid = nvim_open_win(buf, 0, opts)
    " optional: change highlight, otherwise Pmenu is used
    hi FRAME guifg=#297F8E guibg=NONE
    call nvim_win_set_option(g:frame_float_winid, 'winhighlight', 'Normal:FRAME')
    call nvim_win_set_option(g:frame_float_winid, 'winblend', 11)
  endfunction

  " 枠用floatwindowの削除
  function! s:close_frame_float_win() abort
    call nvim_win_close(g:frame_float_winid, v:true)
    let g:frame_float_winid = -1
  endfunction

augroup END



