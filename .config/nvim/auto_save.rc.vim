set autowrite
set updatetime=1500

function s:AutoWriteIfPossible()
  if &modified && !&readonly && bufname('%') !=# '' && &buftype ==# '' && expand("%") !=# ''
    write
  endif
endfunction

autocmd CursorHold * call s:AutoWriteIfPossible()
autocmd CursorHoldI * call s:AutoWriteIfPossible()
