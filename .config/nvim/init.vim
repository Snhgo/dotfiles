set number
set noswapfile
set fixeol
set spelllang+=cjk
set spell
set clipboard+=unnamed
hi clear SpellBad
hi SpellBad cterm=underline
autocmd InsertLeave * set nopaste

filetype indent off
set tabstop=2
set shiftwidth=2
set expandtab
set undofile

augroup MyAutoCmd
  autocmd!
augroup END
" autocmd BufWritePre * :%s/\s\+$//ge

" True Color対応
if has('nvim')
  " For Neovim 0.1.3 and 0.1.4
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " Or if you have Neovim >= 0.1.5
  if (has("termguicolors"))
    set termguicolors
  endif
elseif has('patch-7.4.1778')
  set guicolors
endif

" フォーマット呼び出し
function! s:format_file()
  let view = winsaveview()
  normal gg=G
  silent call winrestview(view)
endfunction
nnoremap <S-f> :call <SID>format_file()<CR>

" 新規ファイルテンプレート
" html
"autocmd BufNewFile *.html 0r $HOME/.vim/template/html.txt

" -------------------------------------------------------------------------------
" neovim言語設定
" -------------------------------------------------------------------------------
" python2
let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'

" python3
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'
" let g:python3_host_prog = $PYENV_ROOT.'/shims/python3'
" let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')

" ruby
let g:ruby_host_prog = $RBENV_ROOT.'/versions/2.5.1/bin/neovim-ruby-host'

" node
let g:node_host_prog = $NODENV_ROOT.'/versions/10.15.3/bin/neovim-node-host'

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')

" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" ===============================================================================


" -------------------------------------------------------------------------------
" deinによるプラグインインストール及び設定読み込み
" -------------------------------------------------------------------------------
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

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" プラグインの追加・削除やtomlファイルの設定を変更した後は
" 適宜 call dein#update() や call dein#clear_state()

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" ===============================================================================

filetype plugin indent on

runtime! keymap.rc.vim
runtime! macscript.rc.vim
runtime! auto_save.rc.vim
runtime! vim-command.rc.vim

