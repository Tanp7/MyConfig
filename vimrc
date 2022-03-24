 set norelativenumber
 set smartindent
 set expandtab			" 缩进时将tab制表服转为空格
 set nocompatible
 set hidden
 set encoding=utf-8
" set backspace=2     " more powerful backspacing
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
" set showmatch                   "显示匹配的括号
 set mouse=a                     "启用鼠标"
 set selection=exclusive
 set selectmode=mouse,key
" set matchtime=5
 set ignorecase                  "忽略大小写"
 set incsearch
 set hlsearch                    "高亮搜索项"
 set autoread
 set scrolloff=10
 syntax enable
" 主题配置
 set background=dark
 let g:gruvbox_italic=1
 " colorscheme snazzy
 let ayucolor="light"  " for light version of theme
 let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
 colorscheme ayu
 " autocmd vimenter * ++nested colorscheme gruvbox
 " autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" ycm配置clangd
let g:ycm_use_clangd = "Always"
let g:ycm_clangd_binary_path = "/path/to/clangd"
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

" 不同输入模式下变换光标样式
let &t_SI = "\<ESC>]50;CursorShape=1\x7"
let &t_SR = "\<ESC>]50;CursorShape=2\x7"
let &t_EI = "\<ESC>]50;CursorShape=0\x7"

" 自定义快捷键
map N :N<CR>
map M :n<CR>
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
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/promptline.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'arcticicestudio/nord-vim'
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
  " 设置Chrome浏览器的路径（或是启动Chrome（其他现代浏览器）的命令）
  " 如果设置了该参数，g:mkdp_browserfunc 将被忽略
    let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
    " vim 回调函数, 参数为要打开的 url

    let g:mkdp_auto_start = 0
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




" ==
" == YouCompleteMe
" ==
" 自动补全配置

" ==
" == NERDTree-git
" ==
let g:NERDTreeGitStatusUseNerdFonts = 1
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

" ==
" == airline
" ==
"let g:airline_theme='gruvbox'
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_exclude_filename = []
let g:Powerline_symbols='fancy'
let g:airline_powerline_fonts=1
let Powerline_symbols='fancy'
let g:bufferline_echo=0
set laststatus=2
set t_Co=256
set fillchars+=stl:\ ,stlnc:\

" ==
" == Vim Folding(Marker Method)
" ==
"
" Key blidings
" 
" za - To toggle fold
" zd - To delete fold
" zf#j creates a fold from the cursor down # lines.
" zf/string creates a fold from the cursor to string.
" zj moves the cursor to the next fold.
" zk moves the cursor to the previous fold.
" zo opens a fold at the cursor.
" zO opens all folds at the cursor.
" zm increases the foldlevel by one.
" zM closes all open folds.
" zr decreases the foldlevel by one.
" zR decreases the foldlevel to zero -- all folds will be open.
" zd deletes the fold at the cursor.
" zE deletes all folds.
" [z move to start of open fold.
" ]z move to end of open fold.

" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')

    " Set the background tone.
    " set background=dark

    " Set the color scheme.
    " colorscheme molokai

    " Set a custom font you have installed on your computer.
    " Syntax: <font_name>\ <weight>\ <size>
    set guifont=Monospace\ Regular\ 12

    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the left-side scroll bar.
    set guioptions-=r

    " Hide the the menu bar.
    set guioptions-=m

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}

