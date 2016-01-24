 set nocompatible              " be iMproved, required
 filetype off                  " required

 " set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 " " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')
 "
 " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'
 
 " The following are examples of different formats supported.
 " Keep Plugin commands between vundle#begin/end.
 " plugin on GitHub repo
 Plugin 'tpope/vim-fugitive'
 " plugin from http://vim-scripts.org/vim/scripts.html
 Plugin 'L9'
 Plugin 'DfrankUtil'
 Plugin 'EasyMotion'
 " Plugin for the Scala syntax
 Plugin 'derekwyatt/vim-scala'
 Plugin 'clones/vim-genutils'
 Plugin 'elzr/vim-json'
 Plugin 'nathanaelkane/vim-indent-guides'
 Plugin 'terryma/vim-multiple-cursors' 
 Plugin 'endel/vim-github-colorscheme'
 Plugin 'GEverding/vim-hocon'
 Plugin 'godlygeek/tabular'
 Plugin 'gregsexton/gitv'
 Plugin 'nanotech/jellybeans.vim'
 Plugin 'noahfrederick/vim-hemisu'
 " Plugin to check for improvemement in search 
 " Plugin 'rking/ag.vim'
 Plugin 'Shougo/vimproc.vim'
 Plugin 'Shougo/unite.vim'
 Plugin 'scrooloose/nerdtree'
 Plugin 'sjl/gundo.vim'
 Plugin 'tpope/vim-surround'
 Plugin 'tpope/vim-markdown'
 Plugin 'vim-scripts/gnupg.vim'
 Plugin 'xolox/vim-misc'
 
 " Git plugin not hosted on GitHub
 Plugin 'git://git.wincent.com/command-t.git'
 "  git repos on your local machine (i.e. when working on your own plugin)
 " Plugin 'file:///home/gmarik/path/to/plugin'
 " The sparkup vim script is in a subdirectory of this repo called vim.
 " Pass the path to set the runtimepath properly.
 Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 " " Avoid a name conflict with L9
 " Plugin 'user/L9', {'name': 'newL9'}
 
 " All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
 " To ignore plugin indent changes, instead use:
 "filetype plugin on
 "
 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just
 " :PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to
 " auto-approve removal
 "
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this line
" Tabstops are 4 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent


" Printing options
set printoptions=header:0,duplex:long,paper:letter

" set the search scan to wrap lines
set wrapscan

" I'm happy to type the case of things.  I tried the ignorecase, smartcase
" thing but it just wasn't working out for me
set noignorecase


" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Make sure that unsaved buffers that are to be put in the background are 
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

function! DerekFugitiveStatusLine()
  let status = fugitive#statusline()
  let trimmed = substitute(status, '\[Git(\(.*\))\]', '\1', '')
  let trimmed = substitute(trimmed, '\(\w\)\w\+\ze/', '\1', '')
  let trimmed = substitute(trimmed, '/[^_]*\zs_.*', '', '')
  if len(trimmed) == 0
    return ""
  else
    return '(' . trimmed[0:10] . ')'
  endif
endfunction

" Set the status line the way i like it
set stl=%f\ %m\ %r%{DerekFugitiveStatusLine()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]


" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Don't show the current command in the lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

" Show the current mode
set showmode

" Switch on syntax highlighting.
syntax on

" Hide the mouse pointer while typing
set mousehide
 
" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" set the gui options the way I like
set guioptions=acg

" Setting this below makes it sow that error messages don't disappear after one second on startup.
"set debug=msg

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
"      "," key and the "d" key.  If the "d" key isn't pressed before the
"      timeout expires, one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
set timeoutlen=500

" Keep some stuff in the history
set history=100

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" Disable encryption (:X)
set key=

" Make the command-line completion better
set wildmenu

" Same as default except that I remove the 'u' option
" set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Disable it... every time I hit the limit I unset this anyway. It's annoying
set textwidth=0

" get rid of the silly characters in separators
set fillchars = ""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" Automatically read a file that has changed on disk
set autoread

set grepprg=grep\ -nH\ $*

" Trying out the line numbering thing... never liked it, but that doesn't mean
" I shouldn't give it another go :)
set number
set relativenumber

" Types of files to ignore when autocompleting things
set wildignore+=*.o,*.class,*.git,*.svn

" Various characters are "wider" than normal fixed width characters, but the
" default setting of ambiwidth (single) squeezes them into "normal" width, which
" sucks.  Setting it to double makes it awesome.
set ambiwidth=double

" OK, so I'm gonna remove the VIM safety net for a while and see if kicks my ass
set nobackup
set nowritebackup
set noswapfile

" Let the syntax highlighting for Java files allow cpp keywords
let java_allow_cpp_keywords = 1

" I don't want to have the default keymappings for my scala plugin evaluated
let g:scala_use_default_keymappings = 0

" System default for mappings is now the "," character
" let mapleader = ","

" Wipe out all buffers
" nmap <silent> ,wa :call BWipeoutAll()<cr>

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" I don't like it when the matching parens are automatically highlighted
" let loaded_matchparen = 1

" Highlight the current line and column
" Don't do this - It makes window redraws painfully slow
set nocursorline
set nocursorcolumn


"-----------------------------------------------------------------------------
" Indent Guides
"-----------------------------------------------------------------------------
let g:indent_guides_color_change_percent = 3
"let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

"-----------------------------------------------------------------------------
" Fugitive
"-----------------------------------------------------------------------------
" Thanks to Drew Neil
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \  noremap <buffer> .. :edit %:h<cr> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete


"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
nmap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
nmap <S-F7> :NERDTreeClose<CR>

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
                   \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
                   \ '\.embed\.manifest$', '\.embed\.manifest.res$',
                   \ '\.intermediate\.manifest$', '^mt.dep$' ]

"-----------------------------------------------------------------------------
" GPG Stuff
"-----------------------------------------------------------------------------
if has("mac")
    let g:GPGExecutable = "gpg2"
    let g:GPGUseAgent = 0
endif

"-----------------------------------------------------------------------------
" AG (SilverSearcher) Settings
"-----------------------------------------------------------------------------
" function! AgProjectRoot(pattern)
"   let dir = FindCodeDirOrRoot()
"   execute ':Ag ' . a:pattern . ' ' . dir
" endfunction

" command! -nargs=+ AgProjectRoot call AgProjectRoot(<q-args>)

" nmap ,sr :AgProjectRoot 
" let g:agprg = '/usr/local/bin/ag'
" let g:ag_results_mapping_replacements = {
" \   'open_and_close': '<cr>',
" \   'open': 'o',
" \ }

"-----------------------------------------------------------------------------
" FuzzyFinder Settings
"-----------------------------------------------------------------------------
let g:fuf_splitPathMatching = 1
let g:fuf_maxMenuWidth = 110
let g:fuf_timeFormat = ''
nmap <silent> ,fv :FufFile ~/.vim/<cr>
nmap <silent> ,fc :FufMruCmd<cr>
nmap <silent> ,fm :FufMruFile<cr>

let g:CommandTMatchWindowAtTop = 1
let g:make_scala_fuf_mappings = 0

"-----------------------------------------------------------------------------
" CtrlP Settings
"-----------------------------------------------------------------------------
let g:ctrlp_regexp = 1
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_tabpage_position = 'c'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_root_markers = ['.project.root']
let g:ctrlp_user_command = 'find %s -type f | grep -E "\.(conf|scala|java|rb|sh|bash|py|json|js)$" | grep -v -E "/build/|/quickfix|/resolution-cache|/streams|/admin/target|/classes/|/test-classes/|/sbt-0.13/|/cache/|/project/target|/project/project|/test-reports|/it-classes"'
let g:ctrlp_max_depth = 30
let g:ctrlp_max_files = 0
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = '1ri'
let g:ctrlp_match_window = 'max:40'
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-n>'],
  \ 'PrtSelectMove("k")':   ['<c-p>'],
  \ 'PrtHistory(-1)':       ['<c-j>', '<down>'],
  \ 'PrtHistory(1)':        ['<c-i>', '<up>']
\ }
nmap ,fb :CtrlPBuffer<cr>
nmap ,ff :CtrlP .<cr>
nmap ,fF :execute ":CtrlP " . expand('%:p:h')<cr>
nmap ,fr :CtrlP substitute(expand('%:p'), '^\(/webdev/NetLedger[^/]*\)/.*$', '\1', '')<cr>
nmap ,fm :CtrlPMixed<cr>

"-----------------------------------------------------------------------------
" Gundo Settings
"-----------------------------------------------------------------------------
nmap <c-F5> :GundoToggle<cr>

"-----------------------------------------------------------------------------
" Conque Settings
"-----------------------------------------------------------------------------
let g:ConqueTerm_FastMode = 1
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_PromptRegex = '^-->'
let g:ConqueTerm_TERM = 'xterm'

"-----------------------------------------------------------------------------
" EasyTags
"-----------------------------------------------------------------------------
let g:home_code_dir = '/Users/dwyatt/code'
let g:easytags_async = 1
let g:easytags_auto_highlight = 0

"-----------------------------------------------------------------------------
" Local system overrides
"-----------------------------------------------------------------------------
if filereadable($HOME . "/.vimrc.local")
  execute "source " . $HOME . "/.vimrc.local"
endif
