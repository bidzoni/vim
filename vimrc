set nocompatible   " Disable vi-compatibility
filetype off

set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' 
Plugin 'jiangmiao/auto-pairs'
Plugin 'shougo/neocomplete.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'chenkaie/smarthomekey.vim'
Plugin 'shougo/unite.vim'
Plugin 'shougo/unite-outline'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'matchit.zip'
Plugin 'lyokha/vim-xkbswitch'
Plugin 'shougo/vimproc.vim'
Plugin 'shougo/vimshell.vim'
Plugin 'mileszs/ack.vim'

call vundle#end()            
filetype plugin indent on   

" COMMON VIM SETTINGS

au! BufWritePost *vimrc source ~/.vimrc

"setting gui options
if has('gui_running')
	set guioptions=aegrLtm
	set lines=47 columns=105
    set guioptions-=e
    set guioptions-=m
    if has ("win32")
        set guifont=Consolas:h9
    else
        set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
    endif
endif

if version >= 700
    set history=64
    set undolevels=128
    set undodir=~/.vim/undodir/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

nnoremap <Space> <Nop>
let mapleader = " "

"256 color support
set t_Co=256

autocmd ColorScheme * hi SpellBad NONE
colorscheme desert
set ai!
set autoread
set clipboard=unnamed
set cursorline
set encoding=utf-8 
set expandtab
set grepprg=grep\ -nH\ $*
set hidden
set hls!
set ignorecase
set incsearch
set infercase
set laststatus=2 
set mousehide
set nu!
set relativenumber
set shellslash
set shiftwidth=4
set showcmd
set showtabline=2
set sm!
set smarttab
set spell
set spelllang=ru,en
set tabstop=4
set tags=./.tags;/
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set iskeyword=@,48-57,_,192-255
set wrap
set tw=0 
set formatoptions-=t


highlight lCursor guifg=NONE guibg=Cyan

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

filetype plugin on 
filetype indent on

let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'


" completion menu like IDE
"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

 " Clang Complete Settings
"let g:clang_complete_auto = 0
"let g:clang_complete_copen = 1
"let g:clang_library_path='/usr/lib/libclang.so'


nmap <F2> :nohlsearch<CR>
nnoremap <M-j> mz:m+<CR>`z==
nnoremap <M-k> mz:m-2<CR>`z==
inoremap <M-j> <Esc>:m+<CR>==gi
inoremap <M-k> <Esc>:m-2<CR>==gi
vnoremap <M-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

imap <F1> <C-^>
vmap <C-y> "=y
map <F11> :call VimCommanderToggle()<CR>
map <F12> :ConqueTerm bash<CR>
map j gj
map k gk

behave mswin
function Tags(lang)
    let cmd="ctags-exuberant -R --language-force=" . a:lang . " -f.tags"
    execute "!" . cmd
    set tags=.tags
endfunction


" PLUGINS


" AUTO-PAIRS
let g:AutoPairsFlyMode = 1 " work on the fly
let g:AutoPairsShortcutBackInsert = '<M-b>' " back insert

" AUTOCOMPLETE: neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_auto_select = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype java set omnifunc=javacomplete#Complete
autocmd Filetype cpp set omnifunc=omni#cpp#complete#Main
autocmd filetype groovy set makeprg="grandle build"
autocmd filetype groovy set dictionary= "~/.vim/dictionary/gradle.dict"

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" NERD-COMMENTER
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" NERD-TREE
nmap <F3> :NERDTreeToggle<CR> 

" SMART HOME KEY
imap <silent> <Home> <C-O>:SmartHomeKey<CR> 

" FUZZY FINDER: UNITE
let g:unite_source_rec_max_cache_files=0
let g:unite_prompt='» '
if executable('ack-grep')
    let g:unite_source_grep_command='ack-grep'
    let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
endif

nnoremap <Leader>c :Unite -start-insert file/async file_rec/async<CR>
nnoremap <Leader>b :Unite -quick-match buffer<CR>
nnoremap <Leader>m :Unite -start-insert outline<CR>
nnoremap <Leader>/ :Unite -start-insert grep:<CR>
nnoremap <Leader>f :Unite -start-insert line<CR>

" AIR LINE
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_powerline_fonts = 1
let g:Powerline_symbols = "fancy"

" EXPAND REGION
map <C-=> <Plug>(expand_region_expand)
map <C--> <Plug>(expand_region_shrink)

" VIM SNIPPETS
imap <C-j> <Plug>snipMateTrigger

" XKB SWITCH
let g:XkbSwitchEnabled = 0 
let g:XkbSwitchIMappings = ['ru']

" ACK.VIM
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
