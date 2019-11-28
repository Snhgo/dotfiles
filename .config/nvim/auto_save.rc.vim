set autowrite
set updatetime=1500

" function s:AutoWriteIfPossible()
"   if &modified && !&readonly && bufname('%') !=# '' && &buftype ==# '' && expand("%") !=# ''
"     write
"   endif
" endfunction

" autocmd CursorHold * call s:AutoWriteIfPossible()
" autocmd CursorHoldI * call s:AutoWriteIfPossible()

" 自動保存時、空白削除
let g:does_remove_trailing_white_space = 1
function s:removeTrailingWhiteSpace()
  if &ft != 'markdown' && g:does_remove_trailing_white_space == 1
    :%s/\s\+$//ge
  endif
endfunction
"
" " `:ToggleRemoveTrailingWhiteSpace` というコマンドを実行すると
" " 保存時にフックして空白を削除するか否かをトグル
" command! -nargs=0 ToggleRemoveTrailingWhiteSpace
"   \ call s:toggleRemovingTrailingWhiteSpaceStatus()
" function s:toggleRemovingTrailingWhiteSpaceStatus()
"   let g:does_remove_trailing_white_space =
"     \ !g:does_remove_trailing_white_space
" endfunction

autocmd BufWritePre * call s:removeTrailingWhiteSpace()

