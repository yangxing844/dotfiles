call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'jonathanfilip/vim-lucius'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvie/vim-flake8'
Plug 'sheerun/vim-polyglot'
Plug 'tell-k/vim-autopep8'
Plug 'godlygeek/tabular',{'for':'markdown'}
Plug 'plasticboy/vim-markdown',{'for':'markdown'}
Plug 'Yggdroot/indentLine',{'for':'python'}
Plug 'yianwillis/vimcdoc'
Plug 'junegunn/seoul256.vim'
Plug 'bling/vim-airline'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-scripts/indentpython.vim'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'skywind3000/asyncrun.vim'
Plug 'KeitaNakamura/tex-conceal.vim'
let g:tex_conceal='abdmg'
set conceallevel=1
hi Conceal ctermbg=none
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
Plug '907th/vim-auto-save'
let g:auto_save = 1  " enable AutoSave on Vim startup
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
set mouse=vn
set showcmd
set cursorline
let g:airline_powerline_fonts = 1
set foldmethod=indent
set foldlevel=99
call plug#end()
set rtp+=/usr/local/opt/fzf
set guifont=JetBrainsMonoNerdFontCompleteM-Medium:h18
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'
set nu
set ruler
set history=1000
syntax on
set fileencodings=utf-8,gb2312,gbk,cp936,latin-1
set fileencoding=utf-8
set termencoding=utf-8
set fileformat=unix
set encoding=utf-8
" 指定配色方案是256色
set t_Co=256
set wildmenu
colorscheme lucius
" 改键
map <F1> :call UltiSnips#RefreshSnippets() <CR>
map <F2> : browse oldfiles <CR>
map <F6> : source~/.vimrc <CR>
map <F8> : source~/.gvimrc<CR>
nnoremap I 10k
vnoremap I 10k
nnoremap K 10j
vnoremap K 10j
nnoremap i k
vnoremap i k
nnoremap k j
vnoremap k j
nnoremap j h
vnoremap j h
nnoremap h i
vnoremap h i
nnoremap J ^
vnoremap J ^
nnoremap L $
vnoremap L $
nnoremap U <C-r>
map Y y$
let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set guifont=JetBrainsMono-Regular:h13
autocmd Filetype python colorscheme space-vim-dark
au Filetype python AirlineTheme dark
au Filetype tex AirlineTheme dark
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99
nnoremap <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
          exec "w"
          if &filetype == 'python'
                  if search("@profile")
                          exec "AsyncRun kernprof -l -v %"
                          exec "copen"
                          exec "wincmd p"
                  elseif search("set_trace()")
                          exec "!python3 %"
                  else
                          exec "AsyncRun-mode=term -rows=10 -raw python3 %"
                          exec "wincmd p"
                  endif
          endif

endfunc
set nocompatible
set backspace=indent,eol,start
set backspace=2
set autoindent
set nobackup
set nowritebackup
set noswapfile

" 用空格代替tab
set expandtab

" 设置显示制表符的空格字符个数,改进tab缩进值，默认为8，现改为4
set tabstop=4

" 统一缩进为4，方便在开启了et后使用退格(backspace)键，每次退格将删除X个空格
set softtabstop=4

" 设定自动缩进为4个字符，程序中自动缩进所使用的空白长度
set shiftwidth=4

" 设置帮助文件为中文(需要安装vimcdoc文档)
set helplang=cn

" 显示匹配的括号
set showmatch

" 文件缩进及tab个数
au FileType html,python,vim,javascript setl shiftwidth=4
au FileType html,python,vim,javascript setl tabstop=4
au FileType java,php setl shiftwidth=4
au FileType java,php setl tabstop=4
" 高亮搜索的字符串
set hlsearch

" 检测文件的类型
filetype on
filetype plugin on
filetype indent on
set cindent

" C风格缩进
set cindent
set noeb
set autowrite
set clipboard+=unnamed
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
set guioptions-=r
