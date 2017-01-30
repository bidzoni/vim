call pathogen#infect()

au! BufWritePost *vimrc source ~/.vimrc

let g:XkbSwitchEnabled = 0 
let g:XkbSwitchIMappings = ['ru']

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

au ColorScheme * hi SpellBad NONE
set clipboard=unnamed
set shellslash
set grepprg=grep\ -nH\ $*
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set spelllang=ru,en
set spell
set relativenumber

let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'

"set foldmethod=syntax
filetype plugin on 
filetype indent on
set ofu=syntaxcomplete#Complete

let g:neocomplcache_enable_at_startup = 0
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<C-x><C-o>"
let g:SuperTabContextDiscoverDiscovery = ["<C-x><c-o>","<C-x><x-u>","<C-x><c-k>","<C-x><c-p>","<C-x><C-f>","<C-x>s"]
let g:SuperTabRetainCompletionDuration = "session"

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_autoclose = 1

" completion menu like IDE
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_powerline_fonts = 1
let g:Powerline_symbols = "fancy"

"
" java settings
"
au  Filetype java set omnifunc=javacomplete#Complete

" cpp settings
"
au  Filetype cpp set omnifunc=omni#cpp#complete#Main
 " Clang Complete Settings
let g:clang_complete_auto = 0
let g:clang_complete_copen = 1
let g:clang_library_path='/usr/lib/libclang.so'

" Unite
"let g:unite_split_rule = 'botright'
let g:unite_source_rec_max_cache_files=0
let g:unite_prompt='» '
if executable('ack-grep')
    let g:unite_source_grep_command='ack-grep'
    let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
endif

nnoremap <C-n> :Unite -start-insert file/async file_rec/async<CR>
nnoremap <C-b> :Unite -quick-match buffer<CR>
nnoremap <C-p> :Unite -start-insert outline<CR>
nnoremap <leader>/ :Unite -start-insert grep:<CR>
nnoremap <leader>f :Unite -start-insert line<CR>

" so, i change ctrlp with unite plugin... it's amazing))
"let g:ctrlp_dotfiles = 0
"let g:ctrlp_show_hidden = 0
  "let g:ctrlp_custom_ignore = {
    "\ 'dir':  '\v[\/]\.(git|hg|svn|bin|build|target)$',
    "\ 'file': '\v\.(exe|so|dll|class)$',
    "\ }
"let g:ctrlp_by_filename = 1
"let g:ctrlp_map = '<c-n>'
""let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_max_files= 0
"let g:ctrlp_wokring_path_mode = 'ra'
"let g:ctrlp_extensions = ['tag']
"map <C-b> <ESC>:CtrlPBuffer<CR>
"map <C-p> <ESC>:CtrlPTag<CR>

" gradle settings
"
au filetype groovy set makeprg="grandle build"
au filetype groovy set dictionary= "~/.vim/dictionary/gradle.dict"
"
" other files
"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

colorscheme desert
set hls!
set ignorecase
set infercase
set incsearch
set sm!
set nu!
set ai!
set cursorline
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set showtabline=2
set mousehide
set shellslash
set showcmd
set hidden
set autoread
"set completeopt=longest,menuone,preview
set tags=./.tags;/

nnoremap <F9> :<C-U>MakeshiftBuild<CR>
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
" Set the status line the way i like it
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

"abbrev:
iab utf! # -*- coding: utf-8 -*-


nmap <F2> :nohlsearch<CR>
nnoremap <M-j> mz:m+<CR>`z==
nnoremap <M-k> mz:m-2<CR>`z==
inoremap <M-j> <Esc>:m+<CR>==gi
inoremap <M-k> <Esc>:m-2<CR>==gi
vnoremap <M-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

nmap <F4> :TagbarToggle<CR> 
let g:tagbar_compact = 1

nmap <F3> :NERDTreeTabsToggle<CR> 
imap <F1> <C-^>
vmap <C-y> "=y
map <F11> :call VimCommanderToggle()<CR>
map <F12> :ConqueTerm bash<CR>
imap <silent> <Home> <C-O>:SmartHomeKey<CR> 
map j gj
map k gk

set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
behave mswin
set iskeyword=@,48-57,_,192-255


" wrapping and line breaking
set wrap
set tw=0 
set formatoptions-=t

function Tags(lang)
    let cmd="ctags-exuberant -R --language-force=" . a:lang . " -f.tags"
    execute "!" . cmd
    set tags=.tags
endfunction

"set diffexpr=!MyDiff()
"function MyDiff()
    "let opt = '-a --binary '
    "if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    "if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    "let arg1 = v:fname_in
    "if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    "let arg2 = v:fname_new
    "if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    "let arg3 = v:fname_out
    "if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    "let eq = ''
    "if $VIMRUNTIME =~ ' '
        "if &sh =~ '\<cmd'
            "let cmd = '""' . $VIMRUNTIME . '\diff"'
            "let eq = '"'
        "else
            "let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        "endif
    "else
        "let cmd = $VIMRUNTIME . '\diff'
    "endif
    "silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction


