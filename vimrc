" vimrc
" Author: Emiliano Carvalho <emilianojpaoh@zaiste.net>
" Source: https://github.com/zaiste/vimified
"
" Have fun!
"
" Fork
" Emiliano Carvalho

" _. Settings

set nocompatible               " be iMproved
filetype off                   " required!

colorscheme molokai

set splitbelow

set rtp+=~/.vim/vundle.git/
call vundle#rc()

"set autoread
"set backspace=indent,eol,start
"set binary
"set cinoptions=:0,(s,u0,U1,g0,t0
"set completeopt=menuone,preview
set encoding=utf-8
"set hidden
set history=1000
set incsearch
set laststatus=2
set list

" Don't redraw while executing macros
set nolazyredraw

set listchars=tab:▸\ ,extends:❯,precedes:❮
set showbreak=↪

"set modelines=0
"set noeol
"set relativenumber
"set rulerformat=%l,%v
set numberwidth=7
set number
set ruler
"if executable('/bin/zsh')
"  set shell=/bin/zsh
"endif
set showcmd

set exrc
set secure

"set matchtime=2

"set completeopt=longest,menuone,preview


" _ White characters
set autoindent
set tabstop=4
set softtabstop=4

set textwidth=120
set shiftwidth=4
"set expandtab
"set wrap
"set formatoptions=qrn1
"set colorcolumn=+1

set visualbell

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc
set wildmenu

" _. folding

set foldlevelstart=0
set foldmethod=syntax


" _. backups
set undodir=~/.vim/tmp/undo//     " undo files
set undofile
set undolevels=3000
set undoreload=10000
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup
set noswapfile


" Coloca um cabecalho para scripts 'bash' caso a linha 1 esteja vazia
au BufEnter *.sh if getline(1) == "" | :call setline(1, "#!/usr/bin/env bash") | endif

" Fechamento automatico de parenteses
" imap { {}<left>
" imap ( ()<left>
" imap [ []<left>

" set ve=all "permite mover o cursor para areas onde nao há texto.
set ttyfast    "Envia mais caracteres ao terminal, melhorando o redraw de janelas.


" PACKAGES {{{

" _. Vundle
"
"    let Vundle manage Vundle
"    required! 
    Bundle 'gmarik/vundle'

" _. General 
    Bundle "mileszs/ack.vim"
    nnoremap <leader>a :Ack!<space>
    Bundle 'tsaleh/vim-align'
    "Bundle 'tpope/vim-endwise'
    "Bundle 'tpope/vim-repeat'
    "Bundle 'tpope/vim-speeddating'
    Bundle 'tpope/vim-surround'
    "Bundle 'tpope/vim-unimpaired'
    "Bundle 'maxbrunsfeld/vim-yankstack'
    "Bundle 'tpope/vim-eunuch'

    Bundle 'scrooloose/nerdtree'
    nmap <C-n> :NERDTreeToggle<CR>
    autocmd vimenter * NERDTree
    map <C-n> :NERDTreeToggle<CR>
    
    "Disable the scrollbars (NERDTree)
    "set guioptions-=r
    "set guioptions-=L

    "Bundle 'kana/vim-textobj-user'
    "Bundle 'vim-scripts/YankRing.vim'
    "let g:yankring_replace_n_pkey = '<leader>['
    "let g:yankring_replace_n_nkey = '<leader>]'
    "let g:yankring_history_dir = '~/.vim/tmp/'
    "nmap <leader>y :YRShow<cr>

    Bundle 'michaeljsmith/vim-indent-object'
    " analisar documentacao plugin IndentObject.vim
    let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "yaml", "markdown"]

    Bundle 'Spaceghost/vim-matchit'
    Bundle 'kien/ctrlp.vim'
    Bundle 'vim-scripts/scratch.vim'

    "Bundle 'troydm/easybuffer.vim'
    "nmap <leader>be :EasyBufferToggle<enter>

" _. Fancy
"
"   Powerline
    " set laststatus=2 - UP - ACIMA
    Bundle 'git://github.com/Lokaltog/powerline.git'
    set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
    filetype plugin indent on     " required!

" _. OS
    Bundle 'zaiste/tmux.vim'
    Bundle 'benmills/vimux'
    map <Leader>rp :VimuxPromptCommand<CR>
    map <Leader>rl :VimuxRunLastCommand<CR>

    map <LocalLeader>d :call VimuxRunCommand(@v, 0)<CR>



" _. Original repos on github for Vundle
	Bundle 'Lokaltog/vim-easymotion'
	let g:EasyMotion_leader_key = '<Leader>'

" _. Vim-scripts repos
	Bundle 'L9'
	Bundle 'FuzzyFinder'
" _. Non github repos
	Bundle 'git://git.wincent.com/command-t.git'


" _. Coding

    Bundle 'majutsushi/tagbar'
    nmap <leader>t :TagbarToggle<CR>

    Bundle 'gregsexton/gitv'

    Bundle 'scrooloose/nerdcommenter'
    nmap <leader># :call NERDComment(0, "invert")<cr>
    vmap <leader># :call NERDComment(0, "invert")<cr>

    " - Bundle 'msanders/snipmate.vim'
    Bundle 'sjl/splice.vim'

    Bundle 'tpope/vim-fugitive'
    nmap <leader>g :Ggrep
    " ,f for global git serach for word under the cursor (with highlight)
    nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
    " same in visual mode
    :vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

    Bundle 'scrooloose/syntastic'
    let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby'], 'passive_filetypes': ['html', 'css', 'slim'] }

    " --

    autocmd FileType gitcommit set tw=68 spell
    autocmd FileType gitcommit setlocal foldmethod=manual


