""" This is $HOME\_gvimrc 
"色
colorscheme desert
"colorscheme molokai

autocmd BufRead,BufNewFile *.log setfiletype log

"コマンド行
set cmdheight=1

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Swapファイルを作成しない
set noswapfile

"行番号
set number

"行ライン
set cursorline

"scroll off
set so=3

"ビープを鳴らさない
set vb t_vb=

"インクリメントサーチ

set incsearch
" 最後尾から先頭に戻る
set wrapscan

"バックアップ
set backup
set backupdir=%tmp%
set directory=%tmp%
set viminfo='20,\"100,n%tmp%


"IMEをOFFの状態で起動
set iminsert=0

"ファイルの場所をカレントディレクトリにする
au BufEnter * execute ":lcd " . expand("%:p:h")

"閉じ括弧が入力されたとき、対応する括弧を表示する。
set sm

" auto indent
set ai

" Undoファイルを作らない
:set noundofile

" 位置情報
let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
      \ 'set columns=' . &columns,
      \ 'set lines=' . &lines,
      \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
      \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END

if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif


" NeoBundle
:source $VIMRUNTIME/mswin.vim
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Note: neobundle の設定を.gvimrcに書かないこと！
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'tomasr/molokai'

call neobundle#end()

" Required:
" this will conveniently prompt you to install them.
NeoBundleCheck
