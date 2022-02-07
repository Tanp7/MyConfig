 set relativenumber
 set backspace=2     " more powerful backspacing
 set wrap
 set showcmd
 set wildmenu 
 set number                      "显示行号
 set showtabline=0               "隐藏顶部标签栏"
 set guioptions-=r               "隐藏右侧滚动条"
 set guioptions-=L               "隐藏左侧滚动条"
 set guioptions-=b               "隐藏底部滚动条"
 set cursorline			         		 "突出显示当前行"
 set langmenu=zh_CN.UTF-8        "显示中文菜单
 syntax on                       "开启语法高亮
 set fileformat=unix             "设置以unix的格式保存文件"
 set cindent                     "设置C样式的缩进格式"
 set tabstop=2                  "一个 tab 显示出来是多少个空格，默认 8
 set shiftwidth=2                "每一级缩进是多少个空格
 set showmatch                   "显示匹配的括号"
 set mouse=a                     "启用鼠标"
 set selection=exclusive
 set selectmode=mouse,key
 set matchtime=5
 set ignorecase                  "忽略大小写"
 set incsearch
 set hlsearch                    "高亮搜索项"
 set autoread
 syntax enable
 set background=dark
 color snazzy
 autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg

let g:ycm_use_clangd = "Always"
let g:ycm_clangd_binary_path = "/path/to/clangd"
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
let &t_SI = "\<ESC>]50;CursorShape=1\x7"
let &t_SR = "\<ESC>]50;CursorShape=2\x7"
let &t_EI = "\<ESC>]50;CursorShape=0\x7"


" 自定义快捷键
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map si :set splitright<CR>:vsplit<CR>
map sn :set nosplitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:split<CR>
map se :set splitbelow<CR>:split<CR>
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
 

" 打开vim时保留上次打开的位置:
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" Vim-Plug
set nocompatible              " be iMproved, required
filetype off                  " required
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Auto complete
Plug 'ycm-core/YouCompleteMe'

" Error checking
Plug 'w0rp/ale'

" Web Html/css/js etc...
Plug 'mattn/emmet-vim'
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }


" markdown
Plug 'vimwiki/vimwiki'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

" Vim
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'cocopon/iceberg.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'altercation/vim-colors-solarized'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'


" File
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons' 

call plug#end()




" ===
" === MarkdownPreview
" ===
  let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
   
    let g:mkdp_auto_start = 1
    " 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
    " markdown 文件的时候打开一次

    let g:mkdp_auto_open = 0
    " 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
    " 览窗口

    let g:mkdp_auto_close = 1
    " 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
    " 自动关闭预览窗口

    let g:mkdp_refresh_slow = 0
    " 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
    " 更新预览

    let g:mkdp_command_for_global = 0
    " 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown
    " 文件可以使用改命令

    let g:mkdp_open_to_the_world = 0
    " 设置为 1, 在使用的网络中的其他计算机也能访问预览页面
    " 默认只监听本地（127.0.0.1），其他计算机不能访问


" ===
" === ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']


" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"




" ==
" == YouCompleteMe
" ==
" 自动补全配置

" ==
" == NERDTree-git
" ==
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0
let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too. default: normal
let g:NERDTreeGitStatusShowClean = 1 " default: 0
let g:NERDTreeGitStatusGitBinPath = '/your/file/path' " default: git (auto find in path)
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
