set nocompatible              " be iMproved, required
filetype off                  " required

let python_highlight_all=1

"pathogen
filetype plugin indent on
syntax on

execute pathogen#infect()

" Autocompletion configuration
set wildmode=longest:full
set wildmenu

" Tab key configuration (use 4 spaces)
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab       " Use spaces instead of tabs

" Extended % matching
runtime macros/matchit.vim

" Put all temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Other settings
set ruler           " Show the line and column number in status line
set showcmd         " Show (partial) command in status line
set laststatus=2    " Always show status line
set showmode        " Display current editing mode
set title           " Make the window title reflect the file being edited
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set history=1000    " Set history to 1000 entries
set nu              " Line numbers
set nowrap          " No line breaks
set incsearch       " Enable incremental search
set hlsearch        " Highlight search results
set backspace=2     " Allow backspacing over everything
set hidden          " Better support to put buffers in the background
set scrolloff=3     " Scroll 3 lines before reaching the current viewport end
set foldmethod=marker " Use markers for folding
set tabpagemax=50   " Max tabs for vim -p

" Switch split
map + <C-w>w
" Change split size
map <C-j> <C-w>-
map <C-k> <C-w>+
map <C-h> <C-w><
map <C-l> <C-w>>


"TagBar
nmap <F8> :TagbarToggle<CR>

" OmniCppComplete
set nocp
filetype plugin on
" " build tags of your own project with Ctrl-F12
map <F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extras=+q .<CR>

" Ctr+\ - Open the definition in a vertical split
map <C-\> :vsplit <CR>:exec("tag ".expand("<cword>"))<CR>

"
" " OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" " automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" This lets you use the tab key
" normally when the cursor is at the beginning of a line or not on a word,
" otherwise it executes the control-p completion key
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
    endfunction

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" Keep/Open session
noremap <F1> :mksession! .session <cr>
noremap <F2> :source .session <cr>

"Powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

" CVE-2019–12735
set modelines=0
set nomodeline

"Pydoc
"autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
" change pydocstring - it conflicts with windows resize
nmap <C-c> <Plug>(pydocstring)

" auto remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

noremap <F5> :!python setup.py install <cr>

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" autocomplete comments
set formatoptions=r

"#eof
