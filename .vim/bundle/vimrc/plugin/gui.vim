" �������줿���֥�˥塼(GUI)
set wildmenu

" ���ơ������饤��
set laststatus=2
set statusline=%<%f\%m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L

" ���̤Υ���������10�Ԥǥ������볫��
set scrolloff=10

" �ޥ����⡼��ͭ��
set mouse=a

" screen�б�
set ttymouse=xterm2

" ���顼��������
if (has('win32'))
    colorscheme slate
elseif (has('mac'))
    colorscheme koehler
else
    colorscheme koehler
endif

