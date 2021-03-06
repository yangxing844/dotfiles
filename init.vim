"		\ \ / /| || '_ ` _ \ | '__|/ __|
"		_\ V / | || | | | | || |  | (__
"      (_)\_/  |_||_| |_| |_||_|   \___]
"{{{1 Load plugins
call plug#begin('~/.vim/plugged')
" vim-sensible {{{ "
Plug 'tpope/vim-sensible'
" }}} vim-sensible "
" dracula {{{ "
Plug 'dracula/vim', { 'as': 'dracula' }
" }}} dracula "
" vim-snippets {{{ "
Plug 'honza/vim-snippets'

" }}} vim-snippets "
"{{{2   Coc Plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
inoremap <silent><expr> <c-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<c-j>" :
      \ coc#refresh()
inoremap <expr><c-k> pumvisible() ? "\<C-p>" : "\<c-k>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json'
  \ ]
nmap <leader>rn <Plug>(coc-rename)
" autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent>K :call <SID>show_documentation()<CR>
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
" vim-devicons {{{ "
Plug 'ryanoasis/vim-devicons'

" }}} vim-devicons "
" vim-gitgutter {{{ "
Plug 'airblade/vim-gitgutter'
let g:gitgutter_highlight_linenrs = 1
" }}} vim-gitgutter "
" vim-commentary {{{ "
Plug 'tpope/vim-commentary'

" }}} Fold description "
" vim-airline-thems {{{ "
" Plug 'vim-airline/vim-airline-themes'

" }}} vim-airline "
" python-syntax-highlight {{{ "
Plug 'numirias/semshi', {'for':'python'}
Plug 'vim-python/python-syntax', {'for':'python'}
" }}} python-syntax-highlight "
" tabular {{{ "
Plug 'godlygeek/tabular',{'for':'markdown'}

" }}} tabular "
" vim-markdown {{{ "
Plug 'plasticboy/vim-markdown',{'for':'markdown'}

" }}} vim-markdown "
" vimdoc {{{ "
Plug 'yianwillis/vimcdoc'
" }}} vimdoc "
" statusline {{{ "
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
	  \	  'readonly':  'LightlineReadonly'
      \ },
		\ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ }
function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction
"}}}
" asyncrun {{{ "
Plug 'skywind3000/asyncrun.vim'
" }}} asyncrun "
" tex-conceal {{{ "
Plug 'KeitaNakamura/tex-conceal.vim',{'for':'tex'}
let g:tex_conceal="abdgm"
let g:tex_conceal_frac=1
set conceallevel=2

" }}} tex-conceal "
" vimtex {{{ "
Plug 'lervag/vimtex',{'for':'tex'}
let g:tex_flavor='latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_automatic = 0
let g:vimtex_quickfix_mode = 0
let g:vimtex_matchparen_enabled = 0
" let g:vimtex_quickfix_latexlog = {
"           \ 'overfull' : 0,
"           \ 'underfull' : 0,
"           \ 'packages' : {
"           \ 'default' : 0,
"           \ },
"           \}
let g:vimtex_compiler_latexmk_engines = {
			\ '_'         : '-xelatex --shell-escape'
			\}
let g:tex_stylish = 1
let g:tex_conceal = ''
let g:tex_isk='48-57,a-z,A-Z,192-255,:'
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
      \ 'markers' : {'enabled': 0},
	  \ 'sections' : {'parse_levels': 1}
      \}
let g:vimtex_format_enabled = 1
let g:vimtex_compiler_progname = 'nvr'
" let g:tex_fast= ""
" }}} vimtex "
" auto-save {{{ "
Plug '907th/vim-auto-save'
let g:auto_save = 1
"     augroup ft_tex
"       au!
"       au FileType tex let b:auto_save = 0
"     augroup END

" }}} auto-save "
" UltiSnips {{{ "
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
nnoremap <leader>es :UltiSnipsEdit!<cr>

" }}} UltiSnips "
" fzf {{{ "
Plug 'junegunn/fzf', {
      \ 'dir': '~/.fzf',
      \ 'do': './install --all --no-update-rc',
      \}
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.85} }
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'],
      \}

let g:fzf_mru_no_sort = 1
let g:fzf_mru_exclude = '\v' . join([
      \ '\.git/',
      \], '|')
" let g:fzf_mru_relative = 1
" let g:fzf_mru_include

let $FZF_DEFAULT_OPTS = '--reverse --inline-info'

function! s:nothing()
endfunction

augroup my_fzf_config
  autocmd!
  autocmd User FzfStatusLine call s:nothing()
  autocmd FileType fzf silent! tunmap <esc>
augroup END

command! -bang Zotero call fzf#run(fzf#wrap(
            \ 'zotero',
            \ { 'source':  'fd -t f -e pdf . ~/.local/zotero/',
            \   'sink':    'silent !zathura --fork',
            \   'options': '-m -d / --with-nth=-1' },
            \ <bang>0))

nnoremap <silent> <leader>oo       :call fzf#run(fzf#wrap({
      \ 'dir': FindRootDirectory(),
      \ 'options': [
      \   '-m',
      \   '--prompt', 'Files > '
      \ ],
      \}))<cr>