" _. Python
    Bundle 'klen/python-mode'
    Bundle 'python.vim'
    Bundle 'python_match.vim'
    Bundle 'pythoncomplete'


" _. Ruby
    Bundle 'vim-ruby/vim-ruby'
    Bundle 'tpope/vim-rails'
    "Bundle 'nelstrom/vim-textobj-rubyblock'
    Bundle 'ecomba/vim-ruby-refactoring'

    autocmd FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et
    autocmd FileType ruby,eruby,yaml setlocal foldmethod=manual
    autocmd User Rails set tabstop=2 shiftwidth=2 softtabstop=2 expandtab


" _. Clang 
    Bundle 'LucHermitte/vim-clang'
    Bundle 'vim-scripts/c.vim'


" _. HTML 
    Bundle 'tpope/vim-haml'
    Bundle 'juvenn/mustache.vim'
    Bundle 'tpope/vim-markdown'
    Bundle 'digitaltoad/vim-jade'
    Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    Bundle 'slim-template/vim-slim'

    au BufNewFile,BufReadPost *.jade setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
    au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
    au BufNewFile,BufReadPost *.slim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab


" _. CSS 
    Bundle 'wavded/vim-stylus'


" _. JS 
    Bundle 'kchmck/vim-coffee-script'
    au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

    Bundle 'alfredodeza/jacinto.vim'
    au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
    au BufNewFile,BufReadPost *.coffee setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab


" _. Clojure 
    Bundle 'guns/vim-clojure-static'
    Bundle 'tpope/vim-foreplay'
    Bundle 'tpope/vim-classpath'


" _. Haskell 
    "Bundle 'Twinside/vim-syntax-haskell-cabal'
    "Bundle 'lukerandall/haskellmode-vim'

    "au BufEnter *.hs compiler ghc

    "let g:ghc = "'/usr/local/bin/ghc' retirada as aspas duplas
    "let g:haddock_browser = "'open'


" _. Color 
    Bundle 'sjl/badwolf'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'tomasr/molokai'
    Bundle 'zaiste/Atom'
    Bundle 'w0ng/vim-hybrid'

" PACKAGES }}}




" PACKAGE TagBar - Setup

    nmap <F8> :TagbarToggle<CR>

" _. Ruby
"
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" _. Google Go tagbar
let g:tagbar_type_go = {
    \ 'ctagstype': 'go',
    \ 'kinds' : [
        \'p:package',
        \'f:function',
        \'v:variables',
        \'t:type',
        \'c:const'
    \]
\}

" _. Coffee-Script
"
let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
\ }

" _. Posix regular expressions for matching interesting items. Since this will
"    be passed as an environment variable, no whitespace can exist in the options
"    so [:space:] is used instead of normal whitespaces.
"    Adapted from: https://gist.github.com/2901844
let s:ctags_opts = '
  \ --langdef=coffee
  \ --langmap=coffee:.coffee
  \ --regex-coffee=/(^|=[[:space:]])*class[[:space:]]([A-Za-z]+\.)*([A-Za-z]+)([[:space:]]extends[[:space:]][A-Za-z.]+)?$/\3/c,class/
  \ --regex-coffee=/^[[:space:]]*(module\.)?(exports\.)?@?([A-Za-z.]+):.*[-=]>.*$/\3/m,method/
  \ --regex-coffee=/^[[:space:]]*(module\.)?(exports\.)?([A-Za-z.]+)[[:space:]]+=.*[-=]>.*$/\3/f,function/
  \ --regex-coffee=/^[[:space:]]*([A-Za-z.]+)[[:space:]]+=[^->\n]*$/\1/v,variable/
  \ --regex-coffee=/^[[:space:]]*@([A-Za-z.]+)[[:space:]]+=[^->\n]*$/\1/f,field/
  \ --regex-coffee=/^[[:space:]]*@([A-Za-z.]+):[^->\n]*$/\1/f,staticField/
  \ --regex-coffee=/^[[:space:]]*([A-Za-z.]+):[^->\n]*$/\1/f,field/
  \ --regex-coffee=/(constructor:[[:space:]]\()@([A-Za-z.]+)/\2/f,field/
  \ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){0}/\3/f,field/
  \ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){1}/\3/f,field/
  \ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){2}/\3/f,field/
  \ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){3}/\3/f,field/
  \ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){4}/\3/f,field/
  \ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){5}/\3/f,field/
  \ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){6}/\3/f,field/
  \ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){7}/\3/f,field/
  \ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){8}/\3/f,field/
  \ --regex-coffee=/(constructor:[[:space:]]\()@[A-Za-z.]+(,[[:space:]]@([A-Za-z.]+)){9}/\3/f,field/'

let $CTAGS = substitute(s:ctags_opts, '\v\([nst]\)', '\\', 'g')


