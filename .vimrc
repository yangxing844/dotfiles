call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'vim/killersheep'
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
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
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
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-python'
  \ ]
autocmd CursorHold * silent call CocActionAsync('highlight')
"rename
nmap <leader>r <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif  
endfunction

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'jonathanfilip/vim-lucius'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvie/vim-flake8'
Plug 'sheerun/vim-polyglot'
Plug 'tell-k/vim-autopep8'
"Plug 'Valloric/YouCompleteMe'
"map <leader>a :YcmCompleter GoToDeclaration<CR>
"map <leader>d :YcmCompleter GoToDefinition<CR>
"map <leader>k :YcmCompleter GetDoc<CR>
"map <leader>f :YcmCompleter Fixit<CR>
"map <leader>F :YcmCompleter Format<CR>
"Plug 'davidhalter/jedi-vim',{'for':'python'}
"let g:jedi#documentation_command= ''
"let g:jedi#popup_on_dot=0
Plug 'godlygeek/tabular',{'for':'markdown'}
Plug 'plasticboy/vim-markdown',{'for':'markdown'}
Plug 'Yggdroot/indentLine',{'for':'python'}
Plug 'yianwillis/vimcdoc'
Plug 'junegunn/seoul256.vim'

Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1

Plug 'rafi/awesome-vim-colorschemes'
Plug 'honza/vim-snippets'
"Plug 'jiangmiao/auto-pairs'
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
autocmd Filetype tex setl updatetime=1

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
syntax on
set mouse=vn
set showcmd
set cursorline
set guifont=JetBrainsMonoNerdFontCompleteM-Medium:h18
set nu
set ruler

" -------------------------------改键-----------------------------
map <F1> :call UltiSnips#RefreshSnippets() <CR>
map <F2> : browse oldfiles <CR>
map <C-r> : source~/.vimrc <CR>
map <F8> : source~/.gvimrc<CR>
nnoremap I 10k
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
noremap <silent> <expr> j (v:count == 0 ? 'gk' : 'h')
noremap <silent> <expr> k (v:count == 0 ? 'gj' : 'j')




"autocmd Filetype python set guifont=DroidSansMonoNerdF-:h19
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




"------------------------commented------------------------------------
"if  strftime("%H") < 7
  "set background=dark
"elseif strftime("%H")<19
  "set background=light
"else
    "set background=dark
"endif

"function! g:UltiSnips_Complete()
  "call UltiSnips#ExpandSnippet()
  "if g:ulti_expand_res == 0
    "if pumvisible()
      "return "\<C-n>"
    "else
      "call UltiSnips#JumpForwards()
      "if g:ulti_jump_forwards_res == 0
        "return "\<TAB>"
      "endif
    "endif
  "endif
  "return ""
"endfunction

"function! g:UltiSnips_Reverse()
  "call UltiSnips#JumpBackwards()
  "if g:ulti_jump_backwards_res == 0
    "return "\<C-P>"
  "endif

  "return ""
"endfunction


"if !exists("g:UltiSnipsJumpForwardTrigger")
  "let g:UltiSnipsJumpForwardTrigger = "<tab>"
"endif
"if !exists("g:UltiSnipsJumpBackwardTrigger")
  "let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"endif

"au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
"au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