" }}} fzf "
" auto-pairs {{{ "
Plug 'jiangmiao/auto-pairs'
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
" }}} "
" vim-matchup {{{ "
Plug 'andymass/vim-matchup'
let g:matchup_matchparen_offscreen = {'method': 'popup'}
" }}} vim-matchup "
" vim-surround {{{ "
Plug 'tpope/vim-surround'
" }}} vim-surround "
" vim-git {{{ "
Plug 'tpope/vim-fugitive'
" }}} vim-git "
call plug#end()
"}}}1

"{{{1 UI
let g:python_highlight_all = 1
colorscheme dracula
set mouse=vn
set showcmd
if !has('nvim')
set guifont=JetBrainsMonoNerdFontCompleteM-Medium:h18
endif
set ruler
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
function! Foldtext() " {{{2
  let level = repeat('-', min([v:foldlevel-1,3])) . '+'
  let title = substitute(getline(v:foldstart), '{\{3}\d\?\s*', '', '')
  let title = substitute(title, '^["#! ]\+', '', '')
  return printf('%-4s %-s', level, title)
endfunction
set foldtext=Foldtext()
set foldcolumn=0
set foldlevelstart=0
set fillchars=vert:│,fold:\ ,diff:⣿
"}}}2
"}}}1
"{{{1 performance
set nu
" set nocursorline
set undolevels=100
set title
set history=100
set updatetime=100
set timeoutlen=500
set nowrap
set cursorline
" fictx input method 
if has('unix')
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx5-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx5-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx5-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx5-remote -o")
      let g:input_toggle = 0
   endif
endfunction

"set timeoutlen=150
autocmd InsertLeave * call Fcitx2zh()
autocmd InsertEnter * call Fcitx2en()
autocmd FileType tex  let b:AutoPairs =  {'(':')', '[':']', '{':'}','"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
endif
au filetype vim set foldmethod=marker
"}}}1
"{{{1keymapping
"dealing with wrapped lines
" noremap <silent> <Leader>w :call ToggleWrap()<CR>
" function ToggleWrap() "{{{2
"   if &wrap
"     echo "Wrap OFF"
"     setlocal nowrap
"     set virtualedit=all
"     silent! nunmap <buffer> <Up>
"     silent! nunmap <buffer> <Down>
"     silent! nunmap <buffer> <Home>
"     silent! nunmap <buffer> <End>
"     silent! iunmap <buffer> <Up>
"     silent! iunmap <buffer> <Down>
"     silent! iunmap <buffer> <Home>
"     silent! iunmap <buffer> <End>
"   else
"     echo "Wrap ON"
"     setlocal wrap linebreak nolist
"     set virtualedit=
"     setlocal display+=lastline
"     noremap  <buffer> <silent> <Up>   gk
"     noremap  <buffer> <silent> <Down> gj
"     noremap  <buffer> <silent> <Home> g<Home>
"     noremap  <buffer> <silent> <End>  g<End>
"     inoremap <buffer> <silent> <Up>   <C-o>gk
"     inoremap <buffer> <silent> <Down> <C-o>gj
"     inoremap <buffer> <silent> <Home> <C-o>g<Home>
"     inoremap <buffer> <silent> <End>  <C-o>g<End>
"   endif
" endfunction
"2}}}
" noremap <silent> k gk
" noremap <silent> j gj
" noremap <silent> 0 g0
" noremap <silent> $ gj
" Buffer navigation
nnoremap <silent> gb    :bnext<cr>
nnoremap <silent> gB    :bprevious<cr>
" Utility maps for repeatable quickly change/delete current word
nnoremap c*   *``cgn
nnoremap c#   *``cgN
nnoremap cg* g*``cgn
nnoremap cg# g*``cgN
nnoremap d*   *``dgn
nnoremap d#   *``dgN
nnoremap dg* g*``dgn
nnoremap dg# g*``dgN
nnoremap gV  `[V`]
nnoremap ff :CocCommand explorer<CR>
nnoremap for :call CocAction('format')<CR>
nnoremap  <leader>f :FZF<CR>
nmap  <silent> ++ vip++<esc>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
nnoremap <silent> <c-c> :%s/\s\+$//<CR>
map <F1> :call UltiSnips#RefreshSnippets() <CR>
map <F2> :browse oldfiles <CR>
nnoremap <silent> <leader>xv :source $MYVIMRC <CR>
nnoremap <silent> <leader>ev :edit $MYVIMRC <CR>
nnoremap U <C-r>
map Y y$
nnoremap <c-e> $
inoremap <C-e> <C-o>$
nnoremap <c-a> ^
inoremap <C-a> <C-o>^
vnoremap <c-e> $
vnoremap <c-a> ^
nnoremap <silent> `` :on<CR>
nnoremap <silent> <space> za
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>
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
                          exec "AsyncRun -mode=term -rows=5 -raw python3 %"
                          exec "wincmd p"
				  endif
          endif
endfunc
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
" reverse by line number
nnoremap <leader>r :g/^/m0<CR>
"}}}1
"{{{ misc
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
set iskeyword+=-
set iskeyword+=\
filetype on
set cindent
set autowrite
set clipboard+=unnamedplus
set guioptions-=r
set termguicolors
set mouse=vn
set showcmd
set ruler
set scrolloff=5
set fileencodings=utf-8,gb2312,gbk,cp936,latin-1
set fileformat=unix
set nocompatible
set noshowmode "get ride of -- INSERT -- in lightline"
set tw=100
"}}}1

