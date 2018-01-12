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

set noswapfile
set nu
set tabstop=4
set shiftwidth=4
set cindent
set softtabstop=4
set expandtab
autocmd FileType yaml,conf set tabstop=4 shiftwidth=4 expandtab ai
" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
syntax on
filetype off
let maplocalleader="/"
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
if filereadable(expand("~/.vimrc.bundles"))
source ~/.vimrc.bundles
endif
nnoremap <silent> <F5> :NERDTreeTabsToggle<CR>
let mapleader=","
map <silent> <Leader>n <Plug>NERDTreeTabsToggle<CR>
map <silent> <leader>cm <Plug>MarkClear
cnoremap far Far

" set hlsearch
set ic            "搜索忽略大小写
set incsearch     "逐步搜索，对当前键入的字符进行搜索而不需等待键入完成
"highlight Search ctermbg=yellow ctermfg=black
"highlight IncSearch ctermbg=black ctermfg=yellow
"highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE

""""""""""""""""""""" vim标签配置 end """"""""""""""""""""""
set encoding=utf-8
"可以使用系统的粘贴板"
set clipboard+=unnamed
" let g:Powerline_symbols='fancy'

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <Space> za

" ignore some files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

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
nmap <Leader>g :YcmCompleter GoTo<CR>
nmap <Leader>gf :YcmCompleter GoToReferences<CR>
nmap <Leader>sf :CtrlSF<Space>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" 交换两个窗口的位置
nnoremap <C-x> <C-W>x

noremap <Leader>t :TagbarToggle<CR>
"let g:tagbar_map_preview = '<Space>'
"普Vim插件之ale通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
" autocmd BufReadPost * \ if line("'\"")>0&&line("'\"")<=line("$") | \ exe "normal g'\"" | \ endif "让vim记忆上次编辑的位置
"<Leader>s触发/关闭语法检查
"au Filetype * if (&ft!="python")|:ALEDisable|endif
"au Filetype * if (&ft=="python")|:ALEEnable|endif
nmap <silent> <Leader>s :ALEToggle<CR>
" youcompleteme的配置
if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    "let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
    let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

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
nnoremap <silent> <leader><space> :StripWhitespace<CR>

" Nerdtree配置
nnoremap <leader>f :NERDTreeFind<CR>

" 可以不重启vim加载配置
noremap <silent> <Leader><Leader>r :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" 忘记了sudo
cnoremap w!! w !sudo tee > /dev/null %
noremap \ ,

" easy-mmotion的配置
nmap s <Plug>(easymotion-overwin-f)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

set t_Co=256
set background=dark


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

nmap \ <Plug>CtrlSFCCwordPath<CR>

" Gif config
map / <Plug>(easymotion-sn)
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
map f <Plug>(easymotion-sl)
map w <Plug>(easymotion-bd-wl)
map e <Plug>(easymotion-bd-el)

"上移下移操作
nmap <S-j> <Plug>MoveLineDown
nmap <S-k> <Plug>MoveLineUp
vmap <S-k> <Plug>MoveBlockUp
vmap <S-j> <Plug>MoveBlockDown
"change word to uppercase, I love this very much
inoremap <C-u> <esc>gUaw

map <Leader>ru :CtrlPMRU<CR>
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-a> <Home>
"cmap <C-b> <S-Left>
"cmap <C-f> <S-Right>
cnoremap <C-e> <End>
"au BufReadPost quickfix :e ~/.vimrc.bundles<CR>
"au CtrlPFunky * echo &bf
" 使能ctrlp－funky的时候 如果开启ale的检查 那么ctrlp－funky会报错
autocmd BufEnter ControlP let b:ale_enabled = 0
autocmd Filetype far_vim let b:ale_enabled = 0
"function DisableAle()
"    let bnr = bufwinnr('2wincmd w')
"    if bnr > 0
"        :ALEEnable
"    endif
"endfunction
"imap <Esc> <Esc><slient>:call DisableAle()<CR>
""map <Esc> <Esc><silent>:call DisableAle()<CR>
au Filetype nerdtree map <buffer> <Space> go
au Filetype qf map <buffer> <Space> go
au Filetype qf map <buffer> <Enter> O
"au BufLeave __CtrlSF__  :ToggleWhitespace
"let g:ale_filetype_blacklist = [
"\   'dirvish',
"\   'nerdtree',
"\   'qf',
"\   'tags',
"\   'unite',
"\   'ctrlp-funky',
"\]
""au BufLeave ControlP :ALEEnable
"highlight IncSearch guibg=green ctermbg=green term=underline
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 4)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 4)<CR>
"noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 0, 5)<CR>
"noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 0, 5)<CR>

