set nocompatible
set encoding=utf-8
set completeopt-=preview
filetype off
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" vim 插件管理工具
"Plugin 'VundleVim/Vundle.vim'

" 自动补全工具
"Plugin 'Valloric/YouCompleteMe'

" 美化状态栏 和 主题
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" 配色方案
Plugin 'crusoexia/vim-monokai'
Plugin 'flazz/vim-colorschemes'

" 显示树形目录
Plugin 'scrooloose/nerdtree'

" python pep8检查
Plugin 'nvie/vim-flake8'

call vundle#end()
filetype plugin indent on

syntax enable
syntax on         " 开启语法高亮
set t_Co=256
colorscheme monokai        " murphy 设置配色方案i
set background=dark

set cindent
set hlsearch      " 搜索逐字符高亮
set incsearch
set showmatch     " 高亮显示匹配的括号
set cursorline    " 高亮显示当前 - 行

set nu
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround  

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
 
" 设置状态栏主题风格
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_powerline_fonts=1

"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25

let mapleader=','
map <F4> <leader>ci <CR>

func SetPythonFileTitle()
call setline(1, "#!/usr/bin/env python")
call append(1, "# -*-coding:utf-8 -*-")
normal G
normal o
normal o
endfunc
autocmd bufnewfile *.py call SetPythonFileTitle()

" 折叠代码
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" YCM 配色
"highlight PMenu ctermfg=15 ctermbg=60 guifg=#2D2E27 guibg=#E8E8E3
"highlight PmenuSel cterm=bold,reverse ctermfg=81 ctermbg=234 gui=bold,reverse guifg=#66d9ef guibg=#272822
highlight PMenu ctermfg=255 ctermbg=240 guifg=#2D2E27 guibg=#E8E8E3
highlight PmenuSel cterm=bold,reverse ctermfg=81 ctermbg=234 gui=bold,reverse guifg=#66d9ef guibg=#272822

"autocmd BufWritePost *.py call Flake8()
