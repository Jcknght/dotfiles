set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"############ List of plugins ################

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Pretty neat status bar, light as air
Plugin 'bling/vim-airline'

" Super simple vim plugin to show the list of 
" buffers in the command bar. 
Plugin 'bling/vim-bufferline'

" Plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Plugin on GitHub, mattn/emmet-vim
Plugin 'mattn/emmet-vim'

" Plugin python-mode
" Plugin 'klen/python-mode'

"Plugin nerdtree
Plugin 'scrooloose/nerdtree'

"Plugin syntastic
Plugin 'scrooloose/syntastic'

"Plugin headerENSIBSCYBER
Plugin 'thmsaurel/header'

call vundle#end()            " required
filetype plugin indent on    " required

"##############################################
"##############################################
"##############################################

set t_Co=256
colorscheme molokai
set background=dark

" Display the cursor position on the last line of the screen or in the status
" line of a window
" set ruler

" Display line numbers on the left
set number

syntax on

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch


" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Enable use of the mouse for all modes
"set mouse=a


" Set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue"
set cmdheight=2

"########################################
"############## Remaping ################
"########################################
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"###########################################
"############## Airline-vim ################
"###########################################

" Display the bar all the time
set laststatus=2

" Set theme
let g:airline_theme='murmur'

set timeoutlen=30

" Set symbols for delimiters

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Modification des sections
let g:airline_section_z = ' %l / %L : %c '

"###########################################
"################ pymode  ##################
"###########################################

"###########################################
"
"###########################################
"################"Nerdtree#################
map <F3> :NERDTreeToggle<CR>
"##########################################
runtime! config/**/*.vim

"Basic for Header ENSIBS
let g:header_author = "Jack Avlis"

"Settings Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/path/to/python3'
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_enable_perl_checker = 1