" change window width之后使用ctrl w ＝恢复平分窗口
nnoremap <S-left> :vertical resize -5<cr>
nnoremap <S-right> :vertical resize +5<cr>

" 映射ctrl＋b 在command line的时候 向前移动一个单词 ctrl f向后移动一个单词
" 以下的代码
" 来自https://github.com/vim-scripts/emacscommandline/blob/master/plugin/emacscommandline.vim
cnoremap <Esc>f <C-\>e<SID>ForwardWord()<CR>
"cmap <C-F> <Esc>f
function! <SID>ForwardWord()
    let l:loc = strpart(getcmdline(), 0, getcmdpos() - 1)
    let l:roc = strpart(getcmdline(), getcmdpos() - 1)
    if (l:roc =~ '\v^\s*\w')
        let l:rem = matchstr(l:roc, '\v^\s*\w+')
    elseif (l:roc =~ '\v^\s*[^[:alnum:]_[:blank:]]')
        let l:rem = matchstr(l:roc, '\v^\s*[^[:alnum:]_[:blank:]]+')
    else
        call setcmdpos(strlen(getcmdline()) + 1)
        return getcmdline()
    endif
    call setcmdpos(strlen(l:loc) + strlen(l:rem) + 1)
    return getcmdline()
endfunction

cnoremap <Esc>b <C-\>e<SID>BackwardWord()<CR>
"cmap <C-B> <Esc>b
function! <SID>BackwardWord()
    let l:loc = strpart(getcmdline(), 0, getcmdpos() - 1)
    let l:roc = strpart(getcmdline(), getcmdpos() - 1)
    if (l:loc =~ '\v\w\s*$')
        let l:rem = matchstr(l:loc, '\v\w+\s*$')
    elseif (l:loc =~ '\v[^[:alnum:]_[:blank:]]\s*$')
        let l:rem = matchstr(l:loc, '\v[^[:alnum:]_[:blank:]]+\s*$')
    else
        call setcmdpos(1)
        return getcmdline()
    endif
    let @c = l:rem
    call setcmdpos(strlen(l:loc) - strlen(l:rem) + 1)
    return getcmdline()
endfunction
"nnoremap <Down> <C-e>
"nnoremap <Up> <C-y>
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
"  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
"augroup END
"au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set background=dark
set t_Co=256
"let g:rehash256 = 1
colorscheme molokai
let g:molokai_original = 1
if has("gui_running")
    set guifont=Monaco:h14
    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
    "set fu
    set guioptions-=T
    set guioptions-=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif
" 因为molokai的主题选中的颜色比较淡 所以在这里进行了修改
hi VisualNOS                   ctermbg=103
hi Visual                      ctermbg=103
" ycm的错误颜色
if has("spell")
   hi SpellBad                ctermbg=89
endif
" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on


nmap  ; ,#
nmap ' ,*
"map [[ ?{<CR>w99[{
"map ]] j0[[%/{<CR>

"nmap [[ <Plug>(IndentWisePreviousLesserIndent)
"nmap ]] <Plug>(IndentWiseNextLesserIndent)

autocmd FileType python nnoremap <buffer> [[ ?^class\\|\v(^\s*def\s+)<CR>
autocmd FileType python nnoremap <buffer> ]] /^class\\|\v(^\s*def\s+)<CR>

nmap <Leader>v  <Plug>(easyoperator-phrase-select)
nmap <Leader>d <Plug>(easyoperator-phrase-delete)
nmap <Leader>y <Plug>(easyoperator-phrase-yank)
