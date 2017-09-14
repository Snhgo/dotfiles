set number
set noswapfile
set fixeol
set spelllang+=cjk
set spell
set clipboard=unnamed
hi clear SpellBad
hi SpellBad cterm=underline

filetype indent on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

augroup MyAutoCmd
  autocmd!
augroup END

" フォーマット呼び出し
function! s:format_file()
  let view = winsaveview()
  normal gg=G
  silent call winrestview(view)
endfunction
nnoremap <Space>f :call <SID>format_file()<CR>

" NERDTreeTabsをnvim起動時に同時に起動
let g:nerdtree_tabs_open_on_console_startup=1

" 新規ファイルテンプレート
" html
"autocmd BufNewFile *.html 0r $HOME/.vim/template/html.txt

" python3
" let g:python3_host_prog = $PYENV_ROOT.'/shims/python3'
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')

" プラグインがインストールされるディレクトリ
if exists('g:nyaovim_version')
  let s:dein_dir = expand('~/.cache/nyaovim/dein')
else
  let s:dein_dir = expand('~/.cache/dein')
endif

" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
  let g:rc_dir    = expand("~/.config/nvim")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  if exists('g:nyaovim_version')
    call dein#add('rhysd/nyaovim-popup-tooltip')
    call dein#add('rhysd/nyaovim-markdown-preview')
    call dein#add('rhysd/nyaovim-mini-browser')
  endif

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

runtime! keymap.rc.vim
runtime! macscript.rc.vim

