
if empty(glob('~/.config/autoload/plug.vim'))
    silent !curl -fLo ~/.config/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
let mapleader=" "

set number          "显示行号
set relativenumber  "显示相对行号
set cursorline      "高亮当前行
"set cursorcolum    "高亮当前列
syntax on           "语法高亮
syntax enable
filetype on         "侦测文件类型
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a

set wildmenu
set showmode        "在底部显示当前处于命令模式还是插入模式
set showcmd
set t_Co=256        "启用256色
set autoindent      "按下回车键后下一行的缩进会自动跟上一行的缩进保持一致
set tabstop=4       "按下 Tab 键时Vim 显示的空格数
set shiftwidth=4    "在文本上按下>>增加一级缩进<<取消一级缩进或者==取消全部缩进时每一级的字符数
set expandtab       "由于 Tab 键在不同的编辑器缩进不一致该设置自动将 Tab 转为空格
set textwidth=80    "一行80个字符
set wrap            "自动折行即太长的行分成几行显示
"set linebreak      "只有遇到指定的符号比如空格连词号和其他标点符号才发生折行
set wrapmargin=2    "指定折行处与编辑窗口的右边缘之间空出的字符数
set scrolloff=5     "垂直滚动时光标距离顶部/底部的位置单位行
set sidescrolloff=15"水平滚动时光标距离行首或行尾的位置单位字符该配置在不折行时比较有用
set laststatus=2    "总显示最后一个窗口的状态行设为1则窗口数多于一个的时候显示最后一个窗口的状态行0不显示最后一个窗口的状态行
set ruler           "在状态栏显示光标的当前位置位于哪一行哪一列
set showmatch       "光标遇到圆括号方括号大括号时自动高亮对应的另一个圆括号方括号和大括号
set showtabline=2   "总是显示标签栏"
set hlsearch        "搜索时高亮显示匹配结果
exec "nohlsearch" 
set ignorecase      "搜索忽略大小写
set smartcase       "开启智能大小写
set nocompatible    "设置不兼容vi
set encoding=utf-8  "使用 utf-8 编码
"set list
set listchars=tab:\|\
"set backupdir=~/.local/.vim/.backup/    "设置备份文件交换文件操作历史文件的保存位置
set autochdir       "自动切换工作目录这主要用在一个Vim会话之中打开多个文件的情况默认的工作目录是打开的第一个文件的目录该配置可以将工作目录自动切换到正在编辑的文件
set autoread        "打开文件监视如果在编辑过程中文件发生外部改变比如被别的编辑器编辑了就会发出提示
set wildmenu        "命令模式下底部操作指令按下 Tab 键自动补全第一次按下Tab会显示所有匹配的操作指令的清单第二次按下Tab会依次选择各个指令

"更改光标不同模式的样式
"   https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes#For_the_Gnome-Terminal_.28version_.E2.89.A53.16.29
if has("autocmd")
      au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
        au InsertEnter,InsertChange *
            \ if v:insertmode == 'i' | 
            \   silent execute '!echo -ne "\e[6 q"' | redraw! |
            \ elseif v:insertmode == 'r' |
            \   silent execute '!echo -ne "\e[4 q"' | redraw! |
            \ endif
          au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
      endif

set laststatus=2
"保留上次编辑后光标位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif

noremap <LEADER><CR> :nohlsearch<CR>

noremap S :w<CR>        "使用 S 保存
noremap Q :q<CR>        "使用 Q 普通退出
noremap R :source $MYVIMRC<CR> 
noremap ; :

"=====分屏======
noremap sh :set splitright<CR>:vsplit<CR>
noremap sl :set nosplitright<CR>:vsplit<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
noremap sj :set splitbelow<CR>:split<CR>
"切换
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

"
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'w0rp/ale'

" Undo Tree
Plug 'mbbill/undotree/'

" Python
Plug 'vim-scripts/indentpython.vim'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

call plug#end()
