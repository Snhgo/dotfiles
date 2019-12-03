
let g:defx_git#column_length = 1
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
" call defx#custom#column('git', 'indicators', {
"  \ 'Modified'  : '✹',
"  \ 'Staged'    : '✚',
"  \ 'Untracked' : '✭',
"  \ 'Renamed'   : '➜',
"  \ 'Unmerged'  : '═',
"  \ 'Ignored'   : '☒',
"  \ 'Deleted'   : '✖',
"  \ 'Unknown'   : '?'
"  \ })
