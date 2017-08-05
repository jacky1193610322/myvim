" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

set nu
set tabstop=4
set shiftwidth=4
set cindent
set softtabstop=4
set expandtab
syntax on

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

if filereadable(expand("~/.vimrc.bundles"))
source ~/.vimrc.bundles
endif
nnoremap <silent> <F5> :NERDTreeTabsToggle<CR>
let mapleader=","
map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <silent> <Leader>c <Plug>MarkClear

""""""""""""""""""""" vim标签配置 end """"""""""""""""""""""
set encoding=utf-8
"可以使用系统的粘贴板"
set clipboard=unnamed
let g:Powerline_symbols='fancy'

" ignore some files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"上面的第一行确保了在你完成操作之后，自动补全窗口不会消失，第二行则定义了“转到定义”的快捷方式。

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"""""""""""""""""""""""
nmap <Leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <Leader>gf :YcmCompleter GoToReferences<CR>
nmap <Leader>ag :Ag

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"配置tagbar
nmap <F9> :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1

"普Vim插件之ale通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)

"<Leader>s触发/关闭语法检查
nmap <silent> <Leader>s :ALEToggle<CR>

" youcompleteme的配置
if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
endif

" 设置选中代码缩进的快捷键
vnoremap <tab> >gv
vnoremap <s-tab> <gv

"Bundle之后安装, 仅仅是安装, 要启用哪个主题, 需要在vimrc中显式指定

" colorscheme molokai
" colorscheme desert
"syntax enable
"set background=dark
"colorscheme solarized

"ctrlp buffer 配置
nnoremap <leader>b :CtrlPBuffer<CR>

"bronson/vim-trailing-whitespace 的配置
nnoremap <silent> <leader><space> :FixWhitespace<CR>

" Nerdtree配置
nnoremap <leader>f :NERDTreeFind<CR>

" 可以不重启vim加载配置
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" 忘记了sudo
cnoremap w!! w !sudo tee > /dev/null %
noremap \ ,

