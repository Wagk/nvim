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
	Plug 'ericbn/vim-solarized'
    Plug 'iCyMind/NeoSolarized'
    Plug 'plan9-for-vimspace/acme-colors'

	" better statusline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

    " Parenmatch plugins
	Plug 'Raimondi/delimitMate'
	Plug 'tpope/vim-surround'

    Plug 'tommcdo/vim-lion'
	" Plug 'junegunn/vim-easy-align'
	Plug 'nelstrom/vim-visual-star-search' " use  # and * on visual selections
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'tpope/vim-abolish'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-speeddating'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-sensible'
	Plug 'wellle/targets.vim'
	Plug 'ctrlpvim/ctrlp.vim'
	" Plug 'FooSoft/vim-argwrap'

    Plug 'tpope/vim-jdaddy'


	" Filetype plugins
	Plug 'docker/docker', {'rtp': '/contrib/syntax/vim/'}
    Plug 'stanangeloff/php.vim'
    Plug 'pboettch/vim-cmake-syntax'
    Plug 'vim-python/python-syntax'
    Plug 'leafgarland/typescript-vim'

    " Visual block movement
    " Plug 'matze/vim-move'

    " Commenting plugins
	Plug 'tpope/vim-commentary'

    " Textobjects
    " kana/vim-textobj-user is a dependency for the below
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-line'
    Plug 'glts/vim-textobj-comment'
	Plug 'michaeljsmith/vim-indent-object'

	" upgraded f, F, t, T
	Plug 'rhysd/clever-f.vim'

	" Directory searching
	Plug 'tpope/vim-vinegar'
	Plug 'dkprice/vim-easygrep'

	" Git things
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'

	" tags management
	" Plug 'xolox/vim-misc' | Plug 'xolox/vim-easytags'
    Plug 'ludovicchabant/vim-gutentags'

	" Folding plugins
	Plug 'rayburgemeestre/phpfolding.vim'
	Plug 'tmhedberg/SimpylFold'

	" Japanese text insertion (though it's pretty terrible and we should just
	" use the OS one
	" にほんごはvimmuです。
	Plug 'tyru/skk.vim'
	Plug 'tyru/skkdict.vim'

    Plug 'tyru/restart.vim'

    " Snippets plugins
    " TODO: This might be a mistake but whatever
    Plug 'SirVer/ultisnips'
    " Sometimes provided snippets don't make sense
    " Plug 'honza/vim-snippets'

call plug#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple
" files in the same editor window. Users can use multiple split windows or
" multiple tab pages to edit multiple files, but it is still best to enable an
" option to allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also
" allows you to keep an undo history for multiple files when re-using the same
" window in this way. Note that using persistent undo also lets you undo in
" multiple files even in the same window, but is less efficient and is
" actually designed for keeping undo history after closing Vim entirely. Vim
" will complain if you try to quit without saving, and swap files will keep
" you safe if your computer crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmode=longest,list:longest,full
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches
set hlsearch
nnoremap <ESC> :nohl<CR><ESC>

set incsearch

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
set infercase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" wordwrap
set nowrap
set textwidth=0

" Use space instead of tabs,
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set showbreak=\\>>
" set breakindent
" set breakindentopt=sbr

" Set max syntax for performance reasons
set synmaxcol=200

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, ilocksct does what most users
" coming from other editors would expect.
"set nostartofline

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

" disable redrawing for macros
set lazyredraw

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue
set cmdheight=2

" Do not display line numbers on the left
set nonumber

" Set initial window parameters
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif


" Quickly time out on keycodes, but never time out on mappings
" set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Define some useful variables
if has('nvim')
    let s:MyVimConfigDir = substitute($MYVIMRC, 'init.vim', '', '')
else
    let s:MyVimConfigDir = substitute($MYVIMRC, 'vimrc', '', '')
endif

" Let me paste things repeatedly
xnoremap p pgvy
xnoremap P Pgvy

" Normalize Y operation with D
map Y y$

" shortcut line completion
inoremap <C-l> <C-x><C-l>

" maps ctrl-j and Alt-j to break a line at that point
nnoremap <NL> i<CR><ESC>==
nnoremap <M-j> i<CR><ESC>==

" Windows splitting
set splitbelow
set splitright

" Folding settings
set foldmethod=syntax
set nofoldenable

" Solarized
try
    " termguicolors causes putty to spaz out
    set termguicolors
    set background=dark
    if has('nvim')
        colorscheme NeoSolarized
    else
        colorscheme solarized
    endif

    " set colourcolumn
	" set colorcolumn=80
endtry

" Realtime updates
set autoread

" No swap files
set noswapfile

" yank straight to system clipboard
set clipboard=unnamed

" Make <space> leader
nnoremap <space> <nop>
let mapleader="\<space>"

" Map noh to something
nnoremap <silent> <leader>\ :noh<CR>

" " Timestamp Keybindings
" inoremap <F5> <C-R>=strftime("%Y-%m-%dT%H:%M:%S")<CR>
" nnoremap <F5> i<C-R>=strftime("%Y-%m-%dT%H:%M:%S")<CR><Esc>

" vim-airline
try
	let g:airline_theme = 'solarized'
endtry

" turn on delimitMate
let delimitMate_expand_cr = 1

" easytags
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
let g:easytags_suppress_ctags_warning = 1

" fugitive
try
	nnoremap <silent> <leader>, :Gstatus<CR>
endtry

" Gitgutter
try
    let g:gitgutter_signs = 0
    nmap ]h <Plug>GitGutterNextHunk
    nmap [h <Plug>GitGutterPrevHunk
    omap ih <Plug>GitGutterTextObjectInnerPending
    omap ah <Plug>GitGutterTextObjectOuterPending
    xmap ih <Plug>GitGutterTextObjectInnerVisual
    xmap ah <Plug>GitGutterTextObjectOuterVisual
endtry

" " Easyalign mappings
" try
" 	vmap <leader>= <Plug>(EasyAlign)
" 	nmap <leader>= <Plug>(EasyAlign)
" endtry

" " Argwrap things
" try
" 	nnoremap <leader>+ :ArgWrap<CR>
" endtry

" CtrlP mappings
let g:ctrlp_map = '_'
let g:ctrlp_cmd = 'CtrlPMixed'

" Ultisnips mappings
let g:UltiSnipsNoPythonWarning    = 1
let g:UltiSnipsEditSplit          = 'context'
let g:UltiSnipsSnippetDirectories = [s:MyVimConfigDir . "UltiSnips"]
nnoremap <leader>ss :UltiSnipsEdit<CR>

if has('nvim')
	set inccommand=nosplit

	" terminal stuff
	tnoremap <Esc> <C-\><C-n>
	nnoremap <C-c> i<C-c><C-\><C-n>
endif

" gvim things
if has('gui_running')
    set guioptions=
    set guifont=courier_new:h11
endif

" syntax rehighlighting
noremap <silent> <F12> <Esc>:syntax sync fromstart<CR>
inoremap <silent> <F12> <C-o>:syntax sync fromstart<CR>

" Whitespace stripping on save
let g:strip_whitespace_on_save = 1

" simplify finding an init file
command! Init tabe $MYVIMRC
