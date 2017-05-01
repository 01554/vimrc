" vim-python-jedi で動作することを確認しています
"  sudo apt-get install vim-python-jedi
"
" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
 " NeoBundle 'scrooloose/syntastic'
 
 " Lint
 NeoBundle 'Flake8-vim'
 

 " インデントに色を付けて見やすくする
 NeoBundle 'nathanaelkane/vim-indent-guides'
 "
 " " vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする


 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck


" autopep8 の設定
" http://ton-up.net/technote/2013/11/26/vim-python-style-check-and-fix/
" original http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 --ignore=E501  -')
endfunction


" Shift + F で Pythonコードのインデントとか 自動修正
autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>

" let g:syntastic_python_checkers = ['flake8', 'pep8']

" vim-indent-guides
" Vim 起動時 vim-indent-guides を自動起動
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=1
" 自動カラー無効
let g:indent_guides_auto_colors=0
" 奇数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
" 偶数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
" ガイドの幅
let g:indent_guides_guide_size = 4

" F5で実行
nmap <F5> :!python %
nmap <F2> :!sh ../sh/lambdaUp.sh



syntax enable
set ruler
set listchars=tab:>-,trail:-,nbsp:%,extends:>
set matchpairs& matchpairs+=<:> " 対応カッコ追加
set incsearch
set hlsearch
" Swapファイル 邪魔
set nowritebackup
set nobackup
set noswapfile
set t_vb= " ベルとかうるさい
set novisualbell
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set list                " 不可視文字の可視化
set number              " 行番号の表示
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化
set colorcolumn=120     " その代わり120文字目にラインを入れる
set whichwrap=h,l
set nowrapscan
set history=2000
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする
set backspace=indent,eol,start "  バックスペースでなんでも消せるようにする
set expandtab
set tabstop=4
set shiftwidth=4
colorscheme elflord
