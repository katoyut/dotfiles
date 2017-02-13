"Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2

"Shell
set shell=/bin/bash

"Disable beep and flash
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" 80列以降を強調表示
set textwidth=0
if exists('&colorcolumn')
  set colorcolumn=+1
  " sh,cpp,perl,vim,...の部分は自分が使う
  " プログラミング言語のfiletypeに合わせてください
  autocmd FileType sh,cpp,perl,vim,ruby,python,haskell,scheme,php,rspec,javascript setlocal textwidth=80
  hi ColorColumn ctermbg=blue
endif

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\(\s\+$\|　\)/
augroup END

"----------------------------
"indent setting
"----------------------------
"ファイル内の <Tab> が対応する空白の数
set tabstop=4

"シフト移動幅
set shiftwidth=4

augroup vimrc
autocmd! FileType perl setlocal shiftwidth=2 tabstop=2
autocmd! FileType html setlocal shiftwidth=2 tabstop=2
autocmd! FileType css  setlocal shiftwidth=2 tabstop=2
autocmd! FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd! FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

"新しい行のインデントを現在行と同じにする
set autoindent

"タブの代わりに空白文字を挿入する
set expandtab

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

"検索時に大文字を含んでいたら大/小を区別
set smartcase

"----------------------------
"Search setting
"----------------------------
"検索をファイルの先頭へループしない
set wrapscan

" 検索結果をハイライト
set hlsearch

"検索時に大文字と小文字を区別しない
set ignorecase

" esc２回でハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"常にステータスラインを表示する
set laststatus=2

"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup

"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer

"クリップボードをWindowsと連携
set clipboard=unnamed

"Vi互換をオフ
set nocompatible

"スワップファイル用のディレクトリ
set directory=$HOME/vimbackup

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

"インクリメンタルサーチを行う
set incsearch

"タブ文字、行末など不可視文字を表示しない
set nolist

"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<

"行番号を表示する
set number

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"twigをシンタックスハイライト"
autocmd BufReadPost *.twig set filetype=jinjahtml

""""""""""""""""""""""""""""""""
""""""""key mapping"""""""""""""
""""""""""""""""""""""""""""""""
noremap  
noremap!  
noremap <BS> 
noremap! <BS> 
"バックスペースで改行を消す
set backspace=2
""""""""""""""""""""""""""""""""
""""""""""PHPの設定"""""""""""""
""""""""""""""""""""""""""""""""
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1
let php_parent_error_open = 1
"let php_folding = 1
"let php_sync_method = xcolor>>"" scheme

""""""""""""""""""""""""""""""""
""""""""""Goの設定""""""""""""""
""""""""""""""""""""""""""""""""
auto BufWritePre *.go Fmt

syntax enable
set t_Co=256
"set background=dark
"colorscheme solarized
colorscheme molokai
"let g:solarized_termcolors=256

"NeoBundle系
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'

    NeoBundle 'Shougo/vimshell.git'
    "NeoBundle 'Lokaltog/vim-powerline.git'
    NeoBundle 'itchyny/lightline.vim'
    NeoBundle 'Shougo/neocomplcache.git'
    "NeoBundle 'Shougo/vimproc'
    NeoBundle 'Shougo/neosnippet.git'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'grep.vim'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'taichouchou2/vim-javascript'
    NeoBundle 'jelera/vim-javascript-syntax'
    NeoBundle 'scrooloose/syntastic'
    NeoBundle 'scrooloose/nerdtree.git'
    NeoBundle 'Xuyuanp/nerdtree-git-plugin'
    NeoBundle 'vim-jp/vim-go-extra'

    "color scheme
    NeoBundle 'molokai'
    "NeoBundle 'altercation/vim-colors-solarized'
    call neobundle#end()
endif


filetype plugin on
filetype indent on

"--------------------------
"lightline.vim
"--------------------------
let g:lightline = {
    \ 'colorscheme': 'wombat'
    \ }

"--------------------------
" NERDTree
"--------------------------
nmap <C-e> :NERDTreeToggle . "<CR>"
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>

let NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'

autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * if argc() == 0 && !exists("s:std_in") |  NERDTree | endif

"----------------------------
" syntastic
"----------------------------
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1
let g:syntastic_php_php_args = '-l'
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': ['go']}
let g:syntastic_go_checkers = ['go', 'golint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*)}''"

"----------------------------
"jsLint.vim
"----------------------------
let $JS_CMD='node'
"
" ---------------------------
"  neocomplcache
"  --------------------------
"
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1

" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_enable_camel_case_completion  =  1

" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20

" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

" ディクショナリ定義
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'php' : $HOME . '/.vim/dict/php.dict',
"    \ 'ctp' : $HOME . '/.vim/dict/php.dict'
"    \ }

if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" 前回行われた補完をキャンセルします
inoremap <expr><C-g> neocomplcache#undo_completion()

" 補完候補のなかから、共通する部分を補完します
inoremap <expr><C-l> neocomplcache#complete_common_string()

" 改行で補完ウィンドウを閉じる
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
"補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"

"tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"

" <C-h>や<BS>を押したときに確実にポップアップを削除します
"inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”

" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()

" 現在選択している候補をキャンセルし、ポップアップを閉じます
"inoremap <expr><C-e> neocomplcache#cancel_popup()

" 括弧/クォートを自動補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [ []<ESC>i
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
" inoremap " ""<Left>
" inoremap ' ''<Left>
" inoremap ` ``<Left>

function! IndentBraces()
    let nowletter = getline(".")[col(".")-1]
    let beforeletter = getline(".")[col(".")-2]

    if nowletter == "}" && beforeletter == "{"
        return "\n\t\n\<UP>\<END>"
    elseif nowletter == "]" && beforeletter == "["
        return "\n\t\n\<UP>\<END>"
    elseif nowletter == ")" && beforeletter == "("
        return "\n\t\n\<UP>\<END>"
    else
        return "\n"
    endif
endfunction

inoremap <silent> <expr> <CR> IndentBraces()

" 開き括弧を消した際に隣接した閉じ括弧も削除する
function! DeleteParenthesesAdjoin()
    let pos = col(".") - 1
    let str = getline(".")
    let parentLList = ["(", "[", "{", "\'", "\"", "`"]
    let parentRList = [")", "]", "}", "\'", "\"", "`"]
    let cnt = 0

    let output = ""

    if pos == strlen(str)
        return "\b"
    endif
    for c in parentLList
        if str[pos -1] == c && str[pos] == parentRList[cnt]
            call cursor(line("."), pos + 2)
            let output = "\b"
            break
        endif
        let cnt += 1
    endfor
    return output."\b"
endfunction

inoremap <silent> <BS> <C-R>=DeleteParenthesesAdjoin()<CR>
