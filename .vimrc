call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'jiangmiao/auto-pairs'
""""""""""""""
"  supertab  "
""""""""""""""
Plug 'ervandew/supertab'
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'
""""""""""""""""""""""""""""
"  nerdtree configutation  "
""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'
nmap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#0ee375",
    \ "Modified"  : "#d9bf91",
    \ "Renamed"   : "#51C9FC",
    \ "Untracked" : "#FCE77C",
    \ "Unmerged"  : "#FC51E6",
    \ "Dirty"     : "#FFBD61",
    \ "Clean"     : "#87939A",
    \ "Ignored"   : "#808080"
    \ }
"""""""""""""""""""""""
"  coc configutation  "
"""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr><cr>    pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
inoremap <expr><tab>   pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><c-l> pumvisible() ? "\<c-p>" : "\<s-tab>"
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-python'
  \ ]
nmap <leader>rn <Plug>(coc-rename)
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> gk :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"-------------------------Misc---------------------------
Plug 'christoomey/vim-tmux-navigator'
nnoremap trc :%s/\s\+$//<CR>
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter',{'for':'python'}
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'tell-k/vim-autopep8'
Plug 'godlygeek/tabular',{'for':'markdown'}
Plug 'plasticboy/vim-markdown',{'for':'markdown'}
Plug 'Yggdroot/indentLine',{'for':'python'}
Plug 'yianwillis/vimcdoc'
set foldmethod=indent
set foldlevel=99
Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
Plug 'rafi/awesome-vim-colorschemes'

"Plug 'davidhalter/jedi-vim'
Plug 'honza/vim-snippets'
Plug 'skywind3000/asyncrun.vim'

Plug 'KeitaNakamura/tex-conceal.vim',{'for':'tex'}
let g:tex_conceal='abdgm'
let g:tex_conceal_frac=1
set conceallevel=2
hi Conceal ctermbg=none


""""""""""""
"  vimtex  "
""""""""""""
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:livepreview_previewer = 'open -a Preview'
let g:vimtex_quickfix_mode = 0
Plug '907th/vim-auto-save'
let g:auto_save = 1  " enable AutoSave on Vim startup
"""""""""""""""""""""""""""""
"  ultisnips configutation  "
"""""""""""""""""""""""""""""
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


call plug#end()
set rtp+=/usr/local/opt/fzf
set history=1000



"----------------------------编码问题------------------------------
set fileencodings=utf-8,gb2312,gbk,cp936,latin-1
set fileencoding=utf-8
set termencoding=utf-8
set fileformat=unix
set encoding=utf-8


"-----------------------------apperance----------------------------
set t_Co=256
set wildmenu
colorscheme onedark
au Filetype tex colorscheme OceanicNext
au Filetype tex AirlineTheme dark
syntax on
set mouse=vn
set showcmd
set cursorline
if !has('nvim')
set guifont=JetBrainsMonoNerdFontCompleteM-Medium:h18
endif
set nu
set ruler

" -------------------------------改键-----------------------------
map <F1> :call UltiSnips#RefreshSnippets() <CR>
map <F2> : browse oldfiles <CR>
map <C-r> : source~/.vimrc <CR>
map <F8> : source~/.gvimrc<CR>
nnoremap I 10i
nnoremap K 10k
nnoremap J 10j
vnoremap K 10k
vnoremap K 10k
nnoremap H 10h
vnoremap H 10h
nnoremap L 10l
vnoremap L 10l
nnoremap U <C-r>
map Y y$
noremap <silent> <expr> k (v:count == 1 ? 'gk' : 'k')
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')



if !has('nvim')
autocmd Filetype python set guifont=DroidSansMonoNerdF-:h19
endif
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
                          exec "AsyncRun -mode=term -rows=10 -raw python3 %"
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
set guioptions-=r
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
