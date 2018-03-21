" Vundle config { 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Themes and looks {
  Plugin 'reewr/vim-monokai-phoenix'
  Plugin 'luochen1990/rainbow'
  let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
  source ~/.vim/rainbowParantheses.vim

  " Visualization of buffers
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'

  let g:airline_solarized_bg='dark'
" }

" AutoCompletion & Snippets {
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'SirVer/ultisnips'     " SirVir engine tracker, needed for snippets
  Plugin 'honza/vim-snippets'   " Actual snippets
  Plugin 'ervandew/supertab'
  Plugin 'Quramy/tsuquyomi'     " TypeScript tjofras
  Plugin 'vim-syntastic/syntastic' " Syntax checker

  " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
  " Make YCM compatible with UltiSnips (using supertab)
  let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
  let g:SuperTabDefaultCompletionType    = '<C-n>'
  let g:SuperTabClosePreviewOnPopupClose = 1

  " Better key bindings for UltiSnipsExpandTrigger
  let g:UltiSnipsExpandTrigger       = "<tab>"
  let g:UltiSnipsJumpForwardTrigger  = "<tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" }

" Syntastic {
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
" }

" TypeScript
Plugin 'leafgarland/typescript-vim'
Plugin 'HerringtonDarkholme/yats.vim'

" Python
Plugin 'vim-scripts/indentpython.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }



" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" Remove menus in gvim {
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
" }

set guifont=Inconsolata\ 13

"" Source vimrc when saving vimrc {
augroup source_vimrc
  autocmd!
  if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
  endif
augroup END
"" }

" Search {
  set hlsearch            " Highlight search results
  set incsearch           " Search while typing
  set ignorecase          " Search is NOT case sensitive, force sensitive with backslash-C
  set smartcase           " Search case sensitive using capital letters
" }

"" Color scheme {
  set background=dark
  colorscheme monokai-phoenix
"" } 

" vim-airline {
  " Enable the list of buffers
  let g:airline#extensions#tabline#enabled = 1

  " Show just the filename
  let g:airline#extensions#tabline#fnamemod = ':t'

  " This allows buffers to be hidden if you've modified a buffer.
  " This is almost a must if you wish to use buffers in this way.
  set hidden

  " To open a new empty buffer
  " This replaces :tabnew which I used to bind to this mapping
  nmap <leader>T :enew<cr>

  " Move to the next buffer
  "nmap <leader>l :bnext<CR>
  nmap <tab> :bnext!<CR>

  " Move to the previous buffer
  nmap <S-tab> :bprevious<CR>

  " Close the current buffer and move to the previous one
  " This replicates the idea of closing a tab
  nmap <leader>bq :bp <BAR> bd #<CR>

  " Show all open buffers and their status
  nmap <leader>bl :ls<CR>
" }

" Other keybinds {
  map - $
  map! jk <ESC>
  nmap <silent> <Space> :nohlsearch<Bar>:echo<CR>
  nnoremap <F2> :source $MYVIMRC<CR>
  " Save with <Shift>s (<Ctrl> s is flow control-something, don't even try...)
  nnoremap S :w<CR>
" }

"" Line number {
  set relativenumber  " Line numbers are relative to current line
  set number          " Display actual number for current line
"" }

"" Indentation {
  set expandtab       " Convert tabs to spaces
  set tabstop=2       " Number of spaces per tab character
  set softtabstop=-1  " Number of spaces using <Tab> or <BS>
  set shiftwidth=0    " Number of spaces used for auto indentation
  set shiftround      " Round  <  and  >  indents to a multiple of shiftwidth
  set autoindent
""}

" Line highlighting {
  set cursorline
  "hi CursorLine cterm=NONE ctermbg=red
  set colorcolumn=80
" }


" Misc {
  set encoding=utf-8
  set scrolloff=8     " Scroll offset
  set lazyredraw      " Only redraw when needed
" }

" Backup {
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
    set undolevels=1000
    set undoreload=10000
  endif
endif

set backupdir=~/.vim/tmp,. " Store backups here instead
set directory=~/.vim/tmp,. " I think this stores swapfiles in /tmp as well?
" }

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
