""" This is $HOME\_gvimrc 
"�F
colorscheme desert
"colorscheme molokai

autocmd BufRead,BufNewFile *.log setfiletype log

"�R�}���h�s
set cmdheight=1

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Swap�t�@�C�����쐬���Ȃ�
set noswapfile

"�s�ԍ�
set number

"�s���C��
set cursorline

"scroll off
set so=3

"�r�[�v��炳�Ȃ�
set vb t_vb=

"�C���N�������g�T�[�`

set incsearch
" �Ō������擪�ɖ߂�
set wrapscan

"�o�b�N�A�b�v
set backup
set backupdir=%tmp%
set directory=%tmp%
set viminfo='20,\"100,n%tmp%


"IME��OFF�̏�ԂŋN��
set iminsert=0

"�t�@�C���̏ꏊ���J�����g�f�B���N�g���ɂ���
au BufEnter * execute ":lcd " . expand("%:p:h")

"�����ʂ����͂��ꂽ�Ƃ��A�Ή����銇�ʂ�\������B
set sm

" auto indent
set ai

" Undo�t�@�C�������Ȃ�
:set noundofile

" �ʒu���
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
" Note: neobundle �̐ݒ��.gvimrc�ɏ����Ȃ����ƁI
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'tomasr/molokai'

call neobundle#end()

" Required:
" this will conveniently prompt you to install them.
NeoBundleCheck
