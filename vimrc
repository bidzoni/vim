set nocompatible   " Disable vi-compatibility
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' 
Plugin 'bash-support.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'diepm/vim-rest-console'
Plugin 'easymotion/vim-easymotion'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'matchit.zip'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'shougo/neocomplete.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'ervandew/supertab'
Plugin 'shougo/vimproc.vim'
Plugin 'shougo/vimshell.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tfnico/vim-gradle'
" Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'falstro/ghost-text-vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'plasticboy/vim-markdown'
Plugin 'SQLComplete.vim'
Plugin 'thinca/vim-logcat'
" Color scheme
Plugin 'blueshirts/darcula'

call vundle#end()            
filetype plugin indent on   

" COMMON VIM SETTINGS

au! BufWritePost *vimrc source ~/.vimrc

"setting gui options
if has('gui_running')
	" set lines=47 columns=105
    set guioptions=aegrLt
    set guioptions-=e
    set guioptions-=m
    set guioptions=
    " if has ("win32")
    "     set guifont=Consolas:h9
    " else
    "     set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
    " endif
    highlight Pmenu ctermbg=238 gui=bold
    colorscheme darcula
else
    colorscheme slate
endif

if version >= 700
    set history=64
    set undolevels=128
    set undodir=~/.vim/undodir/
    set undofile
    set undolevels=1000
    set undoreload=10000
    highlight Pmenu guibg=brown gui=bold
endif

nnoremap <Space> <Nop>
let mapleader = " "

"256 color support
set t_Co=256

autocmd ColorScheme * hi SpellBad NONE
set autoindent
set smartindent
set cindent
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
set tags=~/.vim/tags/*;./.tags;/
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set iskeyword=@,48-57,_,192-255
set wrap
set tw=0 
set formatoptions-=t
set wildmenu
set wildmode=longest,list,full
set wildignorecase
syntax on


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

nmap <F2> :nohlsearch<CR>

" meta key fixing
inoremap <F1> <C-^>
inoremap <c-space> <C-^>
inoremap <c-\> <C-^>
noremap <c-g> <Esc>
inoremap <m-l> <Right>
inoremap <m-h> <Left>
inoremap <m-k> <Up>
inoremap <m-j> <Down>

vmap <C-y> "=y
map <F11> :call VimCommanderToggle()<CR>
map <F12> :ConqueTerm bash<CR>
map j gj
map k gk
nmap gbn :bn<cr>
nmap gbp :bp<cr>
nmap <leader>k :bd<cr>
nmap <leader>r :b#<cr>
nnoremap <C-tab> :bn<cr>
nnoremap <C-S-tab> :bn<cr>

behave mswin
function! Tags(lang)
    let cmd="ctags-exuberant -R --language-force=" . a:lang . " -f.tags"
    execute "!" . cmd
    set tags=.tags
endfunction

" PLUGINS

" AUTOCOMPLETE: neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_auto_select = 0
" undo completion
inoremap <expr><C-g>     neocomplete#undo_completion()
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>\<Space>" : "\<Space>"


inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd Filetype cpp set omnifunc=omni#cpp#complete#Main
autocmd filetype groovy set dictionary= "~/.vim/dictionary/gradle.dict"

" NERD-COMMENTER
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" NERD-TREE
nmap <F3> :NERDTreeToggle<CR> 

" FUZZY FINDER: UNITE
" let g:unite_source_rec_max_cache_files=0
" let g:unite_prompt='» '
" if executable('ag')
    " let g:unite_source_grep_command='ag'
    " let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
" endif

" nnoremap <Leader>c :Unite -start-insert file_rec/async<CR>
" nnoremap <Leader>b :Unite -start-insert buffer<CR>
" nnoremap <Leader>m :Unite -start-insert outline<CR>
" nnoremap <Leader>/ :Unite -start-insert grep:<CR>
" nnoremap <Leader>l :Unite -start-insert line<CR>
" nnoremap <Leader>f :Unite -start-insert file<CR>

" FUZZY FINDER: FZF
nnoremap <Leader>c :GitFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>m :BTags<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>f :FufFile<CR>

" AIR LINE
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
" let g:airline_symbols.space = "\ua0"
" let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_powerline_fonts = 1
let g:Powerline_symbols = "fancy"

" EXPAND REGION
map <C-=> <Plug>(expand_region_expand)
map <C--> <Plug>(expand_region_shrink)

" VIM SNIPPETS
imap <C-j> <Plug>snipMateTrigger

" ACK.VIM
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>/ :Ack!<Space>

" SUPERTAB
let g:SuperTabDefaultCompletionType = "context"

" AUTOPAIR
let g:AutoPairsShortcutJump = "<C-Enter>"
set nocompatible   " Disable vi-compatibility

" FUGITIVE
nnoremap <C-`> :Gstatus<CR>
nnoremap <Leader>` :Gstatus<CR>
