
" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Enable syntax highlighting
syntax on

" vim-plug
call plug#begin()

	" colorschemes
	Plug 'AlessandroYorba/Despacio'
	Plug 'altercation/vim-colors-solarized'
	Plug 'flazz/vim-colorschemes'
	Plug 'vim-airline/vim-airline-themes'

	Plug 'AndrewRadev/splitjoin.vim'
	Plug 'AndrewRadev/switch.vim'                       " switches segments of text with predefined replacements
	Plug 'Chiel92/vim-autoformat'
	Plug 'MarcWeber/vim-addon-mw-utils'
	Plug 'Raimondi/delimitMate'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'airblade/vim-gitgutter'
	Plug 'chrisbra/Recover.vim'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'derekwyatt/vim-fswitch'                       " Swap between source and header files
	Plug 'easymotion/vim-easymotion'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'ekalinin/dockerfile.vim'
	Plug 'elzr/vim-json'
	Plug 'enricobacis/vim-airline-clock'
	Plug 'ervandew/supertab' " Suspected collisions with UltiSnips
	Plug 'gcorne/phpfolding.vim'
	Plug 'guns/vim-sexp'
	Plug 'honza/vim-snippets' | Plug 'SirVer/ultisnips' " snippet plugin
	Plug 'idanarye/vim-terminalogy'
	Plug 'itchyny/calendar.vim'
	Plug 'janko-m/vim-test'                             " Run test cases
	Plug 'jceb/vim-orgmode'
	Plug 'junegunn/vim-easy-align'
	Plug 'kamwitsta/mythos'
	Plug 'kshenoy/vim-signature'
	Plug 'majutsushi/tagbar'
	Plug 'mattn/emmet-vim'
	Plug 'mattn/webapi-vim'                             " curl/wget tooling
	Plug 'matze/vim-move'                               " Move visual blocks
	Plug 'mbbill/undotree'                              " undo tree (like gundo)
	Plug 'mhinz/vim-startify'                           " startup page
	Plug 'michaeljsmith/vim-indent-object'
	Plug 'myusuf3/numbers.vim'
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'nelstrom/vim-visual-star-search'              " use  # and * on visual selections
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'octol/vim-cpp-enhanced-highlight'             " exactly what it says on the tin
	Plug 'othree/html5.vim'
	Plug 'pangloss/vim-javascript'
	Plug 'pseewald/vim-anyfold'
	Plug 'romainl/vim-cool'
	Plug 'scrooloose/nerdcommenter'
	Plug 'scrooloose/nerdtree'
	Plug 'sheerun/vim-polyglot'
	Plug 'skywind3000/asyncrun.vim'
	"Plug 'terryma/vim-expand-region'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'tmhedberg/SimpylFold'
	Plug 'tomasiser/vim-code-dark'
	Plug 'tommcdo/vim-exchange'
	Plug 'tomtom/tlib_vim'
	Plug 'tpope/vim-abolish'
	Plug 'tpope/vim-characterize'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-dispatch'
	Plug 'tpope/vim-endwise'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-jdaddy'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-rsi'
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-speeddating'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-scripts/DrawIt'
	Plug 'vim-scripts/OmniCppComplete'                  " Look at the tin
	Plug 'vim-scripts/SyntaxRange'
	Plug 'vim-scripts/utl.vim'
	Plug 'vim-syntastic/syntastic'
	Plug 'vimwiki/vimwiki'
	Plug 'wellle/targets.vim'
	Plug 'wesQ3/vim-windowswap'
	Plug 'xolox/vim-misc'
	Plug 'xolox/vim-notes'
	Plug 'xolox/vim-reload'                             " automatically reload vimscripts
	Plug 'xolox/vim-session'
	Plug 'junegunn/vim-peekaboo' " Register/macro display sidebar

	" Todo plugins
	Plug 'freitass/todo.txt-vim'
	Plug 'blindFS/vim-taskwarrior'

	" Writing plugins
	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/limelight.vim'
	Plug 'junegunn/vim-online-thesaurus'

call plug#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
 set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Use space instead of tabs,
"set expandtab
set tabstop=4
set shiftwidth=4

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, ilocksct does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Let me paste things repeatedly
xnoremap p pgvy
xnoremap P Pgvy

" Normalize Y operation with D
:map Y y$

" Font and Fontsize
set guifont=Consolas:h11

" Windows splitting
set splitbelow
set splitright

" Folding settings
set foldmethod=syntax
set foldopen-=block
set nofoldenable
let c_no_comment_fold = 1

" Realtime updates
set autoread

" No swap files
set noswapfile

