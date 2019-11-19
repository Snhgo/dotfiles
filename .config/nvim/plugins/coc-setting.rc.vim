set hidden

" settings for languages
if executable('clangd')
    let g:LanguageClient_serverCommands['c'] = ['clangd']
    let g:LanguageClient_serverCommands['cpp'] = ['clangd']
endif

if executable('pyls')
    let g:LanguageClient_serverCommands['python'] = ['pyls']
endif

if executable('rustup')
    let g:LanguageClient_serverCommands['rust'] = ['rustup', 'run', 'nightly', 'rls']
endif


augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

let g:LanguageClient_autoStart = 1
nnoremap <silent> <Space>lh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <Space>ld :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <Space>lr :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <Space>lf :call LanguageClient_textDocument_formatting()<CR>
