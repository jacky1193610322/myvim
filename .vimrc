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

""""""""""""""""""""" vim标签配置 begin """"""""""""""""""""""
" 显示标签页顺序，便于切换标签页，如需要切换到编号为3的标签页，按 3gt 即可
"if exists("+showtabline")
"    function! MyTabLine()
"        let s = ''
"        let t = tabpagenr()
"        let i = 1
"        while i <= tabpagenr('$')
"            let buflist = tabpagebuflist(i)
"            let winnr = tabpagewinnr(i)
"            let s .= '%' . i . 'T'
"            let s .= (i == t ? '%1*' : '%2*')
"            let s .= ' '
"            let s .= i . ')'
"            let s .= '%*'
"            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#' )
"            let file = bufname(buflist[winnr - 1])
"            let file = fnamemodify(file, ':p:t')
"            if file == ''
"                let file = '[NEW]'
"            else
"                let m = 0       " &modified counter
"                let bc = len(tabpagebuflist(i))     "counter to avoid last ' '
"                " loop through each buffer in a tab
"                for b in tabpagebuflist(i)
"                    " check and ++ tab's &modified count
"                    if getbufvar( b, "&modified" )
"                        let m += 1
"                        break
"                    endif
"                endfor
"                " add modified label + where n pages in tab are modified
"                if m > 0
"                    let file = '+ '.file
"                endif
"            endif
"            let s .= ' '.file.' '
"            let i = i + 1
"        endwhile
"        let s .= '%T%#TabLineFill#%='
"        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
"        return s
"    endfunction
"    set stal=2
"    set tabline=%!MyTabLine()
"endif

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
nmap <Leader>b :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <Leader>[ <C-I>
nnoremap <Leader>] <C-O>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