set guioptions=c
" set guioptions-=m  "remove menu bar
" set guioptions-=T  "remove toolbar
" set guioptions-=r  "remove right-hand scroll bar
" set guioptions-=L  "remove left-hand scroll bar
" set guioptions-=M

" yank straight to system clipboard
set clipboard=unnamed

" Window launch size configuration
if has("gui_running")
	" GUI is running or is about to start.
	" Maximize gvim window (for an alternative on Windows, see simalt below).
	set lines=999 columns=999
	" Default theme
    set background=dark
    colorscheme solarized
	let g:airline_theme='solarized'
else
	" This is console Vim.
	if exists("+lines")
		set lines=50
	endif
	if exists("+columns")
		set columns=100
	endif
	" Default theme
	set background=dark
	colorscheme despacio
	let g:airline_theme='base16_default'
endif

" Make <space> leader
nnoremap <space> <nop>
let mapleader="\<space>"

" Timestamp Keybindings
nnoremap <leader>t i<C-R>=strftime("%Y-%m-%dT%H:%M:%S")<CR><Esc>

" No wordwrap
set wrap!
set textwidth=0

" vimwiki things
let wiki = {}
let wiki.path = '~/Vimwiki/'
let wiki.auto_toc = 1
let wiki.auto_tags = 1
let wiki.syntax = 'markdown'

"let g:vimwiki_folding = 'expr'
let g:vimwiki_list = [wiki]

" turn on delimitMate
let delimitMate_expand_cr = 1

" always update working directory of vim files
set autochdir

" Scratch things
let g:scratch_top = 0

" airline things
"let g:airline_section_y = airline#section#create(['ffenc', '%{strftime("%Y-%m-%dT%H:%M:%S")}'])
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#clock#format = '%Y-%m-%dT%H:%M:%S'
let g:airline#extensions#clock#updatetime = 500

" Statusline
set statusline=%{fugitive#statusline()}
nnoremap <silent> <leader>, :Gstatus<CR>
nnoremap <silent> <leader>] :Gpush<CR>
nnoremap <silent> <leader>[ :Gpull<CR>

" nerdtree-git-plugin things
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "~",
    \ "Staged"    : "+",
    \ "Untracked" : "*",
    \ "Renamed"   : "r",
    \ "Unmerged"  : "!",
    \ "Deleted"   : "-",
    \ "Dirty"     : ".",
    \ "Clean"     : " ",
    \ "Ignored"   : "x",
    \ "Unknown"   : "?"
    \ }

"Journal things let g:journal_encrypted = 1

"" Maps Alt-[h,j,k,l] to resizing a window split
"nnoremap <silent> <A-h> <C-w><
"nnoremap <silent> <A-j> <C-w>-
"nnoremap <silent> <A-k> <C-w>+
"nnoremap <silent> <A-l> <C-w>>

" Easyalign mappings
vmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

" windowswap bindings
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>sw :call WindowSwap#EasyWindowSwap()<CR>

" session
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" Calender
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" encryption things
set cm=blowfish2

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E221,E241'

" autoformatter things
let g:formatter_yapf_style = 'google'

" better whitespace settings
autocmd BufEnter * EnableStripWhitespaceOnSave

" Easymotion things
"map <Space><Space> <Plug>(easymotion-prefix)
"map <Space><Space><Space> <Plug>(easymotion-jumptoanywhere)

" anyfold
let g:anyfold_activate=1

" maps ctrl-J to break a line at that point
nnoremap <NL> i<CR><ESC>

"s supertab things
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

" Tagbar things
nnoremap <silent> <leader>m :TagbarToggle<CR>

" NERDTree things
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" AsyncRun
nnoremap \! :AsyncRun<Space>
noremap <leader>c :call asyncrun#quickfix_toggle(8)<cr>
augroup vimrc
	autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END
let g:asyncrun_timer = -1

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window
" really ugly hack to make the Utilsnip snippet hack work on both windows and linux
if has('win32')
	set runtimepath+=~/vimfiles/localsnippets
	let g:UltiSnipsSnippetsDir = '~/vimfiles/localsnippets'
	let g:UltiSnipsSnippetDirectories = ['~/vimfiles/Ultisnips', 'UltiSnips', 'localsnippets']
else
	set runtimepath+=~/.vim/localsnippets
	let g:UltiSnipsSnippetsDir = '~/.vim/localsnippets'
	let g:UltiSnipsSnippetDirectories = ['~/.vim/Ultisnips', 'UltiSnips', 'localsnippets']
endif

" switch.vim bindings
nnoremap <leader>s :Switch<CR>

" Editorconfig things
" Note that this requires the installation of an external package
" https://github.com/editorconfig/editorconfig-core-c
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']


