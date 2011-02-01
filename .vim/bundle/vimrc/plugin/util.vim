
function! DataDumper()
    let resrow1 = 'use Data::Dumper;'
    let yanked = getreg('""')
    let currow = getpos(".")[1]
    let str = 'warn "{XXX DEBUG ['.bufname('').'] L'.currow. '} '. yanked.' is below.";'
    call append(currow, resrow1)
    call append(currow+1, str)
    call append(currow+2, 'warn Dumper '.yanked.';')
    let pos = getpos(".")
    let list2 = pos[1:3]
    let list2[0] = list2[0] + 1
    call cursor(list2)
endf

" �ե����륿���פˤ�ä��Ѥ��print�ǥХå�
augroup Dumpers
    :au!
    au Filetype perl noremap ,z :call DataDumper()<CR>
    au Filetype javascript noremap ,z o<ESC>p_iconsole.debug(<ESC>A);<ESC>yypkf(a'<ESC>$F)ha='<ESC>=j
aug END



" svn ���ߥåȻ��˥��ߥåȥ�å������˼�ư�ǥѥ����ɲä���
function! SvnCommitInfo()
    let l:svn_branch_url = system("svn info | grep '^URL:'")
    let l:match_list = matchlist(l:svn_branch_url, '^URL: svn:\/\/jupiter\/\(.*\)\n')
    let l:branch = l:match_list[1]
    call append(0, '['.l:branch.'] ')
    call append(1, '['.l:match_list[1].'] ')
    delete
    normal gg$
endf

augroup SvnCommit
    :au!
    au Filetype svn :call SvnCommitInfo()
aug END


" �ե����������Ȥ������ξ��򵭲�
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif


"" �ե�����������ˡ����ꤷ���ե����뤫�����������夬��ޤ���
"augroup SkeletonAu
"    autocmd!
"    autocmd BufNewFile *.pl 0r $HOME/.vim/templates/skel.pl
"    autocmd BufNewFile *.pm 0r $HOME/.vim/templates/skel.pm
"augroup END


" �����Υ��ڡ����ʤɤ����(���ѻ����)
function! RTrim()
    let s:cursor = getpos(".")
    %s/\s\+$//e
    call setpos(".", s:cursor)
endfunction

noremap ,trim :call RTrim()<CR>:echo 'trim space!'<CR>

" screen vim�ǳ������ե�����򥹥ơ������С��Υ����ȥ��
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | silent! exe '!echo -n "k%\\"' | endif


"��Ƭ�Υ��ڡ�����Ϣ³��ϥ��饤�Ȥ�����
"Tabʸ������̤��줺�˥ϥ��饤�Ȥ����Τǡ����̤������Ȥ���Tabʸ����ɽ�����̤�
"���ꤹ��ɬ�פ����롣
function! SOLSpaceHilight()
    syntax match SOLSpace "^\s\+" display containedin=ALL
    highlight SOLSpace term=underline ctermbg=LightGray
endf

"���ѥ��ڡ�����ϥ��饤�Ȥ����롣
function! JISX0208SpaceHilight()
    syntax match JISX0208Space "��" display containedin=ALL
    highlight JISX0208Space term=underline ctermbg=LightCyan
endf

"syntax��̵ͭ������å����������Хåե��ȿ����ɤ߹��߻��˥ϥ��饤�Ȥ�����
if has("syntax")
"    syntax on
"autocmd BufNew,BufRead * call SOLSpaceHilight()
        augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call JISX0208SpaceHilight()
    augroup END
endif


" rename����(commit���Ƥ�Ȥ��ޤ������ʤ����勞)
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

au BufRead,BufNewFile *.t    set filetype=perl
au BufRead,BufNewFile *.tmpl set filetype=html


" �Ԥ������
function! s:JumpMiddle()
    let end = col('$')-1
    let middle = float2nr(ceil(end/2))
    let save_cursor = getpos(".")
    let save_cursor[2] = middle
    call setpos('.', save_cursor)
endfun
nnoremap <silent> M :call <SID>JumpMiddle()<CR>

