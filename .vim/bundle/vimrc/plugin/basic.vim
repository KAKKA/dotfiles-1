" ���ޤ��ʤ�
syntax on
filetype plugin on
set nocompatible

" tab��Ϣ
set shiftwidth=4
set tabstop=4
set expandtab

" Perl�񤤤Ƥ���Ȥ���#���������Ƭ�˹Ԥä��㤦�Τ��ɤ�����
set cinkeys-=0#
set cindent

"�ü�ʸ��(SpecialKey)�θ����벽��listchars��lcs�Ǥ������ǽ��
"trail�Ϲ������ڡ�����
set list
set listchars=tab:>-,trail:-,nbsp:-,extends:>,precedes:<,

" ��ʬ��򤹤�ݡ�������������ɥ���¦�˺��
set splitright
" ��ʬ�䤷���塢�������벼�Υ����إ�����
nnoremap ,s :vsplit<CR>g]

" gf���ޥ�ɤ⥦����ɥ�ʬ�䤷�Ƴ���
nnoremap gf :vsplit<CR>gf

" �Хå����ڡ����Ǿä���褦��
set backspace=2

" change grep to ack
set grepprg=ack\ -a

" sync unnamed register and *register.
set clipboard=unnamed


"##################################
" FOR SEARCH
"##################################

" ����������ʸ����ʸ����̵�� (noignorecase:̵�뤷�ʤ�)
set ignorecase
" ��ʸ����ʸ����ξ�����ޤޤ�Ƥ��������ʸ����ʸ�������
set smartcase

" ������
set hlsearch


"##################################
" FOR ENCODINGS
"##################################

" ���󥳡��ɴط�
" ʸ�������ɤμ�ưǧ��
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconv��eucJP-ms���б����Ƥ��뤫������å�
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconv��JISX0213���б����Ƥ��뤫������å�
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodings����
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
  " ������ʬ
  unlet s:enc_euc
  unlet s:enc_jis
endif
" ���ܸ��ޤޤʤ����� fileencoding �� encoding ��Ȥ��褦�ˤ���
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" ���ԥ����ɤμ�ưǧ��
set fileformats=unix,dos,mac
" ���Ȥ�����ʸ�������äƤ⥫��������֤�����ʤ��褦�ˤ���
if exists('&ambiwidth')
  set ambiwidth=double
endif


"##################################
" FOR PERSISTENT UNDO
"##################################
"
" 7.3 veeeeeeeery good undo has come!!
if has('persistent_undo')
  "set undodir=./.vimundo,~/.vimundo
  set undodir=~/.vim/undodir
  set undolevels=10000 "maximum number of changes that can be undone
  set undoreload=10000 "maximum number lines to save for undo on a buffer reload
  set undofile
endif


