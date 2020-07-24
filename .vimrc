 "		       (_)                      
 "		__   __ _  _ __ ___   _ __  ___ 
 "		\ \ / /| || '_ ` _ \ | '__|/ __|
 "		_\ V / | || | | | | || |  | (__ 
 "	   (_)\_/  |_||_| |_| |_||_|   \___]
"{{{1 Load plugins
call plug#begin('~/.vim/plugged')
"""""""""""""""
"  UI plugin  "
"""""""""""""""
Plug 'tpope/vim-sensible'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'honza/vim-snippets'
"{{{2   Coc Plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
inoremap <expr> <C-j>   pumvisible() ? "\<c-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
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
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"explorer 
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }
"}}}2
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'tell-k/vim-autopep8',{'for':'python'}
Plug 'godlygeek/tabular',{'for':'markdown'}
Plug 'plasticboy/vim-markdown',{'for':'markdown'}
Plug 'Yggdroot/indentLine',{'for':['python','txt']}
Plug 'yianwillis/vimcdoc'
set foldmethod=marker
Plug 'bling/vim-airline'
let g:airline_powerline_fonts = 1
Plug 'skywind3000/asyncrun.vim'
Plug 'KeitaNakamura/tex-conceal.vim',{'for':'tex'}
let g:tex_conceal="abdgm"
let g:tex_conceal_frac=1
set conceallevel=2
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:livepreview_previewer = 'skim'
let g:vimtex_quickfix_mode = 0
let g:vimtex_quickfix_latexlog = {
          \ 'overfull' : 0,
          \ 'underfull' : 0,
          \ 'packages' : {
          \ 'default' : 0,
          \ },
          \}
let g:vimtex_compiler_latexmk_engines = {
			\ '_'         : '-xelatex --shell-escape'
			\}
Plug '907th/vim-auto-save'
let g:auto_save = 1  " enable AutoSave on Vim startup
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
call plug#end()
"}}}1

"{{{1 UI
colorscheme dracula
set termguicolors
set mouse=vn
set showcmd
if !has('nvim')
set guifont=JetBrainsMonoNerdFontCompleteM-Medium:h18
endif
set nu
set ruler
let g:python_highlight_all = 1
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
"}}}1

"{{{1 performance
syntax on
set cursorline
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END
set undolevels=100
set title
set history=100
set updatetime=300
set timeoutlen=500
"}}}1 

"{{{1keymapping
nnoremap <silent> <c-c> :%s/\s\+$//<CR>
map <F1> :call UltiSnips#RefreshSnippets() <CR>
map <F2> : browse oldfiles <CR>
map <C-r> : source $MYVIMRC <CR>
nnoremap U <C-r>
nnoremap <silent> <C-d> <C-b>
map Y y$
nnoremap gl $
nnoremap gh ^
vnoremap gl $
vnoremap gh ^
nnoremap <silent> `` :on<CR>
nnoremap <silent> <c-space> za
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>
nnoremap <silent> <C-i> <C-d>
nnoremap <silent> <F5> :call CompileRunGcc()<CR>
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
"}}}1

"{{{1 misc
set backspace=indent,eol,start "任何时候都可以输入回车"
set backspace=2
set autoindent
set nobackup
set nowritebackup
set noswapfile
set autochdir

set tabstop=4
set softtabstop=4
set shiftwidth=4
set helplang=cn
set showmatch
set hlsearch
" 检测文件的类型
filetype on
filetype plugin on
filetype indent on
set cindent
set autowrite
set clipboard+=unnamedplus
set guioptions-=r
set termguicolors
set mouse=vn
set showcmd
if !has('nvim')
set guifont=JetBrainsMonoNerdFontCompleteM-Medium:h18
endif
set nu
set ruler
let g:python_highlight_all = 1
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
"}}}1

"{{{1 encoding
set fileencodings=utf-8,gb2312,gbk,cp936,latin-1
set fileformat=unix
set nocompatible
set rtp+=/usr/local/opt/fzf
"}}}1
