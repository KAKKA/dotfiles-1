
"###################################
"## COMMAND MAPPINGS
"###################################

inoremap <C-j> <ESC>
inoremap <C-l> <C-x><C-l>
inoremap <C-y> <C-w>
cnoremap <C-y> <C-w>

noremap <C-k> <C-u>
noremap <C-j> <C-d>

" ʪ���԰�ư
nnoremap j gj
nnoremap k gk

noremap <Space> <C-w>
noremap dw de

noremap <Tab> gt
noremap <S-Tab> gT

noremap g<CR> g;
nnoremap <CR> :<C-u>w<CR>

noremap ( /(<CR>:call histdel('/', -1)<CR>:noh<CR>
noremap ) /)<CR>:call histdel('/', -1)<CR>:noh<CR>
noremap { /{<CR>:call histdel('/', -1)<CR>:noh<CR>
noremap } /}<CR>:call histdel('/', -1)<CR>:noh<CR>

noremap ,n :noh<CR>


"##################################
" SHORTCUT MAPPINGS
"##################################

noremap ,ev :e ~/.vimrc<CR>
noremap ,re :source ~/.vimrc<CR>:echo 'reload .vimrc!!'<CR>
noremap ,v :r! cat -<CR>

