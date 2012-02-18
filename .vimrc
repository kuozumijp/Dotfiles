"
" kuozumijp .vimrc $Id$
"

syntax on

" タブバーを常に表示する
set showtabline=2

" ステータスラインを常に表示する 
set laststatus=2

" ステータスラインに文字コードと改行文字を表示する 
set statusline=%<%f\ %m%r%h%w%=%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']['.&ft.']'}\ \ %l,%c%V%8P

" TerminalのHeaderに表示
set title

" Vimの折りたたみ関連
set foldmethod=marker
au FileType perl :set commentstring=#%s

" よりVimらしく使いたい
set nocompatible

" インデントをTabではなくスペースにしたい
set expandtab
set tabstop=2

" 行番号を表示させる
set number

" 補完機能を制御する
set wildmode=list:full

" ビープ音を鳴らさないようにする
set visualbell

" 現在のモードを表示する
set showmode

" 改行後に BS を押すと上の行末の 1 文字を消去する
set backspace=2

" インデントを無効にする
set noautoindent

" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan

" 大文字小文字を問わない検索
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

"ルーラを表示
set ruler

"タブを>----で表示
set listchars=tab:>-
set list

" コマンド、検索パターンを100個まで履歴に残す
set history=100

" 起動時のど真ん中に出るメッセージを表示しない
set shortmess+=I

" 全角記号判定
set ambiwidth=double

set hlsearch
set incsearch

"------------------------------------------------------------------------
" bundle Settings
filetype off

if has('win32') || has('win64')
  let $DOTVIM = expand('~/vimfiles')
else
  let $DOTVIM = expand('~/.vim')
endif
set rtp+=$DOTVIM/bundle/vundle/
call vundle#rc()

filetype plugin indent on

"------------------------------------------------------------------------
" bundle Plugins
Bundle 'git://github.com/vim-scripts/sudo.vim.git'
Bundle 'git://github.com/Shougo/neocomplcache.git'
Bundle 'git://github.com/Shougo/neocomplcache-snippets-complete.git'
Bundle 'git://github.com/vim-scripts/svn.vim.git'
Bundle 'git://github.com/motemen/git-vim.git'

"------------------------------------------------------------------------
" highlight
highlight LineNr ctermfg=white
highlight Comment ctermfg=darkgreen
highlight MoreMsg ctermfg=white
highlight Statement ctermfg=white
highlight PreProc ctermfg=blue
highlight Type cterm=underline ctermfg=white
highlight SpecialKey ctermbg=white ctermfg=black
highlight Function ctermfg=blue
highlight Search ctermfg=black ctermbg=yellow cterm=bold,underline
highlight StatusLine cterm=bold,reverse ctermfg=blue ctermbg=white
"highlight StatusLine cterm=bold,reverse ctermbg=white
highlight TabLine term=bold cterm=bold ctermfg=black ctermbg=white
highlight TabLineSel term=bold cterm=bold ctermfg=red ctermbg=black
highlight TabLineFill ctermfg=white

"------------------------------------------------------------------------
" PHP
au BufNewFile,BufRead *.php   :set ft=php
au BufNewFile,BufRead *.inc   :set ft=php
au BufNewFile,BufRead *.html  :set ft=php
au BufNewFile,BufRead *.ctp   :set ft=php

"------------------------------------------------------------------------
" perl
au BufNewFile,BufRead *.cgi   :set ft=perl
au BufNewFile,BufRead *.pl    :set ft=perl
au BufNewFile,BufRead *.pm    :set ft=perl

"------------------------------------------------------------------------
" sql
au BufNewFile,BufRead *.SQL   :set ft=sql

"------------------------------------------------------------------------
" snippetsEmu 関連 環境変数としてシグネチャを記述
let AUTHOR = 'Keisuke Uozumi'
let MAILADDRESS = 'eroejp@gmail.com'
let COPYRIGHT = 'Keisuke Uozumi'

"------------------------------------------------------------------------
" 辞書関連
autocmd FileType php :set dictionary=$VIMRUNTIME/syntax/php.vim
autocmd FileType perl :set dictionary=$VIMRUNTIME/syntax/perl.vim
autocmd FileType sh :set dictionary=$VIMRUNTIME/syntax/sh.vim
autocmd FileType ruby :set dictionary=$VIMRUNTIME/syntax/ruby.vim
autocmd FileType html :set dictionary=$VIMRUNTIME/syntax/html.vim

"------------------------------------------------------------------------
" neocomplcache.vim 関連
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 2
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"


"------------------------------------------------------------------------
" autocomplpop.vim 関連
let g:acp_enableAtStartup = 0
let g:AutoComplPop_BehaviorFileLength = 2
let g:AutoComplPop_BehaviorKeywordLength = 2

"------------------------------------------------------------------------
" ポップアップメニューのカラーを設定
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4

"------------------------------------------------------------------------
" 括弧、クォートの入力時にカーソルを1個戻す
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap <> <><Left>
imap '' ''<Left>
imap "" ""<Left>

"------------------------------------------------------------------------
" vimtab関連
if has('mac')
  nnoremap <C-t> :tabedit<Return>
  nnoremap <C-w> :tabclose<Return>
  nnoremap <C-r> gt
  nnoremap <C-e> gT
else
  nnoremap <C-t> :tabedit<Return>
  nnoremap <C-w> :tabclose<Return>
  nnoremap <C-r> gt
  nnoremap <C-Tab> gt
  nnoremap <C-e> gT
  nnoremap <C-S-Tab> gT
endif

"------------------------------------------------------------------------
" 自動改行無し
autocmd FileType * :set formatoptions-=ro

"------------------------------------------------------------------------
" スペース類をハイライトする
function! HighlightDislikeSpace()
  " 全角スペース
  syntax match DislikeSpace /　/
  " タブ
  syntax match DislikeSpace /\t/
  " 行末のスペース
  syntax match DislikeSpace /\S\@<=\s\+$/
  highlight DislikeSpace cterm=underline ctermfg=1
endfunc
au BufNew,BufRead * call HighlightDislikeSpace()

" これも全角スペース
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

"------------------------------------------------------------------------
"",e"でファイルをVIM上で実行する
" ホントは!でできるんだけどファイル形式も自動で見てくれる
function! ShebangExecute()
  let m = matchlist(getline(1), '#!\(.*\)')
  if(len(m) > 2)
    execute '!'. m[1] . ' %'
  else
    execute '!' &ft ' %'
  endif
endfunction
nmap ,e :call ShebangExecute()<CR>

"------------------------------------------------------------------------
" おまじない文字コード
"set enc=utf-8
"set fenc=utf-8
"set fencs=utf-8,euc-jp,iso-2022-jp,cp932
"set enc=euc-jp
"set fenc=euc-jp
"set fencs=euc-jp,iso-2022-jp,cp932
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
