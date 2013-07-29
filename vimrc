" vimrc
" Author: Emiliano Carvalho <emilianojpa@gmail.com>
" Source: https://github.com/emilianocarvalho/vimvundle
"


" _. Settings

set nocompatible              " be iMproved
filetype on                   " required! //off
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

" Add recently accessed projects menu (project plugin)
set viminfo^=!

set autochdir

" you color
"
colorscheme molokai

iabbrev ec@ "Emiliano Carvalho"
iabbrev ecmail@ emilianojpa@gmail.com
syntax keyword WordError ec@
syntax keyword WordError ecmail@

syntax enable

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

" add to listchars ,eof:¬, want to mark the end of line
"
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
set expandtab
set smarttab
set shiftwidth=2


set textwidth=120
"set wrap
"set formatoptions=qrn1
"set colorcolumn=+1

set visualbell

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc
set wildmenu

" _ folding
set nofoldenable
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

" _. RSense - Ruby code
"let g:rsenseUseOmniFunc = 1
"let g:rsenseHome = $RSENSE_HOME -- aspas o/c

" Coloca um cabecalho para scripts 'bash' caso a linha 1 esteja vazia
au BufEnter *.sh if getline(1) == "" | :call setline(1, "#!/usr/bin/env bash") | endif

" Fechamento automatico de parenteses
" imap { {}<left>
" imap ( ()<left>
" imap [ []<left>

" set ve=all "permite mover o cursor para areas onde nao há texto.
set ttyfast    "Envia mais caracteres ao terminal, melhorando o redraw de janelas.



" _. Vundle
"
"    let Vundle manage Vundle
"    required! 
    Bundle 'gmarik/vundle'

" _. General 
    Bundle "mileszs/ack.vim"
    nnoremap <leader>a :Ack!<space>
    Bundle 'tsaleh/vim-align'
    Bundle 'tpope/vim-endwise'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-speeddating'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-unimpaired'
    Bundle 'maxbrunsfeld/vim-yankstack'
    Bundle 'tpope/vim-eunuch'

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
    let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "ruby", "yaml", "markdown"]

    Bundle 'Spaceghost/vim-matchit'
    Bundle 'kien/ctrlp.vim'
    Bundle 'vim-scripts/scratch.vim'

    "Bundle 'troydm/easybuffer.vim'
    "nmap <leader>be :EasyBufferToggle<enter>

" _. Fancy
"
" Powerline
	let g:Powerline_symbols = 'fancy'
    "let g:Powerline_colorscheme = 'solarized256'
	set t_Co=256
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

    Bundle 'msanders/snipmate.vim'
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

    "let g:ghc = /usr/local/bin/ghc
    "let g:haddock_browser = open


" _. Color 
    Bundle 'sjl/badwolf'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'tomasr/molokai'
    Bundle 'zaiste/Atom'
    Bundle 'w0ng/vim-hybrid'

"
" PACKAGES END ******************************************************************************
"
"
" Recarregar o vimrc
" Source the .vimrc or _vimrc file, depending on system
if &term == "win32" || "pcterm" || has("gui_win32")
        map ,v :e $HOME/_vimrc<CR>
        nmap <F12> :<C-u>source ~/_vimrc <BAR> echo "Vimrc recarregado!"<CR>
else
        map ,v :e $HOME/.vimrc<CR>
        nmap <F12> :<C-u>source ~/.vimrc <BAR> echo "Vimrc recarregado!"<CR>
endif  

" snipmate function
"
fun! GetSnipsInCurrentScope()
    let snips = {}
    for scope in [bufnr('%')] + split(&ft, '\.') + ['_']
      call extend(snips, get(s:snippets, scope, {}), 'keep')
      call extend(snips, get(s:multi_snips, scope, {}), 'keep')
    endfor
    return snips
endfun


" função para inserir cabeçalhos python
fun! BufNewFile_PY()
        normal(1G)
        :set ft=python
        :set ts=2
        call append(0, "#!/usr/bin/env python")
        call append(1, "# # -*- coding: UTF-8 -*-")
        call append(2, "# Created:" . strftime("%a %d/%b/%Y hs %H:%M"))
        call append(3, "# Last Change: " . strftime("%a %d/%b/%Y hs %H:%M"))
        call append(4, "# Institution: <+nome+>")
        call append(5, "# Purpuse of script: <+descreva+>")
        call append(6, "# Author: <+seuNome+>")
        call append(7, "# site: <+seuSite+>")
        normal gg
endfun
autocmd BufNewFile *.py call BufNewFile_PY()
map ,py :call BufNewFile_PY()<cr>A

" função para inserir cabeçalhos ruby
fun! BufNewFile_Ruby()
        normal(1G)
        :set ft=ruby
        :set ts=2
        call append(0, "#!/usr/bin/env ruby")
        call append(1, "# # -*- coding: UTF-8 -*-")
        call append(2, "# Created:" . strftime("%a %d/%b/%Y hs %H:%M"))
        call append(3, "# Last Change: " . strftime("%a %d/%b/%Y hs %H:%M"))
        call append(4, "# Institution: <+nome+>")
        call append(5, "# Purpuse: <+descreva+>")
        call append(6, "# Author: <+seuNome+>")
        call append(7, "# site: <+seuSite+>")
        normal gg
endfun
autocmd BufNewFile *.rb call BufNewFile_Ruby()
map ,rb :call BufNewFile_Ruby()<cr>A

" Cria um cabeçalho para scripts bash
fun! InsertHeadBash()
   normal(1G)
   :set ft=bash
   :set ts=4
   call append(0, "#!/usr/bin/env bash")
   call append(1, "# Created : " . strftime("%a %d/%b/%Y hs %H:%M"))
   call append(2, "# Last Change: " . strftime("%a %d/%b/%Y hs %H:%M"))
   call append(3, "# Author : Emiliano Carvalho")
   call append(3, "# Script : ")
   normal($)
endfun
map ,sh :call InsertHeadBash()<cr>

" Coloca um cabecalho para scripts 'bash' caso a linha 1 esteja vazia
au BufEnter *.sh if getline(1) == "" | :call setline(1, "#!/usr/bin/env bash") | endif

" Fechamento automatico de parenteses
imap { {}<left>
imap ( ()<left>
imap [ []<left>

" set ve=all "permite mover o cursor para areas onde nao há texto.
set ttyfast    "Envia mais caracteres ao terminal, melhorando o redraw de janelas.

" _. PACKAGE TagBar

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


