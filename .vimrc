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
let maplocalleader="/"

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

if filereadable(expand("~/.vimrc.bundles"))
source ~/.vimrc.bundles
endif
nnoremap <silent> <F5> :NERDTreeTabsToggle<CR>
let mapleader=","
map <silent> <Leader>n <Plug>NERDTreeTabsToggle<CR>
map <silent> <leader>cm <Plug>MarkClear<CR>

" set hlsearch
set ic            "搜索忽略大小写
set incsearch     "逐步搜索，对当前键入的字符进行搜索而不需等待键入完成
"highlight Search ctermbg=yellow ctermfg=black
"highlight IncSearch ctermbg=black ctermfg=yellow
"highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE

""""""""""""""""""""" vim标签配置 end """"""""""""""""""""""
set encoding=utf-8
"可以使用系统的粘贴板"
set clipboard=unnamed
" let g:Powerline_symbols='fancy'

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

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
nmap <Leader>ag :Ag<Space>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nmap <F9> :TagbarToggle<CR>
noremap <Leader>t :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1

"普Vim插件之ale通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
" autocmd BufReadPost * \ if line("'\"")>0&&line("'\"")<=line("$") | \ exe "normal g'\"" | \ endif "让vim记忆上次编辑的位置
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
noremap <silent> <Leader><Leader>r :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" 忘记了sudo
cnoremap w!! w !sudo tee > /dev/null %
noremap \ ,

" easy-mmotion的配置
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" 忽略长度的告警
let g:ale_python_flake8_args="--ignore='E501,E712' "

set t_Co=256
set background=dark
let g:conoline_color_normal_dark = 'ctermbg=236'


" nertcommenter 对其配置
let NERDDefaultAlign = 'left'


" For regular expressions turn magic on
set magic

" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" quickfix window  s/v to open in split window,  ,gd/,jd => quickfix window => open it
autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K

" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v

nmap \ <Plug>CtrlSFCwordPath<CR>

" Gif config
map  / <Plug>(easymotion-sn)\v\c

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Move to line
map f <Plug>(easymotion-sl)

"上移下移操作
nmap <S-j> <Plug>MoveLineDown
nmap <S-k> <Plug>MoveLineUp
vmap <S-k> <Plug>MoveBlockUp
vmap <S-j> <Plug>MoveBlockDown

