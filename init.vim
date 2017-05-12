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
	Plug 'altercation/vim-colors-solarized'
	"Plug 'vim-airline/vim-airline-themes'

	Plug 'Raimondi/delimitMate' " match parens
	Plug 'junegunn/vim-easy-align'
	Plug 'michaeljsmith/vim-indent-object'
	Plug 'nelstrom/vim-visual-star-search'              " use  # and * on visual selections
	Plug 'ntpeters/vim-better-whitespace'
	Plug 'scrooloose/nerdcommenter'
	Plug 'tmhedberg/SimpylFold'
	Plug 'tpope/vim-abolish'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-speeddating'
	Plug 'tpope/vim-surround'
	"Plug 'vim-airline/vim-airline'
	Plug 'wellle/targets.vim'
	Plug 'ctrlpvim/ctrlp.vim'

	" neovim only things
	Plug 'hkupty/nvimux'

	" maintaining this might be troublesome
	Plug 'Valloric/YouCompleteMe'

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

" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue
set cmdheight=2

" Don't display line numbers on the left
set nonumber

" Quickly time out on keycodes, but never time out on mappings
" set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Let me paste things repeatedly
xnoremap p pgvy
xnoremap P Pgvy

" Normalize Y operation with D
:map Y y$

" maps ctrl-J to break a line at that point
nnoremap <NL> i<CR><ESC>

" Windows splitting
set splitbelow
set splitright

"" Folding settings
set foldmethod=syntax
"set foldopen-=block
"set nofoldenable
let c_no_comment_fold = 1

" Solarized
set background=dark
colorscheme solarized

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
nnoremap <leader>/ :noh<CR>

" Timestamp Keybindings
nnoremap <leader>t i<C-R>=strftime("%Y-%m-%dT%H:%M:%S")<CR><Esc>

" No wordwrap
set wrap!
set textwidth=0

" turn on delimitMate
let delimitMate_expand_cr = 1

" always update working directory of vim files
set autochdir

"" airline things
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#clock#format = '%Y-%m-%dT%H:%M:%S'
"let g:airline#extensions#clock#updatetime = 500

" fugitive
"set statusline=%{fugitive#statusline()}
nnoremap <silent> <leader>, :Gstatus<CR>

" Easyalign mappings
vmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

" CtrlP mappings
let g:ctrlp_map = '<leader>e'

" some nvim specific configs
set inccommand=nosplit

" terminal stuff
:tnoremap <Esc> <C-\><C-n>
:nnoremap <C-c> i<C-c><C-\><C-n>

" simplify finding an init file
command! Init tabe $MYVIMRC
