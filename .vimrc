set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle.git/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'git://github.com/kana/vim-operator-user.git'
Bundle 'git://github.com/kana/vim-operator-replace.git'
Bundle 'git://github.com/Shougo/vimshell.git'
Bundle 'git://github.com/Shougo/unite.vim.git'
Bundle 'git://github.com/thinca/vim-ref.git'
Bundle 'git://github.com/mattn/perldoc-vim.git'
Bundle 'git://github.com/c9s/perlomni.vim.git'
Bundle 'git://github.com/thinca/vim-textobj-plugins.git'
Bundle 'git://github.com/h1mesuke/vim-alignta.git'
Bundle 'git://github.com/tpope/vim-surround.git'
Bundle 'git://github.com/msanders/snipmate.vim.git'
Bundle 'git://github.com/kana/vim-textobj-user.git'
Bundle 'git://github.com/ujihisa/quickrun.git'
Bundle 'git://github.com/thinca/vim-textobj-comment.git'
Bundle 'git://github.com/thinca/vim-textobj-between.git'
Bundle 'git://github.com/kmnk/vim-unite-svn.git'
Bundle 'git://github.com/vim-scripts/yanktmp.vim.git'
Bundle 'git://github.com/Lokaltog/vim-easymotion.git'
Bundle 'git://github.com/Shougo/vimproc.git'
Bundle 'git://github.com/vimtaku/vim-textobj-sigil.git'
Bundle 'git://github.com/vimtaku/vim-textobj-doublecolon.git'
Bundle 'git://github.com/Shougo/neocomplcache.git'
Bundle 'http://github.com/gmarik/vundle.git'


filetype plugin indent on


" ����Ū������Ϥ�����
" .vim/bundle/vimrc/plugin/basic.vim
"
" GUI��Ϣ�Ϥ�����
" .vim/bundle/vimrc/plugin/gui.vim
"
" �ޥåԥ󥰤˴ؤ����ΤϤ�����
" .vim/bundle/vimrc/plugin/mappings.vim
"
" �ץ饰����Ȥ��Υޥåԥ󥰤ˤĤ��ƤϤ�����
" .vim/bundle/vimrc/plugin/plugins_vimrc.vim
"
" �ȼ��ؿ��������ؿ��Ϥ�����
" .vim/bundle/vimrc/plugin/util.vim

" pathogen.vim��
call pathogen#runtime_append_all_bundles()

let g:neocomplcache_enable_at_startup = 1

